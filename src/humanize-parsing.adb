with Ada.Characters.Handling;
with Ada.Calendar.Formatting;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;

with Humanize.Messages;

package body Humanize.Parsing is
   use type Humanize.Status.Status_Code;
   use type Humanize.Durations.Duration_Seconds;
   use type Humanize.Colors.RGB_Color;
   use type Ada.Calendar.Time;
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String is
     (Ada.Strings.Fixed.Trim (Text, Ada.Strings.Both));

   function Lower (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         if Text (Index) in 'A' .. 'Z' then
            Result (Index) := Ada.Characters.Handling.To_Lower (Text (Index));
         else
            Result (Index) := Text (Index);
         end if;
      end loop;
      return Result;
   end Lower;

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function Upper (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         Result (Index) := Ada.Characters.Handling.To_Upper (Text (Index));
      end loop;
      return Result;
   end Upper;

   function Is_Digit (Item : Character) return Boolean is
     (Item in '0' .. '9');

   function Is_Alnum (Item : Character) return Boolean is
     (Ada.Characters.Handling.Is_Alphanumeric (Item));

   function Is_Lower_Alnum_Or
     (Item      : Character;
      Separator : Character)
      return Boolean
   is
     ((Item in 'a' .. 'z')
     or else Is_Digit (Item)
     or else Item = Separator);

   function Is_Space (Item : Character) return Boolean is
     (Item = ' ' or else Item = ASCII.HT or else Item = ASCII.LF
      or else Item = ASCII.CR);

   function Word_Count (Text : String) return Natural is
      Count : Natural := 0;
      In_Word : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if not In_Word then
               Count := Count + 1;
            end if;
            In_Word := True;
         else
            In_Word := False;
         end if;
      end loop;
      return Count;
   end Word_Count;

   function Lowercase_Label (Text : String) return Boolean is
      Seen : Boolean := False;
   begin
      for Ch of Text loop
         if Ch in 'A' .. 'Z' then
            return False;
         elsif Ch in 'a' .. 'z' then
            Seen := True;
         end if;
      end loop;
      return Seen;
   end Lowercase_Label;

   function Uppercase_Label (Text : String) return Boolean is
      Seen : Boolean := False;
   begin
      for Ch of Text loop
         if Ch in 'a' .. 'z' then
            return False;
         elsif Ch in 'A' .. 'Z' then
            Seen := True;
         end if;
      end loop;
      return Seen;
   end Uppercase_Label;

   function Title_Case_Label (Text : String) return Boolean is
      At_Word_Start : Boolean := True;
      Seen_Word : Boolean := False;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if At_Word_Start then
               if Ch in 'a' .. 'z' then
                  return False;
               end if;
               Seen_Word := True;
            elsif Ch in 'A' .. 'Z' then
               return False;
            end if;
            At_Word_Start := False;
         else
            At_Word_Start := True;
         end if;
      end loop;
      return Seen_Word;
   end Title_Case_Label;

   function ASCII_Only_Label (Text : String) return Boolean is
   begin
      for Ch of Text loop
         if Character'Pos (Ch) > 127 then
            return False;
         end if;
      end loop;
      return True;
   end ASCII_Only_Label;

   function Starts_With (Text, Prefix : String) return Boolean is
     (Text'Length >= Prefix'Length
      and then Text (Text'First .. Text'First + Prefix'Length - 1) = Prefix);

   function Ends_With (Text, Suffix : String) return Boolean is
     (Text'Length >= Suffix'Length
      and then Text (Text'Last - Suffix'Length + 1 .. Text'Last) = Suffix);

   function Find_Substring (Text, Pattern : String) return Natural is
   begin
      if Pattern'Length = 0 or else Text'Length < Pattern'Length then
         return 0;
      end if;

      for Index in Text'First .. Text'Last - Pattern'Length + 1 loop
         if Text (Index .. Index + Pattern'Length - 1) = Pattern then
            return Index;
         end if;
      end loop;
      return 0;
   end Find_Substring;

   function Has_Spaced_Token (Text, Token : String) return Boolean is
     (Find_Substring (Text, " " & Token & " ") /= 0);

   function Starts_At (Text : String; Index : Natural; Pattern : String)
      return Boolean
   is
   begin
      return Index in Text'Range
        and then Index + Pattern'Length - 1 <= Text'Last
        and then Text (Index .. Index + Pattern'Length - 1) = Pattern;
   end Starts_At;

   function Duration_Conjunction_Length
     (Text  : String;
      Index : Natural)
      return Natural
   is
      Low : constant String := Lower (Text);
   begin
      if Starts_At (Low, Index, "and ") then
         return 4;
      elsif Starts_At (Low, Index, "und ") then
         return 4;
      elsif Starts_At (Low, Index, "och ") then
         return 4;
      elsif Starts_At (Low, Index, "og ") then
         return 3;
      elsif Starts_At (Low, Index, "et ") then
         return 3;
      elsif Starts_At (Low, Index, "en ") then
         return 3;
      elsif Starts_At (Low, Index, "of ") then
         return 3;
      elsif Starts_At (Low, Index, "ja ") then
         return 3;
      elsif Starts_At (Low, Index, "ve ") then
         return 3;
      elsif Starts_At (Low, Index, "y ") then
         return 2;
      elsif Starts_At (Low, Index, "i ") then
         return 2;
      elsif Starts_At (Low, Index, "e ") then
         return 2;
      elsif Starts_At (Low, Index, "a ") then
         return 2;
      elsif Starts_At (Low, Index, B ("D0B820")) then
         return 3;
      elsif Starts_At (Low, Index, B ("D19620")) then
         return 3;
      elsif Starts_At (Low, Index, B ("E381A820")) then
         return 4;
      elsif Starts_At (Low, Index, B ("EBA78F20")) then
         return 4;
      elsif Starts_At (Low, Index, B ("EBB08F20")) then
         return 4;
      elsif Starts_At (Low, Index, B ("E5928C20")) then
         return 4;
      elsif Starts_At (Low, Index, B ("D98820")) then
         return 3;
      elsif Starts_At (Low, Index, B ("E0A494E0A4B020")) then
         return 7;
      else
         return 0;
      end if;
   end Duration_Conjunction_Length;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

   function Normalize_Native_Digits (Text : String) return String is
      Result : Unbounded_String;
      Index  : Natural := Text'First;

      procedure Append_Digit
        (Prefix : String;
         Base   : Character;
         Width  : Natural)
      is
      begin
         for Digit in 0 .. 9 loop
            declare
               Candidate : constant String :=
                 Prefix & Character'Val (Character'Pos (Base) + Digit);
            begin
               if Starts_At (Text, Index, Candidate) then
                  Append (Result, Character'Val (Character'Pos ('0') + Digit));
                  Index := Index + Width;
                  return;
               end if;
            end;
         end loop;
         Append (Result, Text (Index));
         Index := Index + 1;
      end Append_Digit;
   begin
      while Index <= Text'Last loop
         if Starts_At (Text, Index, B ("D9AB")) then
            Append (Result, '.');
            Index := Index + 2;
         elsif Starts_At (Text, Index, B ("D9AC")) then
            Index := Index + 2;
         elsif Starts_At (Text, Index, B ("D9")) then
            Append_Digit (B ("D9"), Character'Val (16#A0#), 2);
         elsif Starts_At (Text, Index, B ("DB")) then
            Append_Digit (B ("DB"), Character'Val (16#B0#), 2);
         elsif Starts_At (Text, Index, B ("E0A5")) then
            Append_Digit (B ("E0A5"), Character'Val (16#A6#), 3);
         else
            Append (Result, Text (Index));
            Index := Index + 1;
         end if;
      end loop;
      return To_String (Result);
   end Normalize_Native_Digits;

   function Normalize_Number_Text
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Seen_Comma : Boolean := False;
      Seen_Dot : Boolean := False;
   begin
      for Ch of Trim (Normalize_Native_Digits (Text)) loop
         if Ch = '_' or else Ch = ' ' then
            null;
         elsif Ch = ',' then
            Seen_Comma := True;
            if not Seen_Dot then
               Append (Result, '.');
            end if;
         elsif Ch = '.' then
            Seen_Dot := True;
            Append (Result, Ch);
         elsif Is_Digit (Ch) or else Ch = '+' or else Ch = '-' then
            Append (Result, Ch);
         else
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      end loop;

      if Seen_Comma and then Seen_Dot then
         return Ok_Text (Trim (Text));
      else
         return Ok_Text (To_String (Result));
      end if;
   end Normalize_Number_Text;

   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Pending_Space : Boolean := False;
   begin
      for Ch of Lower (Trim (Text)) loop
         if Ch = ' ' or else Ch = ASCII.HT or else Ch = '-' then
            Pending_Space := Length (Result) > 0;
         else
            if Pending_Space then
               Append (Result, " ");
               Pending_Space := False;
            end if;
            Append (Result, Ch);
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Normalize_Unit_Text;

   function Normalize_List_Text
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Lower (Trim (Text));
      Result : Unbounded_String;
      Index : Natural := Low'First;
      Pending_Space : Boolean := False;
   begin
      while Index <= Low'Last loop
         if Index + 4 <= Low'Last and then Low (Index .. Index + 4) = " und "
         then
            Append (Result, " and ");
            Index := Index + 5;
            Pending_Space := False;
         elsif Index + 3 <= Low'Last
           and then (Low (Index .. Index + 3) = " og "
                     or else Low (Index .. Index + 3) = " et "
                     or else Low (Index .. Index + 3) = " en ")
         then
            Append (Result, " and ");
            Index := Index + 4;
            Pending_Space := False;
         elsif Low (Index) = ' ' or else Low (Index) = ASCII.HT then
            Pending_Space := Length (Result) > 0;
            Index := Index + 1;
         else
            if Pending_Space then
               Append (Result, " ");
               Pending_Space := False;
            end if;
            Append (Result, Low (Index));
            Index := Index + 1;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Normalize_List_Text;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural)
      return Parse_Error_Kind
   is
   begin
      return Diagnostic (Status, Error_Position, No_Parse_Error);
   end Diagnostic;

   function Diagnostic
     (Status         : Humanize.Status.Status_Code;
      Error_Position : Natural;
      Error          : Parse_Error_Kind)
      return Parse_Error_Kind
   is
   begin
      if Status = Humanize.Status.Ok then
         return No_Parse_Error;
      elsif Error /= No_Parse_Error then
         return Error;
      elsif Status = Humanize.Status.Invalid_Value then
         return Out_Of_Range;
      elsif Status = Humanize.Status.Invalid_Argument
        and then Error_Position = 0
      then
         return Empty_Input;
      elsif Error_Position > 0 then
         return Expected_Number;
      else
         return Unsupported_Form;
      end if;
   end Diagnostic;

   function Diagnostic_Label
     (Kind : Parse_Error_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when No_Parse_Error     => "ok",
            when Empty_Input        => "empty-input",
            when Expected_Number    => "expected-number",
            when Expected_Separator => "expected-separator",
            when Expected_Unit      => "expected-unit",
            when Out_Of_Range       => "out-of-range",
            when Unsupported_Form   => "unsupported-form");
   end Diagnostic_Label;

   function Diagnostic_Message
     (Kind           : Parse_Error_Kind;
      Error_Position : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Position : constant String :=
        (if Error_Position = 0 then ""
         else " at position" & Natural'Image (Error_Position));
   begin
      return Ok_Text
        ((case Kind is
             when No_Parse_Error     => "parsed successfully",
             when Empty_Input        => "expected input",
             when Expected_Number    => "expected a number",
             when Expected_Separator => "expected a separator",
             when Expected_Unit      => "expected a unit",
             when Out_Of_Range       => "value is out of range",
             when Unsupported_Form   => "unsupported input form")
         & Position);
   end Diagnostic_Message;

   procedure Copy_Text
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Text : constant String := To_String (Result.Text);
   begin
      Written := 0;
      if Result.Status /= Humanize.Status.Ok then
         Status := Result.Status;
      elsif Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
      elsif Text'Length > Target'Length then
         if Target'Length > 0 then
            Target (Target'First .. Target'Last) :=
              Text (Text'First .. Text'First + Target'Length - 1);
         end if;
         Written := Target'Length;
         Status := Humanize.Status.Buffer_Overflow;
      else
         if Text'Length > 0 then
            Target (Target'First .. Target'First + Text'Length - 1) := Text;
         end if;
         Written := Text'Length;
         Status := Humanize.Status.Ok;
      end if;
   end Copy_Text;

   procedure Normalize_Number_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Normalize_Number_Text (Text), Target, Written, Status);
   end Normalize_Number_Text_Into;

   procedure Normalize_Unit_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Normalize_Unit_Text (Text), Target, Written, Status);
   end Normalize_Unit_Text_Into;

   procedure Normalize_List_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Normalize_List_Text (Text), Target, Written, Status);
   end Normalize_List_Text_Into;

   procedure Diagnostic_Label_Into
     (Kind    : Parse_Error_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Diagnostic_Label (Kind), Target, Written, Status);
   end Diagnostic_Label_Into;

   procedure Diagnostic_Message_Into
     (Kind           : Parse_Error_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Error_Position : Natural := 0)
   is
   begin
      Copy_Text
        (Diagnostic_Message (Kind, Error_Position), Target, Written, Status);
   end Diagnostic_Message_Into;

   function Has_Decimal_Comma (Text : String) return Boolean is
      Normalized : constant String := Normalize_Native_Digits (Text);
      Comma : Natural := 0;
      Dot   : Natural := 0;
      After : Natural := 0;
   begin
      for Index in Normalized'Range loop
         if Normalized (Index) = ',' then
            Comma := Index;
         elsif Normalized (Index) = '.' then
            Dot := Index;
         end if;
      end loop;

      if Comma = 0 or else Dot /= 0 then
         return False;
      end if;

      for Index in Comma + 1 .. Normalized'Last loop
         if Is_Digit (Normalized (Index)) then
            After := After + 1;
         end if;
      end loop;

      return After /= 3;
   end Has_Decimal_Comma;

   function Numeric_Value (Text : String; Value : out Long_Float) return Boolean is
      Normalized : constant String := Normalize_Native_Digits (Text);
      Clean : String (1 .. Normalized'Length);
      Last  : Natural := 0;
      Use_Comma_Decimal : constant Boolean := Has_Decimal_Comma (Normalized);
   begin
      for Ch of Normalized loop
         if Ch = '_' or else Ch = ' ' then
            null;
         elsif Ch = ',' then
            if Use_Comma_Decimal then
               Last := Last + 1;
               Clean (Last) := '.';
            end if;
         elsif Is_Digit (Ch) or else Ch = '.' or else Ch = '-' or else Ch = '+'
         then
            Last := Last + 1;
            Clean (Last) := Ch;
         else
            return False;
         end if;
      end loop;

      if Last = 0 then
         return False;
      end if;

      Value := Long_Float'Value (Clean (1 .. Last));
      return True;
   exception
      when others =>
         return False;
   end Numeric_Value;

   function Rounded_Nonnegative (Value : Long_Float) return Long_Long_Integer is
   begin
      if Value < 0.0 then
         return -1;
      end if;
      return Long_Long_Integer (Long_Float'Rounding (Value));
   exception
      when others =>
         return -1;
   end Rounded_Nonnegative;

   function Split_Number_Unit
     (Text        : String;
      Number_Text : out Natural;
      Unit_Start  : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Last : Natural := Item'First - 1;
   begin
      Number_Text := 0;
      Unit_Start := 0;
      if Item'Length = 0 then
         return False;
      end if;

      for Index in Item'Range loop
         if Is_Digit (Item (Index))
           or else Item (Index) = '.'
           or else Item (Index) = ','
           or else Item (Index) = '_'
           or else Item (Index) = '+'
           or else Item (Index) = '-'
         then
            Last := Index;
         else
            exit;
         end if;
      end loop;

      if Last < Item'First then
         return False;
      end if;

      Number_Text := Last;
      Unit_Start := Last + 1;
      while Unit_Start <= Item'Last and then Item (Unit_Start) = ' ' loop
         Unit_Start := Unit_Start + 1;
      end loop;
      return Unit_Start <= Item'Last;
   end Split_Number_Unit;

   function Byte_Multiplier (Unit : String) return Long_Float is
      U : constant String := Lower (Trim (Unit));
   begin
      if U = "byte" or else U = "bytes" or else U = "b" then
         return 1.0;
      elsif U = "kb" then
         return 1_000.0;
      elsif U = "mb" then
         return 1_000_000.0;
      elsif U = "gb" then
         return 1_000_000_000.0;
      elsif U = "tb" then
         return 1_000_000_000_000.0;
      elsif U = "kib" then
         return 1_024.0;
      elsif U = "mib" then
         return 1_048_576.0;
      elsif U = "gib" then
         return 1_073_741_824.0;
      elsif U = "tib" then
         return 1_099_511_627_776.0;
      else
         return 0.0;
      end if;
   end Byte_Multiplier;

   function Parse_Bytes
     (Text : String)
      return Byte_Parse_Result
   is
      Source      : constant String := Normalize_Native_Digits (Text);
      Last_Number : Natural;
      Unit_Start  : Natural;
   begin
      if not Split_Number_Unit (Source, Last_Number, Unit_Start) then
         declare
            Item : constant String := Trim (Source);
            Kind : constant Parse_Error_Kind :=
              (if Item'Length = 0 then Empty_Input
               elsif Is_Digit (Item (Item'First))
                 or else Item (Item'First) = '+'
                 or else Item (Item'First) = '-'
               then Expected_Unit
               else Expected_Number);
         begin
            return
              (Status => Humanize.Status.Invalid_Argument,
               Value => 0,
               Error_Position => (if Item'Length = 0 then Text'First
                                  else Item'First),
               Error => Kind,
               others => <>);
         end;
      end if;

      declare
         Item       : constant String := Trim (Source);
         Amount     : Long_Float;
         Multiplier : constant Long_Float :=
           Byte_Multiplier (Item (Unit_Start .. Item'Last));
         Rounded    : Long_Long_Integer;
      begin
         if Multiplier = 0.0
           or else not Numeric_Value (Item (Item'First .. Last_Number), Amount)
         then
            return
              (Status => Humanize.Status.Invalid_Argument,
               Value => 0,
               Error_Position =>
                 (if Multiplier = 0.0 then Unit_Start else Item'First),
               Error =>
                 (if Multiplier = 0.0 then Expected_Unit
                  else Expected_Number),
               others => <>);
         end if;

         Rounded := Rounded_Nonnegative (Amount * Multiplier);
         if Rounded < 0 then
            return
              (Status => Humanize.Status.Invalid_Value,
               Value => 0,
               Error => Out_Of_Range,
               others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Value  => Humanize.Bytes.Byte_Count (Rounded),
            Exact  => Long_Float (Rounded) = Amount * Multiplier,
            Consumed => Item'Length,
            Error_Position => 0,
         Error => No_Parse_Error);
      exception
         when others =>
            return
              (Status => Humanize.Status.Invalid_Value,
               Value => 0,
               Error => Out_Of_Range,
               others => <>);
      end;
   end Parse_Bytes;

   function Scan_End (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Text (Index) = ';' or else Text (Index) = '('
           or else Text (Index) = ')' or else Text (Index) = ASCII.LF
         then
            return Index - 1;
         end if;
      end loop;
      return Text'Last;
   end Scan_End;

   function Scan_Number_End (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Text (Index) = ';' or else Text (Index) = '('
           or else Text (Index) = ')' or else Text (Index) = ASCII.LF
           or else Text (Index) = ' '
         then
            return Index - 1;
         end if;
      end loop;
      return Text'Last;
   end Scan_Number_End;

   function Scan_Bytes
     (Text : String)
      return Byte_Parse_Result
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
            Result : constant Byte_Parse_Result :=
              Parse_Bytes (Text (Text'First .. Stop));
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
   end Scan_Bytes;

   function Unit_Seconds (Unit : String) return Long_Long_Integer is
      U : constant String := Lower (Trim (Unit));
   begin
      if U = "second" or else U = "seconds" or else U = "sec" or else U = "s"
        or else U = "sekund" or else U = "sekunder"
        or else U = "seconde" or else U = "secondes"
        or else U = "sekunde" or else U = "sekunden"
        or else U = "segundo" or else U = "segundos"
        or else U = "secondo" or else U = "secondi"
        or else U = "seconde" or else U = "seconden"
        or else U = "sekunti" or else U = "sekuntia"
        or else U = "sekunda" or else U = "sekundy"
        or else U = "sekundas" or else U = "saniye"
        or else U = B ("D181D0B5D0BAD183D0BDD0B4D0B0")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4D18B")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4")
        or else U = B ("D181D0B5D0BAD183D0BDD0B4D0B8")
        or else U = B ("E7A792")
        or else U = B ("ECB488")
        or else U = B ("E7A792")
        or else U = B ("D8ABD8A7D986D98AD8A9")
        or else U = B ("D8ABD988D8A7D986")
        or else U = B ("D8ABD988D8A7D986D98D")
        or else U = B ("E0A4B8E0A587E0A495E0A482E0A4A1")
      then
         return 1;
      elsif U = "minute" or else U = "minutes" or else U = "min" or else U = "m"
        or else U = "minut" or else U = "minutt" or else U = "minutter"
        or else U = "minuten"
        or else U = "minuto" or else U = "minutos" or else U = "minuti"
        or else U = "minuut" or else U = "minuter"
        or else U = "minuutti" or else U = "minuuttia"
        or else U = "minuta" or else U = "minuty"
        or else U = "dakika"
        or else U = B ("D0BCD0B8D0BDD183D182D0B0")
        or else U = B ("D0BCD0B8D0BDD183D182D18B")
        or else U = B ("D185D0B2D0B8D0BBD0B8D0BDD0B0")
        or else U = B ("D185D0B2D0B8D0BBD0B8D0BDD0B8")
        or else U = B ("E58886")
        or else U = B ("E58886E9929F")
        or else U = B ("EBB684")
        or else U = B ("D8AFD982D98AD982D8A9")
        or else U = B ("D8AFD982D8A7D8A6D982")
        or else U = B ("E0A4AEE0A4BFE0A4A8E0A49F")
      then
         return 60;
      elsif U = "hour" or else U = "hours" or else U = "h"
        or else U = "hr" or else U = "hrs"
        or else U = "time" or else U = "timer"
        or else U = "stunde" or else U = "stunden"
        or else U = "heure" or else U = "heures"
        or else U = "hora" or else U = "horas"
        or else U = "ora" or else U = "ore"
        or else U = "uur"
        or else U = "timme" or else U = "timmar"
        or else U = "tunti" or else U = "tuntia"
        or else U = "godzina" or else U = "godziny"
        or else U = "hodina" or else U = "hodiny"
        or else U = "saat"
        or else U = B ("D187D0B0D181")
        or else U = B ("D187D0B0D181D0B0")
        or else U = B ("D0B3D0BED0B4D0B8D0BDD0B0")
        or else U = B ("D0B3D0BED0B4D0B8D0BDD0B8")
        or else U = B ("E69982E99693")
        or else U = B ("E5B08FE697B6")
        or else U = B ("EC8B9CEAB084")
        or else U = B ("D8B3D8A7D8B9D8A9")
        or else U = B ("D8B3D8A7D8B9D8A7D8AA")
        or else U = B ("E0A498E0A482E0A49FE0A4BE")
        or else U = B ("E0A498E0A482E0A49FE0A587")
      then
         return 3_600;
      elsif U = "day" or else U = "days" or else U = "d"
        or else U = "dag" or else U = "dage" or else U = "dager"
        or else U = "dagen"
        or else U = "tag" or else U = "tage" or else U = "tagen"
        or else U = "jour" or else U = "jours"
        or else U = "dia" or else U = "dias"
        or else U = B ("64C3AD61") or else U = B ("64C3AD6173")
        or else U = "giorno" or else U = "giorni"
        or else U = "dagar" or else U = "paiva" or else U = "paivaa"
        or else U = B ("70C3A46976C3A4")
        or else U = B ("70C3A46976C3A4C3A4")
        or else U = "dzien" or else U = "dni" or else U = "den" or else U = "dny"
        or else U = "gun" or else U = B ("67C3BC6E")
        or else U = B ("D0B4D0B5D0BDD18C")
        or else U = B ("D0B4D0BDD18F")
        or else U = B ("D0B4D0B5D0BDD18C")
        or else U = B ("D0B4D0BDD196")
        or else U = B ("E697A5")
        or else U = B ("E5A4A9")
        or else U = B ("EC9DBC")
        or else U = B ("D98AD988D985")
        or else U = B ("D8A3D98AD8A7D985")
        or else U = B ("E0A4A6E0A4BFE0A4A8")
      then
         return 86_400;
      elsif U = "week" or else U = "weeks" or else U = "w"
        or else U = "uge" or else U = "uger"
        or else U = "uke" or else U = "uker"
        or else U = "woche" or else U = "wochen"
        or else U = "semaine" or else U = "semaines"
        or else U = "semana" or else U = "semanas"
        or else U = "settimana" or else U = "settimane"
        or else U = "vecka" or else U = "veckor"
        or else U = "viikko" or else U = "viikkoa"
        or else U = "tydzien" or else U = B ("7479647A6965C584")
        or else U = "tygodnie"
        or else U = "tyden" or else U = B ("74C3BD64656E")
        or else U = "tydny"
        or else U = "hafta"
        or else U = B ("D0BDD0B5D0B4D0B5D0BBD18F")
        or else U = B ("D0BDD0B5D0B4D0B5D0BBD0B8")
        or else U = B ("D0BDD0B5D0B4D0B5D0BBD18E")
        or else U = B ("D182D0B8D0B6D0B4D0B5D0BDD18C")
        or else U = B ("D182D0B8D0B6D0BDD196")
        or else U = B ("E980B1")
        or else U = B ("E591A8")
        or else U = B ("ECA3BC")
        or else U = B ("D8A3D8B3D8A8D988D8B9")
        or else U = B ("D8A7D984D8A3D8B3D8A8D988D8B9")
        or else U = B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9")
      then
         return 7 * 86_400;
      elsif U = "month" or else U = "months" or else U = "mo"
        or else U = "mth" or else U = "mths"
        or else U = "maaned" or else U = "maaneder"
        or else U = B ("6DC3A56E6564") or else U = B ("6DC3A56E65646572")
        or else U = "monat" or else U = "monate"
        or else U = "mois"
        or else U = "mes" or else U = "meses"
        or else U = "mese" or else U = "mesi"
        or else U = "maand" or else U = "maanden"
        or else U = "manad" or else U = "manader"
        or else U = B ("6DC3A56E6164") or else U = B ("6DC3A56E61646572")
        or else U = "kuukausi" or else U = "kuukautta"
        or else U = "miesiac" or else U = "miesiace"
        or else U = "mesic" or else U = "mesice"
        or else U = "ay"
        or else U = B ("D0BCD0B5D181D18FD186")
        or else U = B ("D0BCD0B5D181D18FD186D18B")
        or else U = B ("D0BCD196D181D18FD186D18C")
        or else U = B ("D0BCD196D181D18FD186D196")
        or else U = B ("E69C88")
        or else U = B ("EB8BAC")
        or else U = B ("D8B4D987D8B1")
        or else U = B ("E0A4AEE0A4B9E0A580E0A4A8E0A4BE")
      then
         return 30 * 86_400;
      elsif U = "year" or else U = "years" or else U = "y"
        or else U = "yr" or else U = "yrs"
        or else U = "aar"
        or else U = B ("C3A572")
        or else U = "jahr" or else U = "jahre" or else U = "jahren"
        or else U = "an" or else U = "ans"
        or else U = "ano" or else U = "anos"
        or else U = "anno" or else U = "anni"
        or else U = "jaar"
        or else U = "ar" or else U = B ("C3A572")
        or else U = "vuosi" or else U = "vuotta"
        or else U = "rok" or else U = "lata" or else U = "let"
        or else U = "yil" or else B ("79C4B16C") = U
        or else U = B ("D0B3D0BED0B4")
        or else U = B ("D0B3D0BED0B4D0B0")
        or else U = B ("D180D196D0BA")
        or else U = B ("D180D0BED0BAD0B8")
        or else U = B ("E5B9B4")
        or else U = B ("EB8584")
        or else U = B ("D8B3D986D8A9")
        or else U = B ("E0A4B8E0A4BEE0A4B2")
      then
         return 365 * 86_400;
      else
         return 0;
      end if;
   end Unit_Seconds;

   function Unit_Microseconds (Unit : String) return Long_Long_Integer is
      U : constant String := Lower (Trim (Unit));
   begin
      if U = "microsecond" or else U = "microseconds" or else U = "us"
        or else U = "microseconde" or else U = "microsecondes"
        or else U = "microseconden"
        or else U = "mikrosekunde" or else U = "mikrosekunden"
      then
         return 1;
      elsif U = "millisecond" or else U = "milliseconds" or else U = "ms"
        or else U = "milliseconde" or else U = "millisecondes"
        or else U = "milliseconden"
        or else U = "millisekunde" or else U = "millisekunden"
      then
         return 1_000;
      else
         declare
            Seconds : constant Long_Long_Integer := Unit_Seconds (Unit);
         begin
            if Seconds = 0 then
               return 0;
            end if;
            return Seconds * 1_000_000;
         end;
      end if;
   end Unit_Microseconds;

   function Parse_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Source : constant String := Trim (Normalize_Native_Digits (Text));
      Index  : Natural := Source'First;
      Total  : Long_Long_Integer := 0;
      Seen   : Boolean := False;
   begin
      if Source'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      while Index <= Source'Last loop
         while Index <= Source'Last
           and then (Source (Index) = ' ' or else Source (Index) = ',')
         loop
            Index := Index + 1;
         end loop;

         declare
            Conjunction_Length : constant Natural :=
              Duration_Conjunction_Length (Source, Index);
         begin
            if Conjunction_Length /= 0 then
               Index := Index + Conjunction_Length;
            end if;
         end;

         if Index <= Source'Last then
            while Index <= Source'Last and then Source (Index) = ' ' loop
               Index := Index + 1;
            end loop;
         end if;

         exit when Index > Source'Last;

         declare
            Number_First : constant Natural := Index;
            Amount       : Long_Float;
            Unit_First   : Natural;
            Unit_Last    : Natural;
            Seconds      : Long_Long_Integer;
            Rounded      : Long_Long_Integer;
         begin
            while Index <= Source'Last
              and then (Is_Digit (Source (Index))
                        or else Source (Index) = '.'
                        or else Source (Index) = ',')
            loop
               Index := Index + 1;
            end loop;

            if Index = Number_First
              or else not Numeric_Value (Source (Number_First .. Index - 1), Amount)
            then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            while Index <= Source'Last and then Source (Index) = ' ' loop
               Index := Index + 1;
            end loop;
            Unit_First := Index;
            while Index <= Source'Last
              and then Source (Index) /= ','
              and then Source (Index) /= ' '
            loop
               Index := Index + 1;
            end loop;
            Unit_Last := Index - 1;

            if Unit_Last < Unit_First then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            Seconds := Unit_Seconds (Source (Unit_First .. Unit_Last));
            Rounded := Rounded_Nonnegative (Amount * Long_Float (Seconds));
            if Seconds = 0 or else Rounded < 0 then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            Total := Total + Rounded;
            Seen := True;
         exception
            when others =>
               return (Status => Humanize.Status.Invalid_Value, Value => 0, others => <>);
         end;
      end loop;

      if not Seen then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value  => Humanize.Durations.Duration_Seconds (Total),
         Exact  => True,
         Consumed => Source'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Duration;

   function Scan_Duration
     (Text : String)
      return Duration_Parse_Result
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
            Result : constant Duration_Parse_Result :=
              Parse_Duration (Text (Text'First .. Stop));
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
   end Scan_Duration;

   function Lenient_Duration_Text (Text : String) return String is
      Item  : constant String := Lower (Trim (Text));
      First : Natural := Item'First;
   begin
      if Item'Length = 0 then
         return "";
      end if;

      if Item (First) = '~' then
         First := First + 1;
      end if;

      while First <= Item'Last and then Item (First) = ' ' loop
         First := First + 1;
      end loop;

      if First + 2 <= Item'Last and then Item (First .. First + 2) = "in " then
         First := First + 3;
      end if;

      if First + 17 <= Item'Last
        and then Item (First .. First + 17) = "about half an hour"
      then
         return "30 minutes"
           & (if First + 18 <= Item'Last then Item (First + 18 .. Item'Last) else "");
      elsif First + 11 <= Item'Last
        and then Item (First .. First + 11) = "half an hour"
      then
         return "30 minutes"
           & (if First + 12 <= Item'Last then Item (First + 12 .. Item'Last) else "");
      elsif First + 14 <= Item'Last
        and then Item (First .. First + 14) = "a little under "
      then
         First := First + 15;
      elsif First + 9 <= Item'Last
        and then Item (First .. First + 9) = "just over "
      then
         First := First + 10;
      elsif First + 5 <= Item'Last and then Item (First .. First + 5) = "about " then
         First := First + 6;
      elsif First + 6 <= Item'Last
        and then Item (First .. First + 6) = "around "
      then
         First := First + 7;
      elsif First + 6 <= Item'Last
        and then Item (First .. First + 6) = "almost "
      then
         First := First + 7;
      elsif First + 4 <= Item'Last and then Item (First .. First + 4) = "over " then
         First := First + 5;
      end if;

      if First > Item'Last then
         return "";
      else
         return Item (First .. Item'Last);
      end if;
   end Lenient_Duration_Text;

   function Parse_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Normal : constant String := Lenient_Duration_Text (Text);
   begin
      if Normal'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      else
         return Parse_Duration (Normal);
      end if;
   end Parse_Lenient_Duration;

   function Scan_Lenient_Duration
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Duration_Parse_Result;
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      Result := Parse_Lenient_Duration (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Lenient_Duration;

   function Day_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
   end Day_Start;

   function Days_In_Month
     (Year  : Ada.Calendar.Year_Number;
      Month : Ada.Calendar.Month_Number)
      return Ada.Calendar.Day_Number
   is
      Leap : constant Boolean :=
        (Year mod 400 = 0) or else (Year mod 4 = 0 and then Year mod 100 /= 0);
   begin
      case Month is
         when 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
            return 31;
         when 4 | 6 | 9 | 11 =>
            return 30;
         when 2 =>
            return (if Leap then 29 else 28);
      end case;
   end Days_In_Month;

   function Add_Calendar_Days
     (Value : Ada.Calendar.Time;
      Days  : Integer)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Step    : constant Integer := (if Days < 0 then -1 else 1);
      Left    : Integer := abs Days;
   begin
      Ada.Calendar.Split (Day_Start (Value), Year, Month, Day, Seconds);
      while Left > 0 loop
         if Step > 0 then
            if Day < Days_In_Month (Year, Month) then
               Day := Day + 1;
            elsif Month < 12 then
               Month := Month + 1;
               Day := 1;
            else
               Year := Year + 1;
               Month := 1;
               Day := 1;
            end if;
         else
            if Day > 1 then
               Day := Day - 1;
            elsif Month > 1 then
               Month := Month - 1;
               Day := Days_In_Month (Year, Month);
            else
               Year := Year - 1;
               Month := 12;
               Day := 31;
            end if;
         end if;
         Left := Left - 1;
      end loop;
      return Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
   exception
      when others =>
         return Value;
   end Add_Calendar_Days;

   function Add_Months
     (Value  : Ada.Calendar.Time;
      Months : Integer)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Total   : Integer;
      New_Year  : Ada.Calendar.Year_Number;
      New_Month : Ada.Calendar.Month_Number;
      New_Day   : Ada.Calendar.Day_Number;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      Total := Integer (Year) * 12 + Integer (Month) - 1 + Months;
      if Total < Integer (Ada.Calendar.Year_Number'First) * 12 then
         return Value;
      end if;
      New_Year := Ada.Calendar.Year_Number (Total / 12);
      New_Month := Ada.Calendar.Month_Number (Total mod 12 + 1);
      New_Day := Ada.Calendar.Day_Number'Min
        (Day, Days_In_Month (New_Year, New_Month));
      return Ada.Calendar.Time_Of (New_Year, New_Month, New_Day, 0.0);
   exception
      when others =>
         return Value;
   end Add_Months;

   function Add_Years
     (Value : Ada.Calendar.Time;
      Years : Integer)
      return Ada.Calendar.Time
   is
   begin
      return Add_Months (Value, Years * 12);
   end Add_Years;

   function Month_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
   end Month_Start;

   function Year_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      return Ada.Calendar.Time_Of (Year, 1, 1, 0.0);
   end Year_Start;

   function Weekday_Number
     (Day : Ada.Calendar.Formatting.Day_Name)
      return Natural
   is
   begin
      case Day is
         when Ada.Calendar.Formatting.Monday    => return 1;
         when Ada.Calendar.Formatting.Tuesday   => return 2;
         when Ada.Calendar.Formatting.Wednesday => return 3;
         when Ada.Calendar.Formatting.Thursday  => return 4;
         when Ada.Calendar.Formatting.Friday    => return 5;
         when Ada.Calendar.Formatting.Saturday  => return 6;
         when Ada.Calendar.Formatting.Sunday    => return 7;
      end case;
   end Weekday_Number;

   function Weekday_Value (Text : String) return Natural is
      Item : constant String := Lower (Text);
   begin
      if Item = "monday" or else Item = "mon" then
         return 1;
      elsif Item = "tuesday" or else Item = "tue" or else Item = "tues" then
         return 2;
      elsif Item = "wednesday" or else Item = "wed" then
         return 3;
      elsif Item = "thursday" or else Item = "thu" or else Item = "thur"
        or else Item = "thurs"
      then
         return 4;
      elsif Item = "friday" or else Item = "fri" then
         return 5;
      elsif Item = "saturday" or else Item = "sat" then
         return 6;
      elsif Item = "sunday" or else Item = "sun" then
         return 7;
      else
         return 0;
      end if;
   end Weekday_Value;

   function Weekday_Value_Flexible (Text : String) return Natural is
      Item : constant String := Lower (Trim (Text));
   begin
      if Weekday_Value (Item) /= 0 then
         return Weekday_Value (Item);
      elsif Item'Length > 1 and then Item (Item'Last) = 's' then
         return Weekday_Value (Item (Item'First .. Item'Last - 1));
      else
         return 0;
      end if;
   end Weekday_Value_Flexible;

   function Week_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Base : constant Ada.Calendar.Time := Day_Start (Value);
      Current : constant Natural := Weekday_Number
        (Ada.Calendar.Formatting.Day_Of_Week (Base));
   begin
      return Add_Calendar_Days (Base, -Integer (Current - 1));
   end Week_Start;

   function Quarter_Start (Value : Ada.Calendar.Time) return Ada.Calendar.Time is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Start_Month : Ada.Calendar.Month_Number;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      Start_Month := Ada.Calendar.Month_Number (((Natural (Month) - 1) / 3) * 3 + 1);
      return Ada.Calendar.Time_Of (Year, Start_Month, 1, 0.0);
   end Quarter_Start;

   function Quarter_Start
     (Year    : Ada.Calendar.Year_Number;
      Quarter : Natural)
      return Ada.Calendar.Time
   is
      Month : constant Ada.Calendar.Month_Number :=
        Ada.Calendar.Month_Number ((Quarter - 1) * 3 + 1);
   begin
      return Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
   end Quarter_Start;

   function Add_Quarters
     (Value    : Ada.Calendar.Time;
      Quarters : Integer)
      return Ada.Calendar.Time
   is
   begin
      return Add_Months (Value, Quarters * 3);
   end Add_Quarters;

   function Week_Number_Start
     (Reference : Ada.Calendar.Time;
      Week      : Natural)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Reference, Year, Month, Day, Seconds);
      return Add_Calendar_Days
        (Week_Start (Ada.Calendar.Time_Of (Year, 1, 1, 0.0)),
         Integer ((Week - 1) * 7));
   end Week_Number_Start;

   function Is_Default_Business_Day (Value : Ada.Calendar.Time) return Boolean is
      Day : constant Natural :=
        Weekday_Number (Ada.Calendar.Formatting.Day_Of_Week (Day_Start (Value)));
   begin
      return Day in 1 .. 5;
   end Is_Default_Business_Day;

   function Add_Default_Business_Days
     (Value : Ada.Calendar.Time;
      Count : Integer)
      return Ada.Calendar.Time
   is
      Result : Ada.Calendar.Time := Day_Start (Value);
      Seen   : Integer := 0;
      Step   : constant Integer := (if Count < 0 then -1 else 1);
   begin
      while Seen /= Count loop
         Result := Add_Calendar_Days (Result, Step);
         if Is_Default_Business_Day (Result) then
            Seen := Seen + Step;
         end if;
      end loop;
      return Result;
   end Add_Default_Business_Days;

   function Month_Value (Text : String) return Natural is
      Item : constant String := Lower (Text);
   begin
      if Item = "january" or else Item = "jan" then
         return 1;
      elsif Item = "february" or else Item = "feb" then
         return 2;
      elsif Item = "march" or else Item = "mar" then
         return 3;
      elsif Item = "april" or else Item = "apr" then
         return 4;
      elsif Item = "may" then
         return 5;
      elsif Item = "june" or else Item = "jun" then
         return 6;
      elsif Item = "july" or else Item = "jul" then
         return 7;
      elsif Item = "august" or else Item = "aug" then
         return 8;
      elsif Item = "september" or else Item = "sep" or else Item = "sept" then
         return 9;
      elsif Item = "october" or else Item = "oct" then
         return 10;
      elsif Item = "november" or else Item = "nov" then
         return 11;
      elsif Item = "december" or else Item = "dec" then
         return 12;
      else
         return 0;
      end if;
   end Month_Value;

   function Parse_Natural_Count (Text : String; Value : out Integer) return Boolean is
      Item : constant String := Lower (Trim (Text));
      Amount : Long_Float;
   begin
      if Item = "a" or else Item = "an" or else Item = "one" then
         Value := 1;
         return True;
      elsif Item = "two" then
         Value := 2;
         return True;
      elsif Item = "three" then
         Value := 3;
         return True;
      elsif Item = "four" then
         Value := 4;
         return True;
      elsif Item = "five" then
         Value := 5;
         return True;
      elsif Item = "six" then
         Value := 6;
         return True;
      elsif Item = "seven" then
         Value := 7;
         return True;
      elsif Item = "eight" then
         Value := 8;
         return True;
      elsif Item = "nine" then
         Value := 9;
         return True;
      elsif Item = "ten" then
         Value := 10;
         return True;
      elsif Numeric_Value (Item, Amount) and then Amount >= 0.0 then
         Value := Integer (Long_Float'Rounding (Amount));
         return Long_Float (Value) = Amount;
      else
         return False;
      end if;
   end Parse_Natural_Count;

   type Date_Unit_Kind is
     (No_Date_Unit, Day_Date_Unit, Week_Date_Unit, Month_Date_Unit,
      Year_Date_Unit);

   function Date_Unit (Unit : String) return Date_Unit_Kind is
      U : constant String := Lower (Trim (Unit));
   begin
      if Unit_Seconds (U) = 86_400 then
         return Day_Date_Unit;
      elsif Unit_Seconds (U) = 7 * 86_400 then
         return Week_Date_Unit;
      elsif Unit_Seconds (U) = 30 * 86_400 then
         return Month_Date_Unit;
      elsif Unit_Seconds (U) = 365 * 86_400 then
         return Year_Date_Unit;
      else
         return No_Date_Unit;
      end if;
   end Date_Unit;

   function Known_Date_Unit (Unit : String) return Boolean is
   begin
      return Date_Unit (Unit) /= No_Date_Unit;
   end Known_Date_Unit;

   function Unit_Days
     (Base  : Ada.Calendar.Time;
      Count : Integer;
      Unit  : String)
      return Ada.Calendar.Time
   is
      Kind : constant Date_Unit_Kind := Date_Unit (Unit);
   begin
      if Kind = Day_Date_Unit then
         return Add_Calendar_Days (Base, Count);
      elsif Kind = Week_Date_Unit then
         return Add_Calendar_Days (Base, Count * 7);
      elsif Kind = Month_Date_Unit then
         return Add_Months (Base, Count);
      elsif Kind = Year_Date_Unit then
         return Add_Years (Base, Count);
      else
         return Base;
      end if;
   end Unit_Days;

   function Canonical_Natural_Date_Text (Text : String) return String is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "today" or else Item = "now"
        or else Item = "i dag" or else Item = "heute"
        or else Item = "aujourd'hui" or else Item = "hoy"
        or else Item = "oggi" or else Item = "hoje"
        or else Item = "vandaag" or else Item = "idag"
        or else Item = B ("74C3A46EC3A46E")
        or else Item = B ("74C3A46EC3A4C3A46E")
        or else Item = B ("647A69C59B")
        or else Item = "dnes" or else Item = B ("627567C3BC6E")
        or else Item = B ("D181D0B5D0B3D0BED0B4D0BDD18F")
        or else Item = B ("D181D18CD0BED0B3D0BED0B4D0BDD196")
        or else Item = B ("E4BB8AE697A5")
        or else Item = B ("EC98A4EB8A98")
        or else Item = B ("E4BB8AE5A4A9")
        or else Item = B ("D8A7D984D98AD988D985")
        or else Item = B ("E0A486E0A49C")
      then
         return "today";
      elsif Item = "tomorrow" or else Item = "i morgen" or else Item = "morgen"
        or else Item = "demain" or else Item = B ("6D61C3B1616E61")
        or else Item = "domani" or else Item = B ("616D616E68C3A3")
        or else Item = "imorgon" or else Item = "huomenna"
        or else Item = "jutro" or else Item = B ("7AC3AD747261")
        or else Item = B ("796172C4B16E") or else Item = B ("796172C4B16E")
        or else Item = B ("D0B7D0B0D0B2D182D180D0B0")
        or else Item = B ("D0B7D0B0D0B2D182D180D0B0")
        or else Item = B ("E6988EE697A5")
        or else Item = B ("EB82B4EC9DBC")
        or else Item = B ("E6988EE5A4A9")
        or else Item = B ("D8BAD8AFD98B")
        or else Item = B ("D8BAD8AFD98BD8A7")
      then
         return "tomorrow";
      elsif Item = "yesterday" or else Item = B ("692067C3A572")
        or else Item = "gestern" or else Item = "hier" or else Item = "ayer"
        or else Item = "ieri" or else Item = "ontem" or else Item = "gisteren"
        or else Item = B ("6967C3A572") or else Item = "eilen"
        or else Item = "wczoraj" or else Item = B ("76C48D657261")
        or else Item = B ("64C3BC6E")
        or else Item = B ("D0B2D187D0B5D180D0B0")
        or else Item = B ("D0B2D187D0BED180D0B0")
        or else Item = B ("E698A8E697A5")
        or else Item = B ("EC96B4ECA09C")
        or else Item = B ("E698A8E5A4A9")
        or else Item = B ("D8A3D985D8B3")
      then
         return "yesterday";
      elsif Item = "nu" or else Item = "jetzt" or else Item = "maintenant"
        or else Item = "ahora" or else Item = "ora" or else Item = "agora"
        or else Item = "nyt" or else Item = "teraz" or else Item = "nyni"
        or else Item = B ("6E796EC3AD") or else Item = B ("C59F696D6469")
        or else Item = B ("D181D0B5D0B9D187D0B0D181")
        or else Item = B ("D0B7D0B0D180D0B0D0B7")
        or else Item = B ("E4BB8A")
        or else Item = B ("ECA780EAB888")
        or else Item = B ("E78EB0E59CA8")
        or else Item = B ("D8A7D984D8A2D986")
        or else Item = B ("E0A485E0A4ADE0A580")
      then
         return "now";
      elsif Starts_With (Item, "om ") or else Starts_With (Item, "dans ")
        or else Starts_With (Item, "en ") or else Starts_With (Item, "tra ")
        or else Starts_With (Item, "em ") or else Starts_With (Item, "over ")
        or else Starts_With (Item, "za ")
      then
         declare
            Space : constant Natural := Find_Substring (Item, " ");
         begin
            return "in " & Item (Space + 1 .. Item'Last);
         end;
      elsif Starts_With (Item, "hace ") then
         return Item (Item'First + 5 .. Item'Last) & " ago";
      elsif Starts_With (Item, "vor ") then
         return Item (Item'First + 4 .. Item'Last) & " ago";
      elsif Ends_With (Item, " siden") then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, " geleden") then
         return Item (Item'First .. Item'Last - 8) & " ago";
      elsif Ends_With (Item, " temu") then
         return Item (Item'First .. Item'Last - 5) & " ago";
      elsif Ends_With (Item, B ("20D0BDD0B0D0B7D0B0D0B4")) then
         return Item (Item'First .. Item'Last - 11) & " ago";
      else
         return Item;
      end if;
   end Canonical_Natural_Date_Text;

   function Split_Count_Unit
     (Text  : String;
      Count : out Integer;
      Unit  : out Unbounded_String)
      return Boolean
   is
      Item  : constant String := Trim (Text);
      Space : Natural := 0;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;

      if Space = 0 or else Space = Item'First or else Space = Item'Last then
         return False;
      elsif not Parse_Natural_Count (Item (Item'First .. Space - 1), Count) then
         return False;
      else
         Unit := To_Unbounded_String (Item (Space + 1 .. Item'Last));
         return True;
      end if;
   end Split_Count_Unit;

   function Parse_ISO_Date (Text : String; Value : out Ada.Calendar.Time) return Boolean is
      Item : constant String := Trim (Text);
      Year : Integer;
      Month : Integer;
      Day : Integer;
   begin
      if Item'Length /= 10
        or else (Item (Item'First + 4) /= '-' and then Item (Item'First + 4) /= '/')
        or else (Item (Item'First + 7) /= '-' and then Item (Item'First + 7) /= '/')
      then
         return False;
      end if;

      Year := Integer'Value (Item (Item'First .. Item'First + 3));
      Month := Integer'Value (Item (Item'First + 5 .. Item'First + 6));
      Day := Integer'Value (Item (Item'First + 8 .. Item'First + 9));
      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Month not in 1 .. 12
        or else Day not in 1 .. 31
      then
         return False;
      end if;
      if Day > Integer (Days_In_Month
        (Ada.Calendar.Year_Number (Year), Ada.Calendar.Month_Number (Month)))
      then
         return False;
      end if;
      Value := Ada.Calendar.Time_Of
        (Ada.Calendar.Year_Number (Year),
         Ada.Calendar.Month_Number (Month),
         Ada.Calendar.Day_Number (Day),
         0.0);
      return True;
   exception
      when others =>
         return False;
   end Parse_ISO_Date;

   function Parse_Month_Name_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      First_Space : Natural := 0;
      Second_Space : Natural := 0;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Month : Natural;
      Day : Integer;
      Year : Integer;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if First_Space = 0 then
               First_Space := Index;
            else
               Second_Space := Index;
               exit;
            end if;
         end if;
      end loop;

      if First_Space = 0 then
         return False;
      end if;

      Month := Month_Value (Item (Item'First .. First_Space - 1));
      if Month = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      if Second_Space = 0 then
         Day := Integer'Value (Item (First_Space + 1 .. Item'Last));
         Year := Integer (Ref_Year);
      else
         Day := Integer'Value (Item (First_Space + 1 .. Second_Space - 1));
         Year := Integer'Value (Item (Second_Space + 1 .. Item'Last));
      end if;

      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Day < 1
        or else Day > Integer (Days_In_Month
          (Ada.Calendar.Year_Number (Year), Ada.Calendar.Month_Number (Month)))
      then
         return False;
      end if;

      Value := Ada.Calendar.Time_Of
        (Ada.Calendar.Year_Number (Year),
         Ada.Calendar.Month_Number (Month),
         Ada.Calendar.Day_Number (Day),
         0.0);
      return True;
   exception
      when others =>
         return False;
   end Parse_Month_Name_Date;

   function Strip_Day_Ordinal_Suffix (Text : String) return String is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item'Length > 2
        and then
          (Ends_With (Item, "st")
           or else Ends_With (Item, "nd")
           or else Ends_With (Item, "rd")
           or else Ends_With (Item, "th"))
      then
         return Item (Item'First .. Item'Last - 2);
      else
         return Item;
      end if;
   end Strip_Day_Ordinal_Suffix;

   function Parse_Day_Token (Text : String; Day : out Integer) return Boolean is
      Item : constant String := Strip_Day_Ordinal_Suffix (Text);
   begin
      if Item'Length = 0 then
         return False;
      end if;

      for Index in Item'Range loop
         if Item (Index) not in '0' .. '9' then
            return False;
         end if;
      end loop;

      Day := Integer'Value (Item);
      return Day in 1 .. 31;
   exception
      when others =>
         return False;
   end Parse_Day_Token;

   function Parse_Month_Day_Ordinal_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      First_Space : Natural := 0;
      Second_Space : Natural := 0;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Month : Natural;
      Day : Integer;
      Year : Integer;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if First_Space = 0 then
               First_Space := Index;
            else
               Second_Space := Index;
               exit;
            end if;
         end if;
      end loop;

      if First_Space = 0 then
         return False;
      end if;

      Month := Month_Value (Item (Item'First .. First_Space - 1));
      if Month = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      if Second_Space = 0 then
         if not Parse_Day_Token (Item (First_Space + 1 .. Item'Last), Day) then
            return False;
         end if;
         Year := Integer (Ref_Year);
      else
         if not Parse_Day_Token
           (Item (First_Space + 1 .. Second_Space - 1), Day)
         then
            return False;
         end if;
         Year := Integer'Value (Item (Second_Space + 1 .. Item'Last));
      end if;

      if Year not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
        or else Day > Integer (Days_In_Month
          (Ada.Calendar.Year_Number (Year), Ada.Calendar.Month_Number (Month)))
      then
         return False;
      end if;

      Value := Ada.Calendar.Time_Of
        (Ada.Calendar.Year_Number (Year),
         Ada.Calendar.Month_Number (Month),
         Ada.Calendar.Day_Number (Day),
         0.0);
      return True;
   exception
      when others =>
         return False;
   end Parse_Month_Day_Ordinal_Date;

   function Date_Result
     (Value    : Ada.Calendar.Time;
      Consumed : Natural;
      Exact    : Boolean := True)
      return Date_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Exact => Exact,
         Consumed => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Date_Result;

   function Parse_Year_Token
     (Text : String;
      Year : out Ada.Calendar.Year_Number)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      First : Natural := Item'First;
      Value : Integer;
   begin
      if Starts_With (Item, "fy") then
         First := Item'First + 2;
      end if;
      if First > Item'Last then
         return False;
      end if;
      Value := Integer'Value (Item (First .. Item'Last));
      if Value not in Integer (Ada.Calendar.Year_Number'First) ..
        Integer (Ada.Calendar.Year_Number'Last)
      then
         return False;
      end if;
      Year := Ada.Calendar.Year_Number (Value);
      return True;
   exception
      when others =>
         return False;
   end Parse_Year_Token;

   function Quarter_Value (Text : String) return Natural is
      Item : constant String := Lower (Trim (Text));
      Value : Integer;
   begin
      if Item'Length = 2 and then Item (Item'First) = 'q'
        and then Item (Item'Last) in '1' .. '4'
      then
         return Natural'Value (Item (Item'Last .. Item'Last));
      elsif Item'Length = 1 and then Item (Item'First) in '1' .. '4' then
         return Natural'Value (Item);
      else
         Value := Integer'Value (Item);
         if Value in 1 .. 4 then
            return Natural (Value);
         else
            return 0;
         end if;
      end if;
   exception
      when others =>
         return 0;
   end Quarter_Value;

   function Half_Value (Text : String) return Natural is
      Item : constant String := Lower (Trim (Text));
      Value : Integer;
   begin
      if Item'Length = 2
        and then (Item (Item'First) = 'h' or else Item (Item'First) = 's')
        and then Item (Item'Last) in '1' .. '2'
      then
         return Natural'Value (Item (Item'Last .. Item'Last));
      elsif Item'Length = 1 and then Item (Item'First) in '1' .. '2' then
         return Natural'Value (Item);
      else
         Value := Integer'Value (Item);
         if Value in 1 .. 2 then
            return Natural (Value);
         else
            return 0;
         end if;
      end if;
   exception
      when others =>
         return 0;
   end Half_Value;

   function Split_Once
     (Text  : String;
      Left  : out Unbounded_String;
      Right : out Unbounded_String)
      return Boolean
   is
      Item : constant String := Trim (Text);
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Left := To_Unbounded_String (Trim (Item (Item'First .. Index - 1)));
            Right := To_Unbounded_String (Trim (Item (Index + 1 .. Item'Last)));
            return Length (Left) > 0 and then Length (Right) > 0;
         end if;
      end loop;
      return False;
   end Split_Once;

   function Parse_Quarter_Label
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Core_First : Natural := Item'First;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Year : Ada.Calendar.Year_Number;
      Quarter : Natural := 0;
      Left, Right : Unbounded_String;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      Year := Ref_Year;

      if Starts_With (Item, "fiscal ") then
         Core_First := Item'First + 7;
      end if;

      declare
         Core : constant String := Trim (Item (Core_First .. Item'Last));
      begin
         if Starts_With (Core, "fy") and then Split_Once (Core, Left, Right) then
            if not Parse_Year_Token (To_String (Left), Year) then
               return False;
            end if;
            Quarter := Quarter_Value (To_String (Right));
         elsif Starts_With (Core, "quarter ") then
            declare
               Rest : constant String := Trim (Core (Core'First + 8 .. Core'Last));
            begin
               if Split_Once (Rest, Left, Right) then
                  Quarter := Quarter_Value (To_String (Left));
                  if not Parse_Year_Token (To_String (Right), Year) then
                     return False;
                  end if;
               else
                  Quarter := Quarter_Value (Rest);
               end if;
            end;
         elsif Split_Once (Core, Left, Right) then
            Quarter := Quarter_Value (To_String (Left));
            if Quarter = 0 then
               return False;
            end if;
            if not Parse_Year_Token (To_String (Right), Year) then
               return False;
            end if;
         else
            Quarter := Quarter_Value (Core);
         end if;
      end;

      if Quarter not in 1 .. 4 then
         return False;
      end if;
      Low := Quarter_Start (Year, Quarter);
      High := Add_Quarters (Low, 1);
      return True;
   exception
      when others =>
         return False;
   end Parse_Quarter_Label;

   function Parse_Half_Label
     (Text : String;
      Low  : out Ada.Calendar.Time;
      High : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Core_First : Natural := Item'First;
      Year : Ada.Calendar.Year_Number;
      Half : Natural := 0;
      Left, Right : Unbounded_String;
      Fiscal : Boolean := False;
      Semester : Boolean := False;
      Half_Label : Boolean := False;
      Start_Month : Ada.Calendar.Month_Number;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      if Starts_With (Item, "fiscal ") then
         Fiscal := True;
         Core_First := Item'First + 7;
      elsif Starts_With (Item, "first half of ") then
         Half_Label := True;
         Half := 1;
         if not Parse_Year_Token (Item (Item'First + 14 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 1, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "second half of ") then
         Half_Label := True;
         Half := 2;
         if not Parse_Year_Token (Item (Item'First + 15 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 7, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "first half ") then
         Half_Label := True;
         Half := 1;
         if not Parse_Year_Token (Item (Item'First + 11 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 1, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "second half ") then
         Half_Label := True;
         Half := 2;
         if not Parse_Year_Token (Item (Item'First + 12 .. Item'Last), Year) then
            return False;
         end if;
         Low := Ada.Calendar.Time_Of (Year, 7, 1, 0.0);
         High := Add_Months (Low, 6);
         return True;
      elsif Starts_With (Item, "semester ") then
         Semester := True;
         Core_First := Item'First + 9;
      elsif Starts_With (Item, "half ") then
         Half_Label := True;
         Core_First := Item'First + 5;
      elsif Starts_With (Item, "half-year ") then
         Half_Label := True;
         Core_First := Item'First + 10;
      end if;

      declare
         Core : constant String := Trim (Item (Core_First .. Item'Last));
      begin
         if Starts_With (Core, "fy") then
            Fiscal := True;
            if Split_Once (Core, Left, Right) then
               if not Parse_Year_Token (To_String (Left), Year) then
                  return False;
               end if;
               Half := Half_Value (To_String (Right));
            else
               if not Parse_Year_Token (Core, Year) then
                  return False;
               end if;
               Low := Year_Start (Ada.Calendar.Time_Of (Year, 1, 1, 0.0));
               High := Add_Years (Low, 1);
               return True;
            end if;
         elsif Split_Once (Core, Left, Right) then
            Half := Half_Value (To_String (Left));
            if Half = 0 then
               return False;
            end if;
            if not Parse_Year_Token (To_String (Right), Year) then
               return False;
            end if;
            if Starts_With (To_String (Left), "s") then
               Semester := True;
            elsif Starts_With (To_String (Left), "h") then
               Half_Label := True;
            end if;
         else
            return False;
         end if;
      end;

      if Half not in 1 .. 2 then
         return False;
      end if;

      Start_Month :=
        (if Half = 1 then 1 else 7);
      Low := Ada.Calendar.Time_Of (Year, Start_Month, 1, 0.0);
      High := Add_Months (Low, 6);
      return Fiscal or else Semester or else Half_Label;
   exception
      when others =>
         return False;
   end Parse_Half_Label;

   function Parse_Week_Number
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Week : Integer;
   begin
      if not Starts_With (Item, "week ") then
         return False;
      end if;
      Week := Integer'Value (Trim (Item (Item'First + 5 .. Item'Last)));
      if Week not in 1 .. 53 then
         return False;
      end if;
      Low := Week_Number_Start (Reference, Natural (Week));
      High := Add_Calendar_Days (Low, 7);
      return True;
   exception
      when others =>
         return False;
   end Parse_Week_Number;

   function Repeated_Weekday_Date
     (Base    : Ada.Calendar.Time;
      Count   : Integer;
      Weekday : Natural)
      return Ada.Calendar.Time
   is
      Current : constant Natural := Weekday_Number
        (Ada.Calendar.Formatting.Day_Of_Week (Base));
      First_Offset : Integer;
   begin
      First_Offset := (if Weekday > Current then Weekday - Current
                       else Weekday + 7 - Current);
      if First_Offset = 0 then
         First_Offset := 7;
      end if;
      return Add_Calendar_Days (Base, First_Offset + (Count - 1) * 7);
   end Repeated_Weekday_Date;

   function Parse_Repeated_Weekday
     (Base  : Ada.Calendar.Time;
      Text  : String;
      Value : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Body_Last : Natural;
      Count : Integer;
      Unit : Unbounded_String;
      Weekday : Natural;
   begin
      if not Ends_With (Item, " from now") then
         return False;
      end if;
      Body_Last := Item'Last - 9;
      if Body_Last < Item'First
        or else not Split_Count_Unit (Item (Item'First .. Body_Last), Count, Unit)
      then
         return False;
      end if;
      Weekday := Weekday_Value_Flexible (To_String (Unit));
      if Count <= 0 or else Weekday = 0 then
         return False;
      end if;
      Value := Repeated_Weekday_Date (Base, Count, Weekday);
      return True;
   end Parse_Repeated_Weekday;

   function Time_Of_Day_Seconds
     (Text    : String;
      Seconds : out Ada.Calendar.Day_Duration)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "morning" then
         Seconds := 9.0 * 3_600.0;
      elsif Item = "afternoon" then
         Seconds := 13.0 * 3_600.0;
      elsif Item = "evening" then
         Seconds := 18.0 * 3_600.0;
      elsif Item = "night" then
         Seconds := 21.0 * 3_600.0;
      elsif Item = "noon" then
         Seconds := 12.0 * 3_600.0;
      elsif Item = "midnight" then
         Seconds := 0.0;
      else
         return False;
      end if;
      return True;
   end Time_Of_Day_Seconds;

   function With_Time_Of_Day
     (Date    : Ada.Calendar.Time;
      Seconds : Ada.Calendar.Day_Duration)
      return Ada.Calendar.Time
   is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Ignored : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (Date, Year, Month, Day, Ignored);
      return Ada.Calendar.Time_Of (Year, Month, Day, Seconds);
   end With_Time_Of_Day;

   function Strip_Time_Of_Day
     (Text    : String;
      Prefix  : out Unbounded_String;
      Seconds : out Ada.Calendar.Day_Duration)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      for Index in reverse Item'Range loop
         if Item (Index) = ' ' then
            declare
               Tail : constant String := Item (Index + 1 .. Item'Last);
               Head : constant String := Trim (Item (Item'First .. Index - 1));
            begin
               if Head'Length > 0 and then Time_Of_Day_Seconds (Tail, Seconds)
               then
                  Prefix := To_Unbounded_String (Head);
                  return True;
               end if;
            end;
         end if;
      end loop;
      return False;
   end Strip_Time_Of_Day;

   function Ordinal_Value (Text : String) return Integer is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "first" or else Item = "1st" then
         return 1;
      elsif Item = "second" or else Item = "2nd" then
         return 2;
      elsif Item = "third" or else Item = "3rd" then
         return 3;
      elsif Item = "fourth" or else Item = "4th" then
         return 4;
      elsif Item = "fifth" or else Item = "5th" then
         return 5;
      elsif Item = "last" then
         return -1;
      else
         return 0;
      end if;
   end Ordinal_Value;

   function Nth_Weekday_In_Month
     (Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Weekday : Natural;
      Ordinal : Integer)
      return Ada.Calendar.Time
   is
      First : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, Month, 1, 0.0);
      Last_Day : constant Ada.Calendar.Day_Number := Days_In_Month (Year, Month);
      Last : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (Year, Month, Last_Day, 0.0);
      First_Weekday : constant Natural :=
        Weekday_Number (Ada.Calendar.Formatting.Day_Of_Week (First));
      Last_Weekday : constant Natural :=
        Weekday_Number (Ada.Calendar.Formatting.Day_Of_Week (Last));
      Offset : Integer;
      Day    : Integer;
   begin
      if Ordinal > 0 then
         Offset := (if Weekday >= First_Weekday
                    then Weekday - First_Weekday
                    else Weekday + 7 - First_Weekday);
         Day := 1 + Offset + (Ordinal - 1) * 7;
      else
         Offset := (if Weekday <= Last_Weekday
                    then Last_Weekday - Weekday
                    else Last_Weekday + 7 - Weekday);
         Day := Integer (Last_Day) - Offset;
      end if;

      if Day < 1 or else Day > Integer (Last_Day) then
         raise Constraint_Error;
      end if;

      return Ada.Calendar.Time_Of
        (Year, Month, Ada.Calendar.Day_Number (Day), 0.0);
   end Nth_Weekday_In_Month;

   function Parse_Ordinal_Weekday_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Space_1     : Natural := 0;
      Space_2     : Natural := 0;
      Space_3     : Natural := 0;
      Space_4     : Natural := 0;
      Ref_Year    : Ada.Calendar.Year_Number;
      Ref_Month   : Ada.Calendar.Month_Number;
      Ref_Day     : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Ordinal     : Integer;
      Weekday     : Natural;
      Month       : Natural;
      Year        : Ada.Calendar.Year_Number;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            if Space_1 = 0 then
               Space_1 := Index;
            elsif Space_2 = 0 then
               Space_2 := Index;
            elsif Space_3 = 0 then
               Space_3 := Index;
            elsif Space_4 = 0 then
               Space_4 := Index;
               exit;
            end if;
         end if;
      end loop;

      if Space_1 = 0 or else Space_2 = 0 or else Space_3 = 0 then
         return False;
      end if;

      Ordinal := Ordinal_Value (Item (Item'First .. Space_1 - 1));
      Weekday := Weekday_Value (Item (Space_1 + 1 .. Space_2 - 1));
      if Ordinal = 0 or else Weekday = 0 then
         return False;
      end if;

      declare
         Link : constant String := Item (Space_2 + 1 .. Space_3 - 1);
         Month_Text : constant String :=
           (if Space_4 = 0 then Item (Space_3 + 1 .. Item'Last)
            else Item (Space_3 + 1 .. Space_4 - 1));
      begin
         if Link /= "in" and then Link /= "of" then
            return False;
         end if;
         Month := Month_Value (Month_Text);
      end;

      if Month = 0 then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      Year := Ref_Year;
      if Space_4 /= 0 then
         declare
            Parsed_Year : constant Integer :=
              Integer'Value (Item (Space_4 + 1 .. Item'Last));
         begin
            if Parsed_Year not in Integer (Ada.Calendar.Year_Number'First) ..
              Integer (Ada.Calendar.Year_Number'Last)
            then
               return False;
            end if;
            Year := Ada.Calendar.Year_Number (Parsed_Year);
         end;
      end if;

      Value := Nth_Weekday_In_Month
        (Year, Ada.Calendar.Month_Number (Month), Weekday, Ordinal);
      return True;
   exception
      when others =>
         return False;
   end Parse_Ordinal_Weekday_Date;

   function Parse_Weekday_Day_Ordinal_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      The_Pos : constant Natural := Find_Substring (Item, " the ");
      Ref_Start : constant Ada.Calendar.Time := Day_Start (Reference);
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Weekday : Natural;
      Day : Integer;
      Best : Ada.Calendar.Time := Ref_Start;
      Best_Set : Boolean := False;
      Best_Distance : Duration := 0.0;
   begin
      if The_Pos = 0 then
         return False;
      end if;

      Weekday := Weekday_Value (Item (Item'First .. The_Pos - 1));
      if Weekday = 0
        or else not Parse_Day_Token
          (Item (The_Pos + 5 .. Item'Last), Day)
      then
         return False;
      end if;

      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      for Offset in -6 .. 6 loop
         declare
            Month_Start_Candidate : constant Ada.Calendar.Time :=
              Add_Months
                (Ada.Calendar.Time_Of (Ref_Year, Ref_Month, 1, 0.0),
                 Offset);
            Year : Ada.Calendar.Year_Number;
            Month : Ada.Calendar.Month_Number;
            Candidate_Day : Ada.Calendar.Day_Number;
            Seconds : Ada.Calendar.Day_Duration;
         begin
            Ada.Calendar.Split
              (Month_Start_Candidate, Year, Month, Candidate_Day, Seconds);
            if Day <= Integer (Days_In_Month (Year, Month)) then
               declare
                  Candidate : constant Ada.Calendar.Time :=
                    Ada.Calendar.Time_Of
                      (Year, Month, Ada.Calendar.Day_Number (Day), 0.0);
                  Distance : constant Duration := abs (Candidate - Ref_Start);
               begin
                  if Weekday_Number
                    (Ada.Calendar.Formatting.Day_Of_Week (Candidate)) = Weekday
                    and then
                      (not Best_Set or else Distance < Best_Distance)
                  then
                     Best := Candidate;
                     Best_Set := True;
                     Best_Distance := Distance;
                  end if;
               end;
            end if;
         end;
      end loop;

      if not Best_Set then
         return False;
      end if;

      Value := Best;
      return True;
   exception
      when others =>
         return False;
   end Parse_Weekday_Day_Ordinal_Date;

   function Boundary_Date
     (Reference : Ada.Calendar.Time;
      Phrase    : String;
      Is_End    : Boolean;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Phrase));
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
      Low, High : Ada.Calendar.Time;
   begin
      if Item = "this week" then
         Low := Week_Start (Base);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "next week" then
         Low := Add_Calendar_Days (Week_Start (Base), 7);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "last week" then
         Low := Add_Calendar_Days (Week_Start (Base), -7);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "this month" then
         Low := Month_Start (Base);
         High := Add_Months (Low, 1);
      elsif Item = "next month" then
         Low := Add_Months (Month_Start (Base), 1);
         High := Add_Months (Low, 1);
      elsif Item = "last month" then
         Low := Add_Months (Month_Start (Base), -1);
         High := Add_Months (Low, 1);
      elsif Item = "this quarter" then
         Low := Quarter_Start (Base);
         High := Add_Quarters (Low, 1);
      elsif Item = "next quarter" then
         Low := Add_Quarters (Quarter_Start (Base), 1);
         High := Add_Quarters (Low, 1);
      elsif Item = "last quarter" then
         Low := Add_Quarters (Quarter_Start (Base), -1);
         High := Add_Quarters (Low, 1);
      elsif Item = "this year" then
         Low := Year_Start (Base);
         High := Add_Years (Low, 1);
      elsif Item = "next year" then
         Low := Add_Years (Year_Start (Base), 1);
         High := Add_Years (Low, 1);
      elsif Item = "last year" then
         Low := Add_Years (Year_Start (Base), -1);
         High := Add_Years (Low, 1);
      elsif Parse_Quarter_Label (Reference, Item, Low, High)
        or else Parse_Half_Label (Item, Low, High)
        or else Parse_Week_Number (Reference, Item, Low, High)
      then
         null;
      else
         return False;
      end if;

      Value := (if Is_End then Add_Calendar_Days (High, -1) else Low);
      return True;
   end Boundary_Date;

   function Normalize_End_Boundary (Text : String) return String is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "month end" or else Item = "end of month" then
         return "this month";
      elsif Item = "quarter end" or else Item = "end of quarter" then
         return "this quarter";
      elsif Item = "year end" or else Item = "end of year" then
         return "this year";
      elsif Starts_With (Item, "end of ") then
         return Trim (Item (Item'First + 7 .. Item'Last));
      elsif Ends_With (Item, " end") then
         return Trim (Item (Item'First .. Item'Last - 4));
      else
         return Item;
      end if;
   end Normalize_End_Boundary;

   function Parse_Business_Days_Before_Boundary
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules;
      Value     : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Marker : constant String := " business days before ";
      Singular_Marker : constant String := " business day before ";
      Marker_Pos : Natural := Find_Substring (Item, Marker);
      Marker_Length : Natural := Marker'Length;
      Count : Integer;
      Boundary : Ada.Calendar.Time;
   begin
      if Marker_Pos = 0 then
         Marker_Pos := Find_Substring (Item, Singular_Marker);
         Marker_Length := Singular_Marker'Length;
      end if;

      if Marker_Pos = 0 or else Marker_Pos = Item'First then
         return False;
      end if;

      if not Parse_Natural_Count (Item (Item'First .. Marker_Pos - 1), Count)
        or else Count <= 0
      then
         return False;
      end if;

      declare
         Boundary_Text : constant String :=
           Normalize_End_Boundary
             (Item (Marker_Pos + Marker_Length .. Item'Last));
      begin
         if Boundary_Text'Length = 0
           or else not Boundary_Date
             (Reference, Boundary_Text, True, Boundary)
         then
            return False;
         end if;
      end;

      Value := Humanize.Durations.Add_Business_Days
        (Boundary, -Count, Rules);
      return True;
   end Parse_Business_Days_Before_Boundary;

   function Parse_Label_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
   begin
      return Parse_Quarter_Label (Reference, Text, Low, High)
        or else Parse_Half_Label (Text, Low, High)
        or else Parse_Week_Number (Reference, Text, Low, High);
   end Parse_Label_Range;

   function Parse_Natural_Date_With_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
   is
      Item : constant String := Canonical_Natural_Date_Text (Text);
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
      Parsed : Ada.Calendar.Time;
      Count  : Integer;
      Unit   : Unbounded_String;
      Prefix : Unbounded_String;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      elsif Strip_Time_Of_Day (Item, Prefix, Seconds) then
         declare
            Date : constant Date_Parse_Result :=
              Parse_Natural_Date_With_Rules
                (Reference, To_String (Prefix), Rules);
         begin
            if Date.Status = Humanize.Status.Ok then
               return Date_Result
                 (With_Time_Of_Day (Date.Value, Seconds), Item'Length);
            else
               return Date;
            end if;
         end;
      elsif Parse_ISO_Date (Item, Parsed)
        or else Parse_Month_Name_Date (Reference, Item, Parsed)
        or else Parse_Month_Day_Ordinal_Date (Reference, Item, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Item = "today" or else Item = "now" then
         return Date_Result (Base, Item'Length);
      elsif Item = "later today" then
         declare
            Year  : Ada.Calendar.Year_Number;
            Month : Ada.Calendar.Month_Number;
            Day   : Ada.Calendar.Day_Number;
         begin
            Ada.Calendar.Split (Reference, Year, Month, Day, Seconds);
            return Date_Result
              (With_Time_Of_Day
                 (Base,
                  Ada.Calendar.Day_Duration'Min
                    (Seconds + 3_600.0, 86_399.0)),
               Item'Length);
         end;
      elsif Item = "tonight" then
         return Date_Result (With_Time_Of_Day (Base, 21.0 * 3_600.0),
                             Item'Length);
      elsif Item = "tomorrow" then
         return Date_Result (Add_Calendar_Days (Base, 1), Item'Length);
      elsif Item = "yesterday" then
         return Date_Result (Add_Calendar_Days (Base, -1), Item'Length);
      elsif Parse_Repeated_Weekday (Base, Item, Parsed) then
         return Date_Result (Parsed, Item'Length);
      elsif Parse_Ordinal_Weekday_Date (Reference, Item, Parsed) then
         return Date_Result (Parsed, Item'Length);
      elsif Parse_Weekday_Day_Ordinal_Date (Reference, Item, Parsed) then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "start of ")
        and then Boundary_Date
          (Reference, Item (Item'First + 9 .. Item'Last), False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "beginning of ")
        and then Boundary_Date
          (Reference, Item (Item'First + 13 .. Item'Last), False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Ends_With (Item, " start")
        and then Boundary_Date
          (Reference, Item (Item'First .. Item'Last - 6), False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "end of ")
        and then Boundary_Date
          (Reference, Item (Item'First + 7 .. Item'Last), True, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Ends_With (Item, " end")
        and then Boundary_Date
          (Reference, Item (Item'First .. Item'Last - 4), True, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Item = "next business day" then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, 1, Rules),
            Item'Length);
      elsif Item = "last business day" or else Item = "previous business day" then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, -1, Rules),
            Item'Length);
      elsif Starts_With (Item, "in ")
        and then Ends_With (Item, " business days")
        and then Parse_Natural_Count
          (Item (Item'First + 3 .. Item'Last - 14), Count)
      then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, Count, Rules),
            Item'Length);
      elsif Ends_With (Item, " business days from now")
        and then Parse_Natural_Count
          (Item (Item'First .. Item'Last - 23), Count)
      then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, Count, Rules),
            Item'Length);
      elsif Ends_With (Item, " business days ago")
        and then Parse_Natural_Count
          (Item (Item'First .. Item'Last - 18), Count)
      then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, -Count, Rules),
            Item'Length);
      elsif Item = "business day" then
         return Date_Result
           (Humanize.Durations.Add_Business_Days (Base, 1, Rules),
            Item'Length);
      elsif Item = "business days" then
         return Date_Result (Base, Item'Length);
      elsif Parse_Business_Days_Before_Boundary
        (Reference, Item, Rules, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Boundary_Date (Reference, Item, False, Parsed)
      then
         return Date_Result (Parsed, Item'Length);
      elsif Starts_With (Item, "in ")
        and then Split_Count_Unit
          (Item (Item'First + 3 .. Item'Last), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Result (Unit_Days (Base, Count, To_String (Unit)), Item'Length);
      elsif Ends_With (Item, " ago")
        and then Split_Count_Unit
          (Item (Item'First .. Item'Last - 4), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Result (Unit_Days (Base, -Count, To_String (Unit)), Item'Length);
      elsif Ends_With (Item, " from now")
        and then Split_Count_Unit
          (Item (Item'First .. Item'Last - 9), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Result (Unit_Days (Base, Count, To_String (Unit)), Item'Length);
      elsif Starts_With (Item, "next ") or else Starts_With (Item, "last ")
        or else Starts_With (Item, "this ")
      then
         declare
            Prefix_Length : constant Natural :=
              (if Starts_With (Item, "this ") then 5 else 5);
            Direction : constant Integer :=
              (if Starts_With (Item, "last ") then -1
               elsif Starts_With (Item, "next ") then 1
               else 0);
            Phrase_Body : constant String :=
              Item (Item'First + Prefix_Length .. Item'Last);
            Target : constant Natural := Weekday_Value (Phrase_Body);
            Current : constant Natural := Weekday_Number
              (Ada.Calendar.Formatting.Day_Of_Week (Base));
            Offset : Integer;
         begin
            if Phrase_Body = "day" then
               return Date_Result
                 (Add_Calendar_Days (Base, Direction), Item'Length);
            elsif Phrase_Body = "week" then
               return Date_Result
                 (Add_Calendar_Days (Week_Start (Base), Direction * 7),
                  Item'Length);
            elsif Phrase_Body = "month" then
               return Date_Result (Add_Months (Month_Start (Base), Direction),
                                   Item'Length);
            elsif Phrase_Body = "year" then
               return Date_Result (Add_Years (Year_Start (Base), Direction),
                                   Item'Length);
            elsif Target = 0 then
               return
                 (Status => Humanize.Status.Invalid_Argument,
                  Error_Position => Item'First + Prefix_Length,
                  others => <>);
            end if;

            if Direction > 0 then
               Offset := (if Target > Current then Target - Current
                          else Target + 7 - Current);
               if Offset = 0 then
                  Offset := 7;
               end if;
            elsif Direction < 0 then
               Offset := (if Target < Current then Integer (Target) - Integer (Current)
                          else Integer (Target) - Integer (Current) - 7);
               if Offset = 0 then
                  Offset := -7;
               end if;
            else
               Offset := Integer (Target) - Integer (Current);
            end if;
            return Date_Result
              (Add_Calendar_Days (Base, Offset), Item'Length);
         end;
      else
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            others => <>);
      end if;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Natural_Date_With_Rules;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
   is
      Rules : constant Humanize.Durations.Business_Calendar_Rules :=
        (others => <>);
   begin
      return Parse_Natural_Date_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date;

   function Parse_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
   is
   begin
      return Parse_Natural_Date_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date;

   function Date_Range_Result
     (Low      : Ada.Calendar.Time;
      High     : Ada.Calendar.Time;
      Consumed : Natural;
      Exact    : Boolean := True)
      return Date_Range_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Low => Low,
         High => High,
         Exact => Exact,
         Consumed => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Date_Range_Result;

   function Range_Unit_End
     (Start : Ada.Calendar.Time;
      Unit  : String;
      Count : Integer)
      return Ada.Calendar.Time
   is
      U : constant String := Lower (Unit);
   begin
      if U = "day" or else U = "days" then
         return Add_Calendar_Days (Start, Count);
      elsif U = "week" or else U = "weeks" then
         return Add_Calendar_Days (Start, Count * 7);
      elsif U = "month" or else U = "months" then
         return Add_Months (Start, Count);
      elsif U = "year" or else U = "years" then
         return Add_Years (Start, Count);
      else
         return Start;
      end if;
   end Range_Unit_End;

   function Parse_Month_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Left, Right : Unbounded_String;
      Ref_Year : Ada.Calendar.Year_Number;
      Ref_Month : Ada.Calendar.Month_Number;
      Ref_Day : Ada.Calendar.Day_Number;
      Ref_Seconds : Ada.Calendar.Day_Duration;
      Month : Natural;
      Year : Ada.Calendar.Year_Number;
   begin
      Ada.Calendar.Split (Reference, Ref_Year, Ref_Month, Ref_Day, Ref_Seconds);
      Year := Ref_Year;

      if Split_Once (Item, Left, Right) then
         Month := Month_Value (To_String (Left));
         if Month = 0 or else not Parse_Year_Token (To_String (Right), Year) then
            return False;
         end if;
      else
         Month := Month_Value (Item);
         if Month = 0 then
            return False;
         end if;
      end if;

      Low := Ada.Calendar.Time_Of
        (Year, Ada.Calendar.Month_Number (Month), 1, 0.0);
      High := Add_Months (Low, 1);
      return True;
   exception
      when others =>
         return False;
   end Parse_Month_Period_Range;

   function Parse_Basic_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
   begin
      if Item = "this week" then
         Low := Week_Start (Base);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "next week" then
         Low := Add_Calendar_Days (Week_Start (Base), 7);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "last week" then
         Low := Add_Calendar_Days (Week_Start (Base), -7);
         High := Add_Calendar_Days (Low, 7);
      elsif Item = "this month" then
         Low := Month_Start (Base);
         High := Add_Months (Low, 1);
      elsif Item = "next month" then
         Low := Add_Months (Month_Start (Base), 1);
         High := Add_Months (Low, 1);
      elsif Item = "last month" then
         Low := Add_Months (Month_Start (Base), -1);
         High := Add_Months (Low, 1);
      elsif Item = "this quarter" then
         Low := Quarter_Start (Base);
         High := Add_Quarters (Low, 1);
      elsif Item = "next quarter" then
         Low := Add_Quarters (Quarter_Start (Base), 1);
         High := Add_Quarters (Low, 1);
      elsif Item = "last quarter" then
         Low := Add_Quarters (Quarter_Start (Base), -1);
         High := Add_Quarters (Low, 1);
      elsif Item = "this year" then
         Low := Year_Start (Base);
         High := Add_Years (Low, 1);
      elsif Item = "next year" then
         Low := Add_Years (Year_Start (Base), 1);
         High := Add_Years (Low, 1);
      elsif Item = "last year" then
         Low := Add_Years (Year_Start (Base), -1);
         High := Add_Years (Low, 1);
      elsif Parse_Label_Range (Reference, Item, Low, High)
        or else Parse_Month_Period_Range (Reference, Item, Low, High)
      then
         null;
      else
         return False;
      end if;

      return True;
   end Parse_Basic_Period_Range;

   function Parse_Phased_Period_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Low       : out Ada.Calendar.Time;
      High      : out Ada.Calendar.Time)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Space : Natural := 0;
      Phase : Unbounded_String;
      Period_Body : Unbounded_String;
      Period_Low : Ada.Calendar.Time;
      Period_High : Ada.Calendar.Time;
      Days : Natural;
      First_Len : Natural;
      Second_Len : Natural;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;

      if Space = 0 then
         if Starts_With (Item, "mid-") then
            Phase := To_Unbounded_String ("mid");
            Period_Body :=
              To_Unbounded_String (Item (Item'First + 4 .. Item'Last));
         else
            return False;
         end if;
      else
         Phase := To_Unbounded_String (Item (Item'First .. Space - 1));
         Period_Body :=
           To_Unbounded_String (Trim (Item (Space + 1 .. Item'Last)));
      end if;
      if To_String (Phase) /= "early"
        and then To_String (Phase) /= "mid"
        and then To_String (Phase) /= "late"
      then
         return False;
      end if;

      if not Parse_Basic_Period_Range
        (Reference, To_String (Period_Body), Period_Low, Period_High)
      then
         return False;
      end if;

      Days := Natural ((Period_High - Period_Low) / 86_400.0);
      if Days = 0 then
         return False;
      end if;
      First_Len := (Days + 2) / 3;
      Second_Len := (Days + 1) / 3;

      if To_String (Phase) = "early" then
         Low := Period_Low;
         High := Add_Calendar_Days (Period_Low, Integer (First_Len));
      elsif To_String (Phase) = "mid" then
         Low := Add_Calendar_Days (Period_Low, Integer (First_Len));
         High := Add_Calendar_Days (Low, Integer (Second_Len));
      else
         Low := Add_Calendar_Days
           (Period_Low, Integer (First_Len + Second_Len));
         High := Period_High;
      end if;
      return True;
   exception
      when others =>
         return False;
   end Parse_Phased_Period_Range;

   function Parse_Natural_Date_Range_With_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Base : constant Ada.Calendar.Time := Day_Start (Reference);
      Count : Integer;
      Unit  : Unbounded_String;
      Left_Date  : Date_Parse_Result;
      Right_Date : Date_Parse_Result;
      Label_Low  : Ada.Calendar.Time;
      Label_High : Ada.Calendar.Time;
      Sep : Natural := 0;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      elsif Item = "today" or else Item = "tomorrow" or else Item = "yesterday"
        or else Item = "now"
      then
         Left_Date := Parse_Natural_Date_With_Rules (Reference, Item, Rules);
         if Left_Date.Status = Humanize.Status.Ok then
            return Date_Range_Result
              (Left_Date.Value, Add_Calendar_Days (Left_Date.Value, 1),
               Item'Length);
         end if;
      elsif Item = "this week" then
         return Date_Range_Result
           (Week_Start (Base), Add_Calendar_Days (Week_Start (Base), 7),
            Item'Length);
      elsif Item = "next week" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 7);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 7), Item'Length);
         end;
      elsif Item = "last week" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), -7);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 7), Item'Length);
         end;
      elsif Item = "this weekend" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 5);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 2), Item'Length);
         end;
      elsif Item = "next weekend" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), 12);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 2), Item'Length);
         end;
      elsif Item = "last weekend" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Calendar_Days (Week_Start (Base), -2);
         begin
            return Date_Range_Result
              (Low, Add_Calendar_Days (Low, 2), Item'Length);
         end;
      elsif Item = "this month" then
         return Date_Range_Result
           (Month_Start (Base), Add_Months (Month_Start (Base), 1), Item'Length);
      elsif Item = "next month" then
         declare
            Low : constant Ada.Calendar.Time := Add_Months (Month_Start (Base), 1);
         begin
            return Date_Range_Result (Low, Add_Months (Low, 1), Item'Length);
         end;
      elsif Item = "last month" then
         declare
            Low : constant Ada.Calendar.Time := Add_Months (Month_Start (Base), -1);
         begin
            return Date_Range_Result (Low, Add_Months (Low, 1), Item'Length);
         end;
      elsif Item = "this year" then
         return Date_Range_Result
           (Year_Start (Base), Add_Years (Year_Start (Base), 1), Item'Length);
      elsif Item = "next year" then
         declare
            Low : constant Ada.Calendar.Time := Add_Years (Year_Start (Base), 1);
         begin
            return Date_Range_Result (Low, Add_Years (Low, 1), Item'Length);
         end;
      elsif Item = "last year" then
         declare
            Low : constant Ada.Calendar.Time := Add_Years (Year_Start (Base), -1);
         begin
            return Date_Range_Result (Low, Add_Years (Low, 1), Item'Length);
         end;
      elsif Item = "this quarter" then
         return Date_Range_Result
           (Quarter_Start (Base), Add_Quarters (Quarter_Start (Base), 1),
            Item'Length);
      elsif Item = "next quarter" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Quarters (Quarter_Start (Base), 1);
         begin
            return Date_Range_Result (Low, Add_Quarters (Low, 1), Item'Length);
         end;
      elsif Item = "last quarter" then
         declare
            Low : constant Ada.Calendar.Time :=
              Add_Quarters (Quarter_Start (Base), -1);
         begin
            return Date_Range_Result (Low, Add_Quarters (Low, 1), Item'Length);
         end;
      elsif Parse_Phased_Period_Range (Reference, Item, Label_Low, Label_High) then
         return Date_Range_Result (Label_Low, Label_High, Item'Length);
      elsif Parse_Label_Range (Reference, Item, Label_Low, Label_High) then
         return Date_Range_Result (Label_Low, Label_High, Item'Length);
      elsif Starts_With (Item, "next ")
        and then Split_Count_Unit
          (Item (Item'First + 5 .. Item'Last), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Range_Result
           (Base, Range_Unit_End (Base, To_String (Unit), Count), Item'Length);
      elsif (Starts_With (Item, "last ") or else Starts_With (Item, "past "))
        and then Split_Count_Unit
          (Item (Item'First + 5 .. Item'Last), Count, Unit)
        and then Known_Date_Unit (To_String (Unit))
      then
         return Date_Range_Result
           (Range_Unit_End (Base, To_String (Unit), -Count), Base, Item'Length);
      end if;

      Sep := Find_Substring (Item, " to ");
      if Sep = 0 then
         Sep := Find_Substring (Item, " through ");
      end if;
      if Sep = 0 then
         Sep := Find_Substring (Item, "..");
      end if;
      if Sep = 0 and then Starts_With (Item, "between ") then
         Sep := Find_Substring (Item, " and ");
      end if;

      if Sep /= 0 then
         declare
            Left_First : Natural := Item'First;
            Left_Last  : constant Natural := Sep - 1;
            Right_First : Natural;
         begin
            if Starts_With (Item, "between ") then
               Left_First := Item'First + 8;
            end if;
            if Sep + 1 <= Item'Last and then Item (Sep .. Sep + 1) = ".." then
               Right_First := Sep + 2;
            elsif Find_Substring (Item (Sep .. Item'Last), " through ") = Sep then
               Right_First := Sep + 9;
            else
               Right_First := Sep + 4;
            end if;

            if Left_Last >= Left_First and then Right_First <= Item'Last then
               Left_Date := Parse_Natural_Date_With_Rules
                 (Reference, Item (Left_First .. Left_Last), Rules);
               Right_Date := Parse_Natural_Date_With_Rules
                 (Reference, Item (Right_First .. Item'Last), Rules);
               if Left_Date.Status = Humanize.Status.Ok
                 and then Right_Date.Status = Humanize.Status.Ok
               then
                  return Date_Range_Result
                    (Left_Date.Value, Right_Date.Value, Item'Length);
               end if;
            end if;
         end;
      end if;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Item'First,
         others => <>);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Natural_Date_Range_With_Rules;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result
   is
      Rules : constant Humanize.Durations.Business_Calendar_Rules :=
        (others => <>);
   begin
      return Parse_Natural_Date_Range_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date_Range;

   function Parse_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
   is
   begin
      return Parse_Natural_Date_Range_With_Rules (Reference, Text, Rules);
   end Parse_Natural_Date_Range;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Parse_Result
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
            Result : Date_Parse_Result :=
              Parse_Natural_Date (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date;

   function Scan_Natural_Date
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Parse_Result
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
            Result : Date_Parse_Result :=
              Parse_Natural_Date_With_Rules
                (Reference, Text (Text'First .. Stop), Rules);
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Date_Range_Parse_Result
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
            Result : Date_Range_Parse_Result :=
              Parse_Natural_Date_Range (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date_Range;

   function Scan_Natural_Date_Range
     (Reference : Ada.Calendar.Time;
      Text      : String;
      Rules     : Humanize.Durations.Business_Calendar_Rules)
      return Date_Range_Parse_Result
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
            Result : Date_Range_Parse_Result :=
              Parse_Natural_Date_Range_With_Rules
                (Reference, Text (Text'First .. Stop), Rules);
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Natural_Date_Range;

   function Business_Result
     (Kind       : Business_Calendar_Parse_Kind;
      Consumed   : Natural;
      Date       : Ada.Calendar.Time := Ada.Calendar.Clock;
      End_Date   : Ada.Calendar.Time := Ada.Calendar.Clock;
      Month      : Ada.Calendar.Month_Number := 1;
      Day        : Ada.Calendar.Day_Number := 1;
      Weekday    : Natural := 0;
      Start_Hour : Natural := 0;
      End_Hour   : Natural := 0)
      return Business_Calendar_Parse_Result
   is
   begin
      return
        (Status     => Humanize.Status.Ok,
         Kind       => Kind,
         Date       => Date,
         End_Date   => End_Date,
         Month      => Month,
         Day        => Day,
         Weekday    => Weekday,
         Start_Hour => Start_Hour,
         End_Hour   => End_Hour,
         Exact      => True,
         Consumed   => Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Business_Result;

   function Parse_Hour (Text : String; Value : out Natural) return Boolean is
      Item : constant String := Lower (Trim (Text));
      Stop : Natural := Item'Last;
      Raw  : Integer;
   begin
      if Ends_With (Item, ":00") then
         Stop := Item'Last - 3;
      end if;
      if Stop < Item'First then
         return False;
      end if;
      Raw := Integer'Value (Item (Item'First .. Stop));
      if Raw not in 0 .. 24 then
         return False;
      end if;
      Value := Natural (Raw);
      return True;
   exception
      when others =>
         return False;
   end Parse_Hour;

   function Parse_Hour_Range
     (Text       : String;
      Start_Hour : out Natural;
      End_Hour   : out Natural)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Sep  : Natural := 0;
   begin
      Sep := Find_Substring (Item, "-");
      if Sep = 0 then
         Sep := Find_Substring (Item, " to ");
      end if;
      if Sep = 0 then
         return False;
      elsif Item (Sep) = '-' then
         return Parse_Hour (Item (Item'First .. Sep - 1), Start_Hour)
           and then Parse_Hour (Item (Sep + 1 .. Item'Last), End_Hour)
           and then Start_Hour < End_Hour;
      else
         return Parse_Hour (Item (Item'First .. Sep - 1), Start_Hour)
           and then Parse_Hour (Item (Sep + 4 .. Item'Last), End_Hour)
           and then Start_Hour < End_Hour;
      end if;
   end Parse_Hour_Range;

   function Month_Day_From_Text
     (Text  : String;
      Month : out Ada.Calendar.Month_Number;
      Day   : out Ada.Calendar.Day_Number)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Space : Natural := 0;
      M : Natural;
      D : Integer;
   begin
      for Index in Item'Range loop
         if Item (Index) = ' ' then
            Space := Index;
            exit;
         end if;
      end loop;
      if Space = 0 then
         return False;
      end if;
      M := Month_Value (Item (Item'First .. Space - 1));
      D := Integer'Value (Item (Space + 1 .. Item'Last));
      if M not in 1 .. 12
        or else D < 1
        or else D > Integer (Days_In_Month (2024, Ada.Calendar.Month_Number (M)))
      then
         return False;
      end if;
      Month := Ada.Calendar.Month_Number (M);
      Day := Ada.Calendar.Day_Number (D);
      return True;
   exception
      when others =>
         return False;
   end Month_Day_From_Text;

   function Is_Default_Open_Hour (Value : Ada.Calendar.Time) return Boolean is
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
      Hour    : Natural;
   begin
      Ada.Calendar.Split (Value, Year, Month, Day, Seconds);
      Hour := Natural (Seconds / 3_600.0);
      return Is_Default_Business_Day (Value) and then Hour in 9 .. 16;
   end Is_Default_Open_Hour;

   function Next_Default_Open_Hour
     (Reference : Ada.Calendar.Time;
      Hour      : out Natural)
      return Ada.Calendar.Time
   is
      Candidate : Ada.Calendar.Time := Reference;
      Year    : Ada.Calendar.Year_Number;
      Month   : Ada.Calendar.Month_Number;
      Day     : Ada.Calendar.Day_Number;
      Seconds : Ada.Calendar.Day_Duration;
   begin
      for Attempt in 1 .. 24 * 14 loop
         Candidate := Candidate + 3_600.0;
         if Is_Default_Open_Hour (Candidate) then
            Ada.Calendar.Split (Candidate, Year, Month, Day, Seconds);
            Hour := Natural (Seconds / 3_600.0);
            return Ada.Calendar.Time_Of (Year, Month, Day, 0.0);
         end if;
      end loop;
      Hour := 0;
      return Day_Start (Reference);
   end Next_Default_Open_Hour;

   function Parse_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Parsed_Date : Date_Parse_Result;
      Parsed_Range : Date_Range_Parse_Result;
      Month : Ada.Calendar.Month_Number;
      Day   : Ada.Calendar.Day_Number;
      Start_Hour : Natural;
      End_Hour   : Natural;
      Weekday    : Natural := 0;
      Tail_First : Natural;
      Sep        : Natural;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 Error => Empty_Input,
                 others => <>);
      elsif Item = "next open business hour" then
         declare
            Open_Hour : Natural;
            Open_Date : constant Ada.Calendar.Time :=
              Next_Default_Open_Hour (Reference, Open_Hour);
         begin
            return Business_Result
              (Business_Next_Open_Hour, Item'Length, Date => Open_Date,
               Start_Hour => Open_Hour, End_Hour => Open_Hour + 1);
         end;
      elsif Starts_With (Item, "holiday ") then
         Parsed_Date := Parse_Natural_Date
           (Reference, Item (Item'First + 8 .. Item'Last));
         if Parsed_Date.Status = Humanize.Status.Ok then
            return Business_Result
              (Business_One_Off_Holiday, Item'Length, Date => Parsed_Date.Value);
         end if;
      elsif Starts_With (Item, "recurring holiday ") then
         if Month_Day_From_Text
           (Item (Item'First + 18 .. Item'Last), Month, Day)
         then
            return Business_Result
              (Business_Recurring_Holiday, Item'Length, Month => Month,
               Day => Day);
         end if;
      elsif Starts_With (Item, "half-day ") then
         Sep := Find_Substring (Item, " until ");
         if Sep = 0 then
            Sep := Find_Substring (Item, " to ");
         end if;
         if Sep /= 0 then
            Parsed_Date := Parse_Natural_Date
              (Reference, Item (Item'First + 9 .. Sep - 1));
            Tail_First := (if Find_Substring (Item (Sep .. Item'Last), " until ") = Sep
                           then Sep + 7 else Sep + 4);
            if Parsed_Date.Status = Humanize.Status.Ok
              and then Parse_Hour (Item (Tail_First .. Item'Last), End_Hour)
            then
               return Business_Result
                 (Business_Half_Day, Item'Length, Date => Parsed_Date.Value,
                  End_Hour => End_Hour);
            end if;
         end if;
      elsif Starts_With (Item, "shutdown ") then
         Parsed_Range := Parse_Natural_Date_Range
           (Reference, Item (Item'First + 9 .. Item'Last));
         if Parsed_Range.Status = Humanize.Status.Ok then
            return Business_Result
              (Business_Shutdown, Item'Length, Date => Parsed_Range.Low,
               End_Date => Parsed_Range.High);
         end if;
      elsif Starts_With (Item, "business hours ") then
         declare
            Rest : constant String := Trim (Item (Item'First + 15 .. Item'Last));
            Space : Natural := 0;
         begin
            for Index in Rest'Range loop
               if Rest (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space /= 0 then
               Weekday := Weekday_Value_Flexible (Rest (Rest'First .. Space - 1));
               if Weekday /= 0
                 and then Parse_Hour_Range
                   (Rest (Space + 1 .. Rest'Last), Start_Hour, End_Hour)
               then
                  return Business_Result
                    (Business_Hour_Range, Item'Length, Weekday => Weekday,
                     Start_Hour => Start_Hour, End_Hour => End_Hour);
               end if;
            elsif Parse_Hour_Range (Rest, Start_Hour, End_Hour) then
               return Business_Result
                 (Business_Hour_Range, Item'Length, Start_Hour => Start_Hour,
                  End_Hour => End_Hour);
            end if;
         end;
      end if;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Item'First,
              Error => Unsupported_Form,
              others => <>);
   exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error => Unsupported_Form,
            others => <>);
   end Parse_Business_Calendar;

   function Scan_Business_Calendar
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Parse_Result
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
            Result : Business_Calendar_Parse_Result :=
              Parse_Business_Calendar (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Business_Calendar;

   function Apply_Business_Calendar_Rule
     (Rules : in out Humanize.Durations.Business_Calendar_Rules;
      Rule  : Business_Calendar_Parse_Result)
      return Humanize.Status.Status_Code
   is
   begin
      if Rule.Status /= Humanize.Status.Ok then
         return Humanize.Status.Invalid_Argument;
      end if;

      case Rule.Kind is
         when Business_One_Off_Holiday =>
            return Humanize.Durations.Add_One_Off_Holiday (Rules, Rule.Date);
         when Business_Recurring_Holiday =>
            return Humanize.Durations.Add_Recurring_Holiday
              (Rules, Rule.Month, Rule.Day);
         when Business_Half_Day =>
            return Humanize.Durations.Add_Half_Day
              (Rules, Rule.Date, Rule.End_Hour);
         when Business_Shutdown =>
            return Humanize.Durations.Add_Shutdown
              (Rules, Rule.Date, Rule.End_Date);
         when Business_Hour_Range =>
            return Humanize.Durations.Set_Business_Hours
              (Rules, Rule.Weekday, Rule.Start_Hour, Rule.End_Hour);
         when Business_Next_Open_Hour =>
            return Humanize.Status.Invalid_Argument;
      end case;
   end Apply_Business_Calendar_Rule;

   function Parse_Business_Calendar_Rules
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Business_Calendar_Rules_Parse_Result
   is
      Rules : Humanize.Durations.Business_Calendar_Rules;
      Start : Natural := Text'First;
      Stop  : Natural;
      First_Nonblank : Natural;
      Last_Nonblank  : Natural;
      Rule  : Business_Calendar_Parse_Result;
      Status : Humanize.Status.Status_Code;

      function Is_Separator (Item : Character) return Boolean is
        (Item = ';'
         or else Item = Character'Val (10)
         or else Item = Character'Val (13));

      function Is_Blank (Item : Character) return Boolean is
        (Item = ' ' or else Item = Character'Val (9));
   begin
      if Text'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      while Start <= Text'Last loop
         Stop := Start;
         while Stop <= Text'Last and then not Is_Separator (Text (Stop)) loop
            Stop := Stop + 1;
         end loop;

         First_Nonblank := Start;
         Last_Nonblank := Stop - 1;
         while First_Nonblank <= Last_Nonblank
           and then Is_Blank (Text (First_Nonblank))
         loop
            First_Nonblank := First_Nonblank + 1;
         end loop;
         while Last_Nonblank >= First_Nonblank
           and then Is_Blank (Text (Last_Nonblank))
         loop
            Last_Nonblank := Last_Nonblank - 1;
         end loop;

         if First_Nonblank <= Last_Nonblank then
            Rule := Parse_Business_Calendar
              (Reference, Text (First_Nonblank .. Last_Nonblank));
            if Rule.Status /= Humanize.Status.Ok then
               return
                 (Status => Rule.Status,
                  Rules => Rules,
                  Exact => False,
                  Consumed => Natural'Max (0, First_Nonblank - Text'First),
                  Error_Position => First_Nonblank,
                  Error => Rule.Error);
            end if;

            Status := Apply_Business_Calendar_Rule (Rules, Rule);
            if Status /= Humanize.Status.Ok then
               return
                 (Status => Status,
                  Rules => Rules,
                  Exact => False,
                  Consumed => Natural'Max (0, First_Nonblank - Text'First),
                  Error_Position => First_Nonblank,
                  Error => Unsupported_Form);
            end if;
         end if;

         Start := Stop + 1;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Rules => Rules,
         Exact => True,
         Consumed => Text'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Business_Calendar_Rules;

   function Parse_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
   is
      Item : constant String := Trim (Text);
      Dash : Natural := 0;
   begin
      for Index in Item'Range loop
         if Item (Index) = '-' then
            Dash := Index;
            exit;
         end if;
      end loop;

      if Dash = 0 or else Dash = Item'First or else Dash = Item'Last then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Item'Length = 0 then Text'First
               elsif Dash = 0 then Item'First
               else Dash),
            Error =>
              (if Item'Length = 0 then Empty_Input
               else Expected_Separator),
            others => <>);
      end if;

      declare
         Left  : constant Duration_Parse_Result :=
           Parse_Duration (Item (Item'First .. Dash - 1));
         Right : constant Duration_Parse_Result :=
           Parse_Duration (Item (Dash + 1 .. Item'Last));
      begin
         if Left.Status /= Humanize.Status.Ok then
            return
              (Status => Left.Status,
               Error_Position => Item'First,
               Error => Diagnostic
                 (Left.Status, Left.Error_Position, Left.Error),
               others => <>);
         elsif Right.Status /= Humanize.Status.Ok then
            return
              (Status => Right.Status,
               Error_Position => Dash + 1,
               Error => Diagnostic
                 (Right.Status, Right.Error_Position, Right.Error),
               others => <>);
         elsif Right.Value < Left.Value then
            return
              (Status => Humanize.Status.Invalid_Value,
               Error => Out_Of_Range,
               others => <>);
         end if;

         return
           (Status => Humanize.Status.Ok,
            Low => Left.Value,
            High => Right.Value,
            Exact => Left.Exact and then Right.Exact,
            Consumed => Item'Length,
            Error_Position => 0,
         Error => No_Parse_Error);
      end;
   end Parse_Duration_Range;

   function Scan_Duration_Range
     (Text : String)
      return Duration_Range_Parse_Result
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
            Result : constant Duration_Range_Parse_Result :=
              Parse_Duration_Range (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Duration_Range;

   function Parse_Countdown
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Lower (Trim (Text));
      Suffix : constant String := " remaining";
   begin
      if Item'Length > Suffix'Length
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         return Parse_Duration
           (Item (Item'First .. Item'Last - Suffix'Length));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Countdown;

   function Parse_SLA_Window
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Lower (Trim (Text));
      Prefix : constant String := "within ";
   begin
      if Item'Length > Prefix'Length
        and then Item (Item'First .. Item'First + Prefix'Length - 1) = Prefix
      then
         return Parse_Duration
           (Item (Item'First + Prefix'Length .. Item'Last));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_SLA_Window;

   function Parse_Age
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Lower (Trim (Text));
      Suffix : constant String := " old";
   begin
      if Item'Length > Suffix'Length
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         return Parse_Duration
           (Item (Item'First .. Item'Last - Suffix'Length));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Age;

   function Parse_Modified_Ago
     (Text : String)
      return Duration_Parse_Result
   is
      Item   : constant String := Lower (Trim (Text));
      Prefix : constant String := "modified ";
      Suffix : constant String := " ago";
   begin
      if Item = "modified just now" then
         return
           (Status => Humanize.Status.Ok,
            Value => 0,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
         Error => No_Parse_Error);
      elsif Item'Length > Prefix'Length + Suffix'Length
        and then Item (Item'First .. Item'First + Prefix'Length - 1) = Prefix
        and then Item (Item'Last - Suffix'Length + 1 .. Item'Last) = Suffix
      then
         return Parse_Duration
           (Item (Item'First + Prefix'Length .. Item'Last - Suffix'Length));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Modified_Ago;

   function Parse_Two_Naturals
     (Left_Text  : String;
      Right_Text : String;
      Left       : out Natural;
      Right      : out Natural)
      return Boolean
   is
      L, R : Long_Float;
   begin
      if not Numeric_Value (Left_Text, L)
        or else not Numeric_Value (Right_Text, R)
        or else L < 0.0 or else R < 0.0
      then
         return False;
      end if;
      Left := Natural (Long_Float'Rounding (L));
      Right := Natural (Long_Float'Rounding (R));
      return Long_Float (Left) = L and then Long_Float (Right) = R;
   exception
      when others =>
         return False;
   end Parse_Two_Naturals;

   function Parse_Progress
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Of_Pos : Natural := 0;
      Complete_Pos : Natural := 0;
      Suffix : constant String := " complete";
      Done, Total : Natural := 0;
   begin
      for Index in Item'Range loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;

      Complete_Pos := Find_Substring (Item, Suffix);

      if Of_Pos = 0
        or else Complete_Pos = 0
        or else Complete_Pos <= Of_Pos + 4
        or else (Complete_Pos + Suffix'Length <= Item'Last
                 and then Item (Complete_Pos + Suffix'Length) /= ',')
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if not Parse_Two_Naturals
        (Item (Item'First .. Of_Pos - 1),
         Item (Of_Pos + 4 .. Complete_Pos - 1),
         Done, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Count => Done,
         Total => Total,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Progress;

   function Parse_Result_Count
     (Text : String)
      return List_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Amount : Long_Float;
   begin
      if Item = "no results" or else Item = "no result" then
         return (Status => Humanize.Status.Ok, Count => 0, Exact => True,
                 Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
      elsif Ends_With (Item, " results") or else Ends_With (Item, " result") then
         declare
            Stop : constant Natural :=
              (if Ends_With (Item, " results")
               then Item'Last - 8 else Item'Last - 7);
         begin
            if Numeric_Value (Item (Item'First .. Stop), Amount)
              and then Amount >= 0.0
            then
               return
                 (Status => Humanize.Status.Ok,
                  Count => Natural (Long_Float'Rounding (Amount)),
                  Exact => True,
                  Consumed => Item'Length,
                  Error_Position => 0,
         Error => No_Parse_Error);
            end if;
         end;
      end if;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Result_Count;

   function Counted_Result
     (Count    : Natural;
      Noun     : String;
      Consumed : Natural;
      Exact    : Boolean := True)
      return Counted_Noun_Parse_Result
   is
      Result : Counted_Noun_Parse_Result :=
        (Status => Humanize.Status.Ok,
         Count => Count,
         Exact => Exact,
         Consumed => Consumed,
         Error_Position => 0,
         others => <>);
      Copy_Length : constant Natural := Natural'Min (Noun'Length, Result.Noun'Length);
   begin
      if Copy_Length > 0 then
         Result.Noun (1 .. Copy_Length) :=
           Noun (Noun'First .. Noun'First + Copy_Length - 1);
      end if;
      Result.Noun_Length := Copy_Length;
      return Result;
   end Counted_Result;

   function Parse_Count_Prefix (Text : String) return Number_Parse_Result is
      Compact : constant Number_Parse_Result := Parse_Compact_Number (Text);
   begin
      if Text = "no" then
         return (Status => Humanize.Status.Ok, Value => 0, Exact => True,
                 Consumed => Text'Length, Error_Position => 0,
         Error => No_Parse_Error);
      elsif Text = "a" or else Text = "an" then
         return (Status => Humanize.Status.Ok, Value => 1, Exact => True,
                 Consumed => Text'Length, Error_Position => 0,
         Error => No_Parse_Error);
      elsif Compact.Status = Humanize.Status.Ok then
         return Compact;
      else
         return Parse_Cardinal (Text);
      end if;
   end Parse_Count_Prefix;

   function Parse_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      for Split in reverse Item'First + 1 .. Item'Last loop
         if Item (Split) = ' ' then
            declare
               Count_Text : constant String := Trim (Item (Item'First .. Split - 1));
               Noun_Text  : constant String := Trim (Item (Split + 1 .. Item'Last));
               Count      : constant Number_Parse_Result :=
                 Parse_Count_Prefix (Count_Text);
            begin
               if Noun_Text'Length > 0
                 and then Count.Status = Humanize.Status.Ok
                 and then Count.Value >= 0
               then
                  return Counted_Result
                    (Natural (Count.Value), Noun_Text, Item'Length, Count.Exact);
               end if;
            end;
         end if;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Counted_Noun;

   function Scan_Counted_Noun
     (Text : String)
      return Counted_Noun_Parse_Result
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
            Result : constant Counted_Noun_Parse_Result :=
              Parse_Counted_Noun (Text (Text'First .. Stop));
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
   end Scan_Counted_Noun;

   function Parse_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Core_First : Natural := Item'First;
      Dash : Natural := 0;
      Join : Natural := 0;
      Low, High : Natural := 0;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      if Starts_With (Item, "about ") then
         Core_First := Item'First + 6;
      elsif Starts_With (Item, "approximately ") then
         Core_First := Item'First + 14;
      elsif Starts_With (Item, "under ") then
         if Parse_Two_Naturals
           ("0", Item (Item'First + 6 .. Item'Last), Low, High)
         then
            return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
                    High => Long_Long_Integer (High), Exact => True,
                    Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First + 6,
            Error => Expected_Number,
            others => <>);
      elsif Starts_With (Item, "up to ") then
         if Parse_Two_Naturals
           ("0", Item (Item'First + 6 .. Item'Last), Low, High)
         then
            return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
                    High => Long_Long_Integer (High), Exact => True,
                    Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First + 6,
            Error => Expected_Number,
            others => <>);
      elsif Starts_With (Item, "between ") then
         Join := Find_Substring (Item, " and ");
         if Join = 0
           or else not Parse_Two_Naturals
             (Item (Item'First + 8 .. Join - 1),
              Item (Join + 5 .. Item'Last), Low, High)
         then
            return
              (Status => Humanize.Status.Invalid_Argument,
               Error_Position =>
                 (if Join = 0 then Item'First + 8 else Join + 5),
               Error =>
                 (if Join = 0 then Expected_Separator
                  else Expected_Number),
               others => <>);
         end if;
         if High < Low then
            return
              (Status => Humanize.Status.Invalid_Value,
               Error => Out_Of_Range,
               others => <>);
         end if;
         return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
                 High => Long_Long_Integer (High), Exact => True,
                 Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
      end if;

      for Index in Core_First .. Item'Last loop
         if Item (Index) = '-' then
            Dash := Index;
            exit;
         end if;
      end loop;

      if Dash = 0
        or else Dash = Core_First
        or else Dash = Item'Last
        or else not Parse_Two_Naturals
          (Item (Core_First .. Dash - 1), Item (Dash + 1 .. Item'Last),
           Low, High)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Dash = 0 then Core_First
               elsif Dash = Core_First then Dash
               elsif Dash = Item'Last then Dash
               else Core_First),
            Error =>
              (if Dash = 0 or else Dash = Core_First or else Dash = Item'Last
               then Expected_Separator
               else Expected_Number),
            others => <>);
      end if;

      if High < Low then
         return
           (Status => Humanize.Status.Invalid_Value,
            Error => Out_Of_Range,
            others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Low => Long_Long_Integer (Low),
              High => Long_Long_Integer (High), Exact => True,
              Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Number_Range;

   function Scan_Number_Range
     (Text : String)
      return Number_Range_Parse_Result
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
            Result : constant Number_Range_Parse_Result :=
              Parse_Number_Range (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Number_Range;

   function Parse_Proportion
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Join : Natural := 0;
      Count, Total : Natural := 0;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      Join := Find_Substring (Item, " out of ");
      if Join /= 0 then
         if Parse_Two_Naturals
           (Item (Item'First .. Join - 1), Item (Join + 8 .. Item'Last),
            Count, Total)
         then
            return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
                    Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Join = Item'First then Item'First else Join + 8),
            Error => Expected_Number,
            others => <>);
      end if;

      Join := Find_Substring (Item, " in ");
      if Join /= 0 then
         if Parse_Two_Naturals
           (Item (Item'First .. Join - 1), Item (Join + 4 .. Item'Last),
            Count, Total)
         then
            return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
                    Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
         end if;
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Join = Item'First then Item'First else Join + 4),
            Error => Expected_Number,
            others => <>);
      end if;

      for Index in Item'Range loop
         if Item (Index) = ':' then
            Join := Index;
            exit;
         end if;
      end loop;

      if Join = 0
        or else Join = Item'First
        or else Join = Item'Last
        or else not Parse_Two_Naturals
          (Item (Item'First .. Join - 1), Item (Join + 1 .. Item'Last),
           Count, Total)
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if Join = 0 then Item'First else Join),
            Error =>
              (if Join = 0 then Expected_Separator else Expected_Number),
            others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Proportion;

   function Scan_Proportion
     (Text : String)
      return Proportion_Parse_Result
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
            Result : constant Proportion_Parse_Result :=
              Parse_Proportion (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Proportion;

   function Parse_Showing_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Prefix : constant String := "showing ";
      Of_Pos : Natural := 0;
      Shown, Total : Natural := 0;
   begin
      if Item'Length <= Prefix'Length
        or else Item (Item'First .. Item'First + Prefix'Length - 1) /= Prefix
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Index in Item'First + Prefix'Length .. Item'Last loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;
      if Of_Pos = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      declare
         Tail : constant String := Item (Of_Pos + 4 .. Item'Last);
         End_Total : Natural := Tail'First - 1;
      begin
         for Index in Tail'Range loop
            exit when Tail (Index) = ' ';
            End_Total := Index;
         end loop;
         if End_Total < Tail'First
           or else not Parse_Two_Naturals
             (Item (Item'First + Prefix'Length .. Of_Pos - 1),
              Tail (Tail'First .. End_Total), Shown, Total)
         then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      end;
      return (Status => Humanize.Status.Ok, Count => Shown, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Showing_Count;

   function Parse_Page_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Prefix : constant String := "page ";
      Of_Pos : Natural := 0;
      Page, Total : Natural := 0;
   begin
      if Item'Length <= Prefix'Length
        or else Item (Item'First .. Item'First + Prefix'Length - 1) /= Prefix
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Index in Item'First + Prefix'Length .. Item'Last loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;
      if Of_Pos = 0
        or else not Parse_Two_Naturals
          (Item (Item'First + Prefix'Length .. Of_Pos - 1),
           Item (Of_Pos + 4 .. Item'Last), Page, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      return (Status => Humanize.Status.Ok, Count => Page, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Page_Count;

   function Parse_ETA
     (Text : String)
      return Duration_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Prefix : constant String := "eta ";
   begin
      if Starts_With (Item, Prefix) then
         return Parse_Duration (Item (Item'First + Prefix'Length .. Item'Last));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_ETA;

   function Parse_Retry_In
     (Text : String)
      return Duration_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Prefix : constant String := "retrying in ";
   begin
      if Starts_With (Item, Prefix) then
         return Parse_Duration (Item (Item'First + Prefix'Length .. Item'Last));
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
   end Parse_Retry_In;

   function Parse_Count_Of_Total
     (Text   : String;
      Prefix : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Of_Pos : Natural := 0;
      Count, Total : Natural := 0;
   begin
      if not Starts_With (Item, Prefix) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Index in Item'First + Prefix'Length .. Item'Last loop
         if Index + 3 <= Item'Last and then Item (Index .. Index + 3) = " of "
         then
            Of_Pos := Index;
            exit;
         end if;
      end loop;

      if Of_Pos = 0
        or else not Parse_Two_Naturals
          (Item (Item'First + Prefix'Length .. Of_Pos - 1),
           Item (Of_Pos + 4 .. Item'Last), Count, Total)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Count => Count, Total => Total,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Count_Of_Total;

   function Parse_Step_Count
     (Text : String)
      return Proportion_Parse_Result is
   begin
      return Parse_Count_Of_Total (Text, "step ");
   end Parse_Step_Count;

   function Parse_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result is
   begin
      return Parse_Count_Of_Total (Text, "attempt ");
   end Parse_Attempt_Count;

   function Parse_Number_With_Suffix
     (Text   : String;
      Suffix : String)
      return Number_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Amount : Long_Float;
      Rounded : Long_Long_Integer;
   begin
      if not Ends_With (Item, Suffix)
        or else Item'Length <= Suffix'Length
        or else not Numeric_Value
          (Item (Item'First .. Item'Last - Suffix'Length), Amount)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Rounded := Long_Long_Integer (Long_Float'Rounding (Amount));
      return
        (Status => Humanize.Status.Ok,
         Value => Rounded,
         Exact => Long_Float (Rounded) = Amount,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Number_With_Suffix;

   function Parse_Business_Days
     (Text : String)
      return Number_Parse_Result is
   begin
      if Ends_With (Lower (Trim (Text)), " business day") then
         return Parse_Number_With_Suffix (Text, " business day");
      else
         return Parse_Number_With_Suffix (Text, " business days");
      end if;
   end Parse_Business_Days;

   function Parse_Working_Hours
     (Text : String)
      return Number_Parse_Result is
   begin
      if Ends_With (Lower (Trim (Text)), " working hour") then
         return Parse_Number_With_Suffix (Text, " working hour");
      else
         return Parse_Number_With_Suffix (Text, " working hours");
      end if;
   end Parse_Working_Hours;

   function Recurrence_Unit_Value
     (Text : String;
      Unit : out Humanize.Durations.Recurrence_Unit)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "second" or else Item = "seconds" then
         Unit := Humanize.Durations.Every_Second;
      elsif Item = "minute" or else Item = "minutes" then
         Unit := Humanize.Durations.Every_Minute;
      elsif Item = "hour" or else Item = "hours" then
         Unit := Humanize.Durations.Every_Hour;
      elsif Item = "day" or else Item = "days" then
         Unit := Humanize.Durations.Every_Day;
      elsif Item = "week" or else Item = "weeks" then
         Unit := Humanize.Durations.Every_Week;
      elsif Item = "month" or else Item = "months" then
         Unit := Humanize.Durations.Every_Month;
      elsif Item = "quarter" or else Item = "quarters" then
         Unit := Humanize.Durations.Every_Quarter;
      elsif Item = "year" or else Item = "years" then
         Unit := Humanize.Durations.Every_Year;
      else
         return False;
      end if;
      return True;
   end Recurrence_Unit_Value;

   function Recurrence_Ordinal_Value (Text : String) return Integer is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "first" or else Item = "1st" then
         return 1;
      elsif Item = "second" or else Item = "2nd" then
         return 2;
      elsif Item = "third" or else Item = "3rd" then
         return 3;
      elsif Item = "fourth" or else Item = "4th" then
         return 4;
      elsif Item = "fifth" or else Item = "5th" then
         return 5;
      elsif Item = "last" then
         return -1;
      else
         return 0;
      end if;
   end Recurrence_Ordinal_Value;

   function Recurrence_Result
     (Kind    : Recurrence_Parse_Kind;
      Every   : Positive;
      Unit    : Humanize.Durations.Recurrence_Unit;
      Consumed : Natural;
      Weekday : Natural := 0;
      Ordinal : Integer := 0)
      return Recurrence_Parse_Result
   is
   begin
      return
        (Status => Humanize.Status.Ok,
         Kind => Kind,
         Every => Every,
         Unit => Unit,
         Weekday => Weekday,
         Ordinal => Ordinal,
         Exact => True,
         Consumed => Consumed,
         others => <>);
   end Recurrence_Result;

   function Parse_Recurrence_Core
     (Core : String)
      return Recurrence_Parse_Result
   is
      Item : constant String := Lower (Trim (Core));
      Prefix : constant String := "every ";
      Space  : Natural := 0;
      Of_Pos : Natural := 0;
      Count  : Integer;
      Unit   : Humanize.Durations.Recurrence_Unit;
      Weekday : Natural;
      Ordinal : Integer;
   begin
      if Item = "last business day"
        or else Item = "last business day of each month"
        or else Item = "last business day of every month"
      then
         return Recurrence_Result
           (Recurrence_Business_Day, 1, Humanize.Durations.Every_Month,
            Item'Length, Ordinal => -1);
      end if;

      Of_Pos := Find_Substring (Item, " of each month");
      if Of_Pos = 0 then
         Of_Pos := Find_Substring (Item, " of every month");
      end if;
      if Of_Pos /= 0 then
         for Index in Item'First .. Of_Pos - 1 loop
            if Item (Index) = ' ' then
               Space := Index;
               exit;
            end if;
         end loop;
         if Space /= 0 then
            Ordinal := Recurrence_Ordinal_Value (Item (Item'First .. Space - 1));
            Weekday := Weekday_Value_Flexible (Item (Space + 1 .. Of_Pos - 1));
            if Ordinal /= 0 and then Weekday /= 0 then
               return Recurrence_Result
                 (Recurrence_Ordinal_Weekday, 1,
                  Humanize.Durations.Every_Month, Item'Length,
                  Weekday => Weekday, Ordinal => Ordinal);
            end if;
         end if;
      end if;

      if not Starts_With (Item, Prefix) then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      declare
         Rest : constant String := Trim (Item (Item'First + Prefix'Length .. Item'Last));
      begin
         if Starts_With (Rest, "other ") then
            declare
               Tail : constant String := Trim (Rest (Rest'First + 6 .. Rest'Last));
            begin
               Weekday := Weekday_Value_Flexible (Tail);
               if Weekday /= 0 then
                  return Recurrence_Result
                    (Recurrence_Weekday, 2, Humanize.Durations.Every_Week,
                     Item'Length, Weekday => Weekday);
               elsif Recurrence_Unit_Value (Tail, Unit) then
                  return Recurrence_Result
                    (Recurrence_Interval, 2, Unit, Item'Length);
               end if;
            end;
         end if;

         Weekday := Weekday_Value_Flexible (Rest);
         if Weekday /= 0 then
            return Recurrence_Result
              (Recurrence_Weekday, 1, Humanize.Durations.Every_Week,
               Item'Length, Weekday => Weekday);
         elsif Recurrence_Unit_Value (Rest, Unit) then
            return Recurrence_Result
              (Recurrence_Interval, 1, Unit, Item'Length);
         end if;

         for Index in Rest'Range loop
            if Rest (Index) = ' ' then
               Space := Index;
               exit;
            end if;
         end loop;

         if Space /= 0
           and then Parse_Natural_Count (Rest (Rest'First .. Space - 1), Count)
           and then Count > 0
           and then Recurrence_Unit_Value (Rest (Space + 1 .. Rest'Last), Unit)
         then
            return Recurrence_Result
              (Recurrence_Interval, Positive (Count), Unit, Item'Length);
         end if;
      end;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Recurrence_Core;

   function Parse_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Core_Last : Natural := Item'Last;
      Result : Recurrence_Parse_Result;
      Clause_Pos : Natural;
      Parsed_Date : Date_Parse_Result;
      Count : Integer;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Clause_Pos := Find_Substring (Item, " for ");
      if Clause_Pos /= 0 then
         declare
            Tail : constant String := Trim (Item (Clause_Pos + 5 .. Item'Last));
            Space : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if Space = 0
              or else not Parse_Natural_Count (Tail (Tail'First .. Space - 1), Count)
              or else Count <= 0
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " until ");
      if Clause_Pos /= 0 then
         Parsed_Date := Parse_Natural_Date
           (Reference, Item (Clause_Pos + 7 .. Core_Last));
         if Parsed_Date.Status /= Humanize.Status.Ok then
            return (Status => Parsed_Date.Status, others => <>);
         end if;
         Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
      end if;

      Clause_Pos := Find_Substring (Item, " from ");
      if Clause_Pos /= 0 then
         Parsed_Date := Parse_Natural_Date
           (Reference, Item (Clause_Pos + 6 .. Core_Last));
         if Parsed_Date.Status /= Humanize.Status.Ok then
            return (Status => Parsed_Date.Status, others => <>);
         end if;
         Core_Last := Natural'Min (Core_Last, Clause_Pos - 1);
      end if;

      if Core_Last < Item'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Result := Parse_Recurrence_Core (Item (Item'First .. Core_Last));
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      end if;

      Clause_Pos := Find_Substring (Item, " from ");
      if Clause_Pos /= 0 then
         declare
            Tail_Last : Natural := Item'Last;
            Until_Pos : constant Natural := Find_Substring (Item, " until ");
            For_Pos   : constant Natural := Find_Substring (Item, " for ");
         begin
            if Until_Pos /= 0 and then Until_Pos > Clause_Pos then
               Tail_Last := Until_Pos - 1;
            elsif For_Pos /= 0 and then For_Pos > Clause_Pos then
               Tail_Last := For_Pos - 1;
            end if;
            Parsed_Date := Parse_Natural_Date
              (Reference, Item (Clause_Pos + 6 .. Tail_Last));
            Result.Has_Start_Date := True;
            Result.Start_Date := Parsed_Date.Value;
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " until ");
      if Clause_Pos /= 0 then
         declare
            Tail_Last : Natural := Item'Last;
            For_Pos : constant Natural := Find_Substring (Item, " for ");
         begin
            if For_Pos /= 0 and then For_Pos > Clause_Pos then
               Tail_Last := For_Pos - 1;
            end if;
            Parsed_Date := Parse_Natural_Date
              (Reference, Item (Clause_Pos + 7 .. Tail_Last));
            Result.Has_End_Date := True;
            Result.End_Date := Parsed_Date.Value;
         end;
      end if;

      Clause_Pos := Find_Substring (Item, " for ");
      if Clause_Pos /= 0 then
         declare
            Tail : constant String := Trim (Item (Clause_Pos + 5 .. Item'Last));
            Space : Natural := 0;
         begin
            for Index in Tail'Range loop
               if Tail (Index) = ' ' then
                  Space := Index;
                  exit;
               end if;
            end loop;
            if not Parse_Natural_Count (Tail (Tail'First .. Space - 1), Count)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Result.Has_Occurrences := True;
            Result.Occurrences := Natural (Count);
         end;
      end if;

      Result.Consumed := Item'Length;
      return Result;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Recurrence_Detail;

   function Parse_Recurrence
     (Text : String)
      return Number_Parse_Result
   is
      Detail : constant Recurrence_Parse_Result :=
        Parse_Recurrence_Detail (Ada.Calendar.Clock, Text);
   begin
      if Detail.Status /= Humanize.Status.Ok then
         return (Status => Detail.Status, others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Detail.Every),
         Exact => True,
         Consumed => Detail.Consumed,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Recurrence;

   function Parse_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Remaining_Pos : constant Natural := Find_Substring (Item, " remaining at ");
      Count, Rate : Natural := 0;
      End_Count : Natural := Item'First - 1;
      Start_Rate : Natural;
      End_Rate : Natural;
   begin
      if Remaining_Pos = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Index in Item'First .. Remaining_Pos - 1 loop
         exit when Item (Index) = ' ';
         End_Count := Index;
      end loop;

      Start_Rate := Remaining_Pos + 14;
      End_Rate := Start_Rate - 1;
      while End_Rate + 1 <= Item'Last and then Item (End_Rate + 1) /= ' ' loop
         End_Rate := End_Rate + 1;
      end loop;

      if End_Count < Item'First
        or else End_Rate < Start_Rate
        or else not Parse_Two_Naturals
          (Item (Item'First .. End_Count),
           Item (Start_Rate .. End_Rate), Count, Rate)
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return (Status => Humanize.Status.Ok, Count => Count, Total => Rate,
              Exact => True, Consumed => Item'Length, Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Throughput_Remaining;

   function Parse_Progress_Bar
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Trim (Text);
      Close : Natural := 0;
   begin
      for Index in Item'Range loop
         if Item (Index) = ']' then
            Close := Index;
            exit;
         end if;
      end loop;

      if Item'Length = 0 or else Item (Item'First) /= '['
        or else Close = 0 or else Close + 2 > Item'Last
        or else Item (Close + 1) /= ' '
        or else Item (Item'Last) /= '%'
      then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      return Parse_Bounded_Number (Item (Close + 2 .. Item'Last - 1), "");
   end Parse_Progress_Bar;

   function Scan_ETA
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Duration_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_ETA (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_ETA;

   function Scan_Retry_In
     (Text : String)
      return Duration_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Duration_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Retry_In (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Retry_In;

   function Scan_Step_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Proportion_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Step_Count (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Step_Count;

   function Scan_Attempt_Count
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Proportion_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Attempt_Count (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Attempt_Count;

   function Scan_Business_Days
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Business_Days (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Business_Days;

   function Scan_Working_Hours
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Working_Hours (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Working_Hours;

   function Scan_Recurrence
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Recurrence (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Recurrence;

   function Scan_Recurrence_Detail
     (Reference : Ada.Calendar.Time;
      Text      : String)
      return Recurrence_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : Recurrence_Parse_Result :=
              Parse_Recurrence_Detail (Reference, Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               Result.Consumed := Stop - Text'First + 1;
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Scan_Recurrence_Detail;

   function Scan_Throughput_Remaining
     (Text : String)
      return Proportion_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Proportion_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Throughput_Remaining (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Throughput_Remaining;

   function Scan_Progress_Bar
     (Text : String)
      return Number_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
      Result : Number_Parse_Result;
   begin
      if Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result := Parse_Progress_Bar (Text (Text'First .. Last));
      if Result.Status = Humanize.Status.Ok then
         Result.Consumed := Last - Text'First + 1;
      end if;
      return Result;
   end Scan_Progress_Bar;

   function Parse_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result
   is
      Source : constant String := Trim (Text);
      Index  : Natural := Source'First;
      Total  : Long_Long_Integer := 0;
      Seen   : Boolean := False;
   begin
      if Source'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      while Index <= Source'Last loop
         while Index <= Source'Last
           and then (Source (Index) = ' ' or else Source (Index) = ',')
         loop
            Index := Index + 1;
         end loop;

         if Index + 2 <= Source'Last
           and then Lower (Source (Index .. Index + 2)) = "and"
         then
            Index := Index + 3;
            while Index <= Source'Last and then Source (Index) = ' ' loop
               Index := Index + 1;
            end loop;
         end if;

         exit when Index > Source'Last;

         declare
            Number_First : constant Natural := Index;
            Amount       : Long_Float;
            Unit_First   : Natural;
            Unit_Last    : Natural;
            Micros       : Long_Long_Integer;
            Rounded      : Long_Long_Integer;
         begin
            while Index <= Source'Last
              and then (Is_Digit (Source (Index))
                        or else Source (Index) = '.'
                        or else Source (Index) = ',')
            loop
               Index := Index + 1;
            end loop;

            if Index = Number_First
              or else not Numeric_Value
                (Source (Number_First .. Index - 1), Amount)
            then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            while Index <= Source'Last and then Source (Index) = ' ' loop
               Index := Index + 1;
            end loop;
            Unit_First := Index;
            while Index <= Source'Last
              and then Source (Index) /= ','
              and then Source (Index) /= ' '
            loop
               Index := Index + 1;
            end loop;
            Unit_Last := Index - 1;

            if Unit_Last < Unit_First then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            Micros := Unit_Microseconds (Source (Unit_First .. Unit_Last));
            Rounded := Rounded_Nonnegative (Amount * Long_Float (Micros));
            if Micros = 0 or else Rounded < 0 then
               return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
            end if;

            Total := Total + Rounded;
            Seen := True;
         exception
            when others =>
               return (Status => Humanize.Status.Invalid_Value, Value => 0, others => <>);
         end;
      end loop;

      if not Seen then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Value  => Humanize.Durations.Duration_Microseconds (Total),
         Exact  => True,
         Consumed => Source'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Precise_Duration;

   function Scan_Precise_Duration
     (Text : String)
      return Precise_Duration_Parse_Result
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
            Result : constant Precise_Duration_Parse_Result :=
              Parse_Precise_Duration (Text (Text'First .. Stop));
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
   end Scan_Precise_Duration;

   function Compact_Multiplier (Unit : String) return Long_Float is
      Raw : constant String := Trim (Unit);
      U : constant String := Lower (Trim (Unit));
   begin
      if U = "" then
         return 1.0;
      elsif Raw = "T" then
         return 1_000_000_000_000.0;
      elsif U = "k" or else U = "t" or else U = "tn" or else U = "thousand"
        or else U = "tusind"
        or else U = "tausend" or else U = "tsd" or else U = "tsd."
        or else U = "mil" or else U = "mille" or else U = "mila"
        or else U = "tusen" or else U = "tuhat"
        or else U = "tysiac" or else U = "tys."
        or else U = "tisic" or else U = "tis." or else U = "bin"
        or else U = B ("D182D18BD181D18FD187D0B0")
        or else U = B ("D182D18BD181D18FD187D0B8")
        or else U = B ("D182D18BD1812E")
        or else U = B ("D182D18BD181D18FD187D0B0")
        or else U = B ("D182D18BD181D18FD187D196")
        or else U = B ("D182D0B8D1812E")
        or else U = B ("E58D83")
        or else U = B ("ECB29C")
        or else U = B ("D8A3D984D981")
        or else U = B ("E0A4B9E0A49CE0A4BEE0A4B0")
        or else U = B ("E0A4B9E0A49CE0A4BCE0A4BEE0A4B0")
      then
         return 1_000.0;
      elsif U = "m" or else U = "million" or else U = "millions"
        or else U = "mio." or else U = "mio"
        or else U = "mill."
        or else U = "milj."
        or else U = "mil."
        or else U = "mln" or else U = "mln."
        or else U = "mi"
        or else U = "mn"
        or else U = "millionen" or else U = "millones"
        or else U = "milione" or else U = "milioni"
        or else U = "milhao" or else U = "milhoes"
        or else U = B ("6D696C68C3A36F")
        or else U = B ("6D696C68C3B56573")
        or else U = "miljoen" or else U = "miljoner"
        or else U = "miljoona" or else U = "miliony"
        or else U = "milion" or else U = "milyon"
        or else U = B ("D0BCD0B8D0BBD0BBD0B8D0BED0BD")
        or else U = B ("D0BCD0B8D0BBD0BBD0B8D0BED0BDD0B0")
        or else U = B ("D0BCD0BBD0BD")
        or else U = B ("D0BCD196D0BBD18CD0B9D0BED0BD")
        or else U = B ("E4B887")
        or else U = B ("E799BEE4B887")
        or else U = B ("E799BE4B887")
        or else U = B ("EBB0B1EBA78C")
        or else U = B ("D985D984D98AD988D986")
      then
         return 1_000_000.0;
      elsif U = "b" or else U = "billion" or else U = "milliard"
        or else U = "milliarde" or else U = "milliarden"
        or else U = "mil millones" or else U = "miliardo"
        or else U = "miliardi" or else U = "bilhao"
        or else U = "bilhoes"
        or else U = B ("62696C68C3A36F")
        or else U = B ("62696C68C3B56573")
        or else U = "miljard" or else U = "miljardi"
        or else U = "miliard" or else U = "milyar"
        or else U = B ("D0BCD0B8D0BBD0BBD0B8D0B0D180D0B4")
        or else U = B ("D0BCD196D0BBD18CD18FD180D0B4")
        or else U = B ("E58D81E58484")
        or else U = B ("EC8BACEC96B5")
        or else U = B ("D985D984D98AD8A7D8B1")
      then
         return 1_000_000_000.0;
      elsif U = "trillion" or else U = "billionen"
        or else U = "biljoner" or else U = "biljoona"
        or else U = "bilion" or else U = "trilyon"
        or else U = B ("D182D180D0B8D0BBD0BBD0B8D0BED0BD")
        or else U = B ("D182D180D0B8D0BBD18CD0B9D0BED0BD")
        or else U = B ("E58586")
        or else U = B ("ECA1B0")
        or else U = B ("D8AAD8B1D98AD984D98AD988D986")
      then
         return 1_000_000_000_000.0;
      elsif U = "lakh" or else U = B ("E0A4B2E0A4BEE0A496") then
         return 100_000.0;
      elsif U = "crore" or else U = B ("E0A495E0A4B0E0A58BE0A4A1E0A4BC") then
         return 10_000_000.0;
      else
         return 0.0;
      end if;
   end Compact_Multiplier;

   function Parse_Compact_Number
     (Text : String)
      return Number_Parse_Result
   is
      Item        : constant String := Trim (Normalize_Native_Digits (Text));
      Last_Number : Natural := Item'First - 1;
      Amount      : Long_Float;
      Multiplier  : Long_Float;
      Rounded     : Long_Long_Integer;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      for Index in Item'Range loop
         if Is_Digit (Item (Index))
           or else Item (Index) = '.'
           or else Item (Index) = ','
           or else Item (Index) = '+'
           or else Item (Index) = '-'
         then
            Last_Number := Index;
         else
            exit;
         end if;
      end loop;

      if Last_Number < Item'First
        or else not Numeric_Value (Item (Item'First .. Last_Number), Amount)
      then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      declare
         Unit : constant String :=
           (if Last_Number = Item'Last then ""
            else Trim (Item (Last_Number + 1 .. Item'Last)));
      begin
         if Unit = "B"
           and then Has_Decimal_Comma (Item (Item'First .. Last_Number))
         then
            Multiplier := 1_000.0;
         else
            Multiplier := Compact_Multiplier (Unit);
         end if;
      end;

      if Multiplier = 0.0 then
         return (Status => Humanize.Status.Invalid_Argument, Value => 0, others => <>);
      end if;

      Rounded := Long_Long_Integer (Long_Float'Rounding (Amount * Multiplier));
      return
        (Status   => Humanize.Status.Ok,
         Value    => Rounded,
         Exact    => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, Value => 0, others => <>);
   end Parse_Compact_Number;

   function Scan_Compact_Number
     (Text : String)
      return Number_Parse_Result
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
            Result : constant Number_Parse_Result :=
              Parse_Compact_Number (Text (Text'First .. Stop));
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
   end Scan_Compact_Number;

   function Small_English_Number (Word : String) return Integer is
      W : constant String := Lower (Trim (Word));
   begin
      if W = "zero" then
         return 0;
      elsif W = "one" or else W = "first" then
         return 1;
      elsif W = "two" or else W = "second" then
         return 2;
      elsif W = "three" or else W = "third" then
         return 3;
      elsif W = "four" or else W = "fourth" then
         return 4;
      elsif W = "five" or else W = "fifth" then
         return 5;
      elsif W = "six" or else W = "sixth" then
         return 6;
      elsif W = "seven" or else W = "seventh" then
         return 7;
      elsif W = "eight" or else W = "eighth" then
         return 8;
      elsif W = "nine" or else W = "ninth" then
         return 9;
      elsif W = "ten" or else W = "tenth" then
         return 10;
      elsif W = "eleven" or else W = "eleventh" then
         return 11;
      elsif W = "twelve" or else W = "twelfth" then
         return 12;
      elsif W = "thirteen" or else W = "thirteenth" then
         return 13;
      elsif W = "fourteen" or else W = "fourteenth" then
         return 14;
      elsif W = "fifteen" or else W = "fifteenth" then
         return 15;
      elsif W = "sixteen" or else W = "sixteenth" then
         return 16;
      elsif W = "seventeen" or else W = "seventeenth" then
         return 17;
      elsif W = "eighteen" or else W = "eighteenth" then
         return 18;
      elsif W = "nineteen" or else W = "nineteenth" then
         return 19;
      elsif W = "twenty" or else W = "twentieth" then
         return 20;
      elsif W = "thirty" or else W = "thirtieth" then
         return 30;
      elsif W = "forty" or else W = "fortieth" then
         return 40;
      elsif W = "fifty" or else W = "fiftieth" then
         return 50;
      elsif W = "sixty" or else W = "sixtieth" then
         return 60;
      elsif W = "seventy" or else W = "seventieth" then
         return 70;
      elsif W = "eighty" or else W = "eightieth" then
         return 80;
      elsif W = "ninety" or else W = "ninetieth" then
         return 90;
      else
         return -1;
      end if;
   end Small_English_Number;

   function Parse_Cardinal
     (Text : String)
      return Number_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Amount : Long_Float;
      Total : Integer := 0;
      Index : Natural := Item'First;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      elsif Numeric_Value (Item, Amount) then
         return
           (Status => Humanize.Status.Ok,
            Value => Long_Long_Integer (Long_Float'Rounding (Amount)),
            Exact => Long_Float'Rounding (Amount) = Amount,
            Consumed => Item'Length,
            Error_Position => 0,
         Error => No_Parse_Error);
      end if;

      while Index <= Item'Last loop
         while Index <= Item'Last
           and then (Item (Index) = ' ' or else Item (Index) = '-')
         loop
            Index := Index + 1;
         end loop;
         exit when Index > Item'Last;
         declare
            Start : constant Natural := Index;
         begin
            while Index <= Item'Last
              and then Item (Index) /= ' ' and then Item (Index) /= '-'
            loop
               Index := Index + 1;
            end loop;
            declare
               Part : constant Integer :=
                 Small_English_Number (Item (Start .. Index - 1));
            begin
               if Part < 0 then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error_Position => Start,
                          others => <>);
               end if;
               Total := Total + Part;
            end;
         end;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Total),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Cardinal;

   function Scan_Cardinal
     (Text : String)
      return Number_Parse_Result
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
            Result : constant Number_Parse_Result :=
              Parse_Cardinal (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Cardinal;

   function Parse_Scientific_Number
     (Text : String)
      return Float_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Value : Long_Float;
      Seen_Exponent : Boolean := False;
   begin
      for Ch of Item loop
         if Ch = 'e' then
            Seen_Exponent := True;
         end if;
      end loop;

      if not Seen_Exponent then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      Value := Long_Float'Value (Item);
      return
        (Status => Humanize.Status.Ok,
         Value => Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Scientific_Number;

   function Scan_Scientific_Number
     (Text : String)
      return Float_Parse_Result
   is
      Last : constant Natural := Scan_Number_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Float_Parse_Result :=
              Parse_Scientific_Number (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Scientific_Number;

   procedure Store
     (Source : String;
      Target : out String;
      Length : out Natural)
   is
      Count : constant Natural := Natural'Min (Source'Length, Target'Length);
   begin
      Target := [others => ' '];
      if Count > 0 then
         Target (Target'First .. Target'First + Count - 1) :=
           Source (Source'First .. Source'First + Count - 1);
      end if;
      Length := Count;
   end Store;

   function Number_Token_End (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Is_Digit (Text (Index))
           or else Text (Index) = '.'
           or else Text (Index) = ','
           or else Text (Index) = '+'
           or else Text (Index) = '-'
         then
            null;
         else
            return Index - 1;
         end if;
      end loop;
      return Text'Last;
   end Number_Token_End;

   function Parse_Number_And_Tail
     (Text   : String;
      Value  : out Long_Float;
      Tail   : out Unbounded_String)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Last : Natural;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      Last := Number_Token_End (Item);
      if Last < Item'First
        or else not Numeric_Value (Item (Item'First .. Last), Value)
      then
         return False;
      end if;

      if Last = Item'Last then
         Tail := Null_Unbounded_String;
      else
         Tail := To_Unbounded_String (Trim (Item (Last + 1 .. Item'Last)));
      end if;
      return True;
   end Parse_Number_And_Tail;

   function Approximation_Prefix
     (Text : String;
      Kind : out Humanize.Numbers.Approximation_Kind;
      Rest : out Unbounded_String)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Starts_With (Item, "about ") then
         Kind := Humanize.Numbers.About;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 6 .. Item'Last)));
      elsif Starts_With (Item, "almost ") then
         Kind := Humanize.Numbers.Almost;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 7 .. Item'Last)));
      elsif Starts_With (Item, "over ") then
         Kind := Humanize.Numbers.Over;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 5 .. Item'Last)));
      elsif Starts_With (Item, "under ") then
         Kind := Humanize.Numbers.Under;
         Rest := To_Unbounded_String (Trim (Item (Item'First + 6 .. Item'Last)));
      else
         return False;
      end if;
      return Length (Rest) > 0;
   end Approximation_Prefix;

   function Parse_Currency_Core
     (Text        : String;
      Approximate : Boolean)
      return Currency_Parse_Result
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
      Tail : Unbounded_String;
      Code_Text : String (1 .. 16);
      Code_Length : Natural;
   begin
      if not Parse_Number_And_Tail (Item, Amount, Tail)
        or else Length (Tail) = 0
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Expected_Number,
            others => <>);
      end if;

      Store (To_String (Tail), Code_Text, Code_Length);
      return
        (Status => Humanize.Status.Ok,
         Amount => Amount,
         Code => Code_Text,
         Code_Length => Code_Length,
         Approximate => Approximate,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error,
         others => <>);
   end Parse_Currency_Core;

   function Parse_Currency
     (Text : String)
      return Currency_Parse_Result is
   begin
      return Parse_Currency_Core (Text, False);
   end Parse_Currency;

   function Scan_Currency
     (Text : String)
      return Currency_Parse_Result
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
            Result : constant Currency_Parse_Result :=
              Parse_Currency (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Currency;

   function Parse_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result
   is
      Kind : Humanize.Numbers.Approximation_Kind;
      Rest : Unbounded_String;
   begin
      if not Approximation_Prefix (Text, Kind, Rest) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Expected_Number,
            others => <>);
      end if;

      declare
         Result : Currency_Parse_Result :=
           Parse_Currency_Core (To_String (Rest), True);
      begin
         if Result.Status = Humanize.Status.Ok then
            Result.Kind := Kind;
            Result.Consumed := Trim (Text)'Length;
         end if;
         return Result;
      end;
   end Parse_Approximate_Currency;

   function Scan_Approximate_Currency
     (Text : String)
      return Currency_Parse_Result
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
            Result : constant Currency_Parse_Result :=
              Parse_Approximate_Currency (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Approximate_Currency;

   function Parse_Approximate_Number
     (Text : String)
      return Number_Parse_Result
   is
      Kind : Humanize.Numbers.Approximation_Kind;
      Rest : Unbounded_String;
      Amount : Long_Float;
   begin
      if not Approximation_Prefix (Text, Kind, Rest)
        or else not Numeric_Value (To_String (Rest), Amount)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Text'First,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Value => Long_Long_Integer (Long_Float'Rounding (Amount)),
         Exact => Long_Float'Rounding (Amount) = Amount,
         Consumed => Trim (Text)'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Approximate_Number;

   function Scan_Approximate_Number
     (Text : String)
      return Number_Parse_Result
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
            Result : constant Number_Parse_Result :=
              Parse_Approximate_Number (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Approximate_Number;

   function Parse_Change
     (Text : String)
      return Change_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Since_At : constant Natural := Find_Substring (Low, " since ");
      Core : constant String :=
        (if Since_At = 0 then Item else Trim (Item (Item'First .. Since_At - 1)));
      Since_Text : constant String :=
        (if Since_At = 0 then ""
         else Trim (Item (Since_At + 7 .. Item'Last)));
      Value : Long_Float := 0.0;
      Tail  : Unbounded_String;
      Unit_Text : String (1 .. 32);
      Unit_Length : Natural := 0;
      Since_Buffer : String (1 .. 64);
      Since_Length : Natural := 0;
      Percent : Boolean := False;
      Points  : Boolean := False;
      Sign    : Long_Float := 1.0;

      procedure Classify_Tail (Raw : String) is
         T : Unbounded_String := To_Unbounded_String (Trim (Raw));
      begin
         if To_String (T) = "%" then
            Percent := True;
            T := Null_Unbounded_String;
         elsif To_String (T) = "point" or else To_String (T) = "points" then
            Points := True;
            T := Null_Unbounded_String;
         elsif Ends_With (To_String (T), "%") then
            Percent := True;
            declare
               S : constant String := To_String (T);
            begin
               T := To_Unbounded_String (Trim (S (S'First .. S'Last - 1)));
            end;
         elsif Ends_With (To_String (T), " points") then
            Points := True;
            declare
               S : constant String := To_String (T);
            begin
               T := To_Unbounded_String (Trim (S (S'First .. S'Last - 7)));
            end;
         elsif Ends_With (To_String (T), " point") then
            Points := True;
            declare
               S : constant String := To_String (T);
            begin
               T := To_Unbounded_String (Trim (S (S'First .. S'Last - 6)));
            end;
         end if;
         Store (To_String (T), Unit_Text, Unit_Length);
      end Classify_Tail;
   begin
      if Low = "unchanged" then
         return
           (Status => Humanize.Status.Ok,
            Value => 0.0,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Starts_With (Low, "up ") then
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core (Core'First + 3 .. Core'Last), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Starts_With (Low, "down ") then
         Sign := -1.0;
         if not Parse_Number_And_Tail (Core (Core'First + 5 .. Core'Last), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Core'Length > 0 and then Core (Core'First) = '+' then
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core, Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Core'Length > 0 and then Core (Core'First) = '-' then
         Sign := -1.0;
         if not Parse_Number_And_Tail (Core, Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
         Value := abs Value;
      elsif Ends_With (Low, " more") then
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core (Core'First .. Core'Last - 5), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Find_Substring (Low, " more ") /= 0 then
         declare
            Marker : constant Natural := Find_Substring (Low, " more ");
         begin
            Sign := 1.0;
            if not Parse_Number_And_Tail
              (Core (Core'First .. Marker - 1), Value, Tail)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Tail := To_Unbounded_String
              (Trim (To_String (Tail) & " " & Core (Marker + 6 .. Core'Last)));
         end;
      elsif Ends_With (Low, " fewer") then
         Sign := -1.0;
         if not Parse_Number_And_Tail (Core (Core'First .. Core'Last - 6), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Find_Substring (Low, " fewer ") /= 0 then
         declare
            Marker : constant Natural := Find_Substring (Low, " fewer ");
         begin
            Sign := -1.0;
            if not Parse_Number_And_Tail
              (Core (Core'First .. Marker - 1), Value, Tail)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Tail := To_Unbounded_String
              (Trim (To_String (Tail) & " " & Core (Marker + 7 .. Core'Last)));
         end;
      else
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core, Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      end if;

      Classify_Tail (To_String (Tail));
      Store (Since_Text, Since_Buffer, Since_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Sign * abs Value,
         Unit => Unit_Text,
         Unit_Length => Unit_Length,
         Since => Since_Buffer,
         Since_Length => Since_Length,
         Percent => Percent,
         Points => Points,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Change;

   function Scan_Change
     (Text : String)
      return Change_Parse_Result
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
            Result : constant Change_Parse_Result :=
              Parse_Change (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Change;

   function Parse_Comparison
     (Text        : String;
      Larger_Word : String;
      Smaller_Word : String;
      Percent     : Boolean;
      Byte_Size   : Boolean)
      return Comparison_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Is_At : constant Natural := Find_Substring (Low, " is ");
      Equal_At : constant Natural := Find_Substring (Low, " is equal to ");
      Same_Size_At : constant Natural := Find_Substring (Low, " is the same size as ");
      Same_Date_At : constant Natural := Find_Substring (Low, " is the same date as ");
      Than_Text : constant String := " " & Larger_Word & " than ";
      Than_Text_2 : constant String := " " & Smaller_Word & " than ";
      Larger_At : constant Natural := Find_Substring (Low, Than_Text);
      Smaller_At : constant Natural := Find_Substring (Low, Than_Text_2);
      Current_Buffer : String (1 .. 64);
      Baseline_Buffer : String (1 .. 64);
      Unit_Buffer : String (1 .. 32);
      Current_Length : Natural;
      Baseline_Length : Natural;
      Unit_Length : Natural := 0;
      Difference : Long_Float := 0.0;
      Direction : Comparison_Direction := Comparison_Equal;
      Tail : Unbounded_String;
   begin
      if Equal_At /= 0 then
         Store (Trim (Item (Item'First .. Equal_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Equal_At + 13 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Same_Size_At /= 0 then
         Store (Trim (Item (Item'First .. Same_Size_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Same_Size_At + 21 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Same_Date_At /= 0 then
         Store (Trim (Item (Item'First .. Same_Date_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Same_Date_At + 21 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Is_At /= 0 and then (Larger_At /= 0 or else Smaller_At /= 0) then
         declare
            Dir_At : constant Natural :=
              (if Larger_At /= 0 then Larger_At else Smaller_At);
            Mid : constant String := Trim (Item (Is_At + 4 .. Dir_At - 1));
            Parsed_Bytes : Byte_Parse_Result;
         begin
            Store (Trim (Item (Item'First .. Is_At - 1)),
                   Current_Buffer, Current_Length);
            Store
              (Trim
                 (Item
                    (Dir_At
                     + (if Larger_At /= 0 then Than_Text'Length
                        else Than_Text_2'Length) .. Item'Last)),
               Baseline_Buffer, Baseline_Length);

            if Larger_At /= 0 then
               if Larger_Word = "higher" then
                  Direction := Comparison_Higher;
               elsif Larger_Word = "larger" then
                  Direction := Comparison_Larger;
               else
                  Direction := Comparison_After;
               end if;
            else
               if Smaller_Word = "lower" then
                  Direction := Comparison_Lower;
               elsif Smaller_Word = "smaller" then
                  Direction := Comparison_Smaller;
               else
                  Direction := Comparison_Before;
               end if;
            end if;

            if Byte_Size then
               Parsed_Bytes := Parse_Bytes (Mid);
               if Parsed_Bytes.Status /= Humanize.Status.Ok then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Difference := Long_Float (Parsed_Bytes.Value);
            elsif Percent then
               if not Ends_With (Mid, "%")
                 or else not Numeric_Value (Mid (Mid'First .. Mid'Last - 1), Difference)
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
            elsif not Parse_Number_And_Tail (Mid, Difference, Tail) then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            else
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            end if;
         end;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      if Unit_Length = 0 then
         Store ("", Unit_Buffer, Unit_Length);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Difference => Difference,
         Direction => Direction,
         Current_Label => Current_Buffer,
         Current_Label_Length => Current_Length,
         Baseline_Label => Baseline_Buffer,
         Baseline_Label_Length => Baseline_Length,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Percent => Percent,
         Byte_Size => Byte_Size,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Comparison;

   function Parse_Number_Comparison
     (Text : String)
      return Comparison_Parse_Result is
   begin
      return Parse_Comparison (Text, "higher", "lower", False, False);
   end Parse_Number_Comparison;

   function Parse_Percent_Comparison
     (Text : String)
      return Comparison_Parse_Result is
   begin
      return Parse_Comparison (Text, "higher", "lower", True, False);
   end Parse_Percent_Comparison;

   function Parse_File_Size_Comparison
     (Text : String)
      return Comparison_Parse_Result is
   begin
      return Parse_Comparison (Text, "larger", "smaller", False, True);
   end Parse_File_Size_Comparison;

   function Parse_Date_Difference_Components
     (Text   : String;
      Years  : out Natural;
      Months : out Natural;
      Days   : out Natural)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
      Position : Natural := Item'First;
      Saw_Component : Boolean := False;

      function Parse_Component (Part : String) return Boolean is
         Amount : Long_Float;
         Tail : Unbounded_String;
         Unit : String (1 .. 32);
         Unit_Length : Natural;
         Count : Natural;
      begin
         if not Parse_Number_And_Tail (Trim (Part), Amount, Tail)
           or else Amount < 0.0
         then
            return False;
         end if;

         Count := Natural (Long_Float'Rounding (Amount));
         if Long_Float (Count) /= Amount then
            return False;
         end if;

         Store (To_String (Tail), Unit, Unit_Length);
         if Unit_Length = 0 then
            return False;
         end if;

         declare
            Unit_Text : constant String := Unit (1 .. Unit_Length);
         begin
            if Unit_Text = "year" or else Unit_Text = "years" then
               Years := Count;
            elsif Unit_Text = "month" or else Unit_Text = "months" then
               Months := Count;
            elsif Unit_Text = "day" or else Unit_Text = "days" then
               Days := Count;
            else
               return False;
            end if;
         end;
         Saw_Component := True;
         return True;
      exception
         when others =>
            return False;
      end Parse_Component;
   begin
      Years := 0;
      Months := 0;
      Days := 0;

      if Item = "same day" then
         Saw_Component := True;
         return True;
      end if;

      while Position <= Item'Last loop
         declare
            Comma : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), ", ");
            And_Marker : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), " and ");
            Stop : Natural := Item'Last;
            Advance : Natural := Item'Last + 1;
         begin
            if Comma /= 0
              and then (And_Marker = 0 or else Comma < And_Marker)
            then
               Stop := Comma - 1;
               Advance := Comma + 2;
            elsif And_Marker /= 0 then
               Stop := And_Marker - 1;
               Advance := And_Marker + 5;
            end if;

            if Stop < Position
              or else not Parse_Component (Item (Position .. Stop))
            then
               return False;
            end if;
            Position := Advance;
         end;
      end loop;

      return Saw_Component;
   end Parse_Date_Difference_Components;

   function Parse_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Same_At : constant Natural :=
        Find_Substring (Low, " is the same date as ");
      Is_At : constant Natural := Find_Substring (Low, " is ");
      Before_Mark : constant String := " before ";
      After_Mark : constant String := " after ";
      Before_At : constant Natural := Find_Substring (Low, Before_Mark);
      After_At : constant Natural := Find_Substring (Low, After_Mark);
      Current_Buffer : String (1 .. 64);
      Baseline_Buffer : String (1 .. 64);
      Current_Length : Natural;
      Baseline_Length : Natural;
      Years : Natural := 0;
      Months : Natural := 0;
      Days : Natural := 0;
      Direction : Comparison_Direction := Comparison_Equal;
   begin
      if Same_At /= 0 then
         Store (Trim (Item (Item'First .. Same_At - 1)),
                Current_Buffer, Current_Length);
         Store (Trim (Item (Same_At + 21 .. Item'Last)),
                Baseline_Buffer, Baseline_Length);
      elsif Is_At /= 0 and then (Before_At /= 0 or else After_At /= 0) then
         declare
            Direction_At : constant Natural :=
              (if Before_At /= 0 then Before_At else After_At);
            Mark_Length : constant Natural :=
              (if Before_At /= 0 then Before_Mark'Length else After_Mark'Length);
            Diff_Text : constant String :=
              Trim (Item (Is_At + 4 .. Direction_At - 1));
         begin
            Store (Trim (Item (Item'First .. Is_At - 1)),
                   Current_Buffer, Current_Length);
            Store (Trim (Item (Direction_At + Mark_Length .. Item'Last)),
                   Baseline_Buffer, Baseline_Length);
            if not Parse_Date_Difference_Components
              (Diff_Text, Years, Months, Days)
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Direction :=
              (if Before_At /= 0 then Comparison_Before
               else Comparison_After);
         end;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Years => Years,
         Months => Months,
         Days => Days,
         Direction => Direction,
         Current_Label => Current_Buffer,
         Current_Label_Length => Current_Length,
         Baseline_Label => Baseline_Buffer,
         Baseline_Label_Length => Baseline_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Date_Comparison;

   function Scan_Date_Comparison
     (Text : String)
      return Date_Comparison_Parse_Result
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
            Result : constant Date_Comparison_Parse_Result :=
              Parse_Date_Comparison (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Date_Comparison;

   function Parse_Natural_Field
     (Text  : String;
      Value : out Natural)
      return Boolean
   is
      Amount : Long_Float;
   begin
      if not Numeric_Value (Trim (Text), Amount) or else Amount < 0.0 then
         return False;
      end if;
      Value := Natural (Long_Float'Rounding (Amount));
      return Long_Float (Value) = Amount;
   exception
      when others =>
         return False;
   end Parse_Natural_Field;

   function Parse_Palette_Contrast_Matrix
     (Text : String)
      return Palette_Contrast_Matrix_Parse_Result
   is
      Item : constant String := Trim (Text);
      Enhanced_Mark : constant String := " enhanced, ";
      Normal_Mark : constant String := " normal, ";
      Large_Mark : constant String := " large-only, ";
      Fail_Mark : constant String := " fail out of ";
      Pairs_Mark : constant String := " pairs";
      A : constant Natural := Find_Substring (Item, Enhanced_Mark);
      B : constant Natural := Find_Substring (Item, Normal_Mark);
      C : constant Natural := Find_Substring (Item, Large_Mark);
      D : constant Natural := Find_Substring (Item, Fail_Mark);
      E : constant Natural := Find_Substring (Item, Pairs_Mark);
      Enhanced : Natural;
      Normal : Natural;
      Large : Natural;
      Fail : Natural;
      Total : Natural;
   begin
      if A = 0 or else B = 0 or else C = 0 or else D = 0 or else E = 0
        or else not Parse_Natural_Field (Item (Item'First .. A - 1), Enhanced)
        or else not Parse_Natural_Field
          (Item (A + Enhanced_Mark'Length .. B - 1), Normal)
        or else not Parse_Natural_Field
          (Item (B + Normal_Mark'Length .. C - 1), Large)
        or else not Parse_Natural_Field
          (Item (C + Large_Mark'Length .. D - 1), Fail)
        or else not Parse_Natural_Field
          (Item (D + Fail_Mark'Length .. E - 1), Total)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      if Enhanced + Normal + Large + Fail /= Total then
         return (Status => Humanize.Status.Invalid_Value,
                 Error => Out_Of_Range,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Enhanced => Enhanced,
         Normal => Normal,
         Large_Only => Large,
         Fail => Fail,
         Total => Total,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Palette_Contrast_Matrix;

   function Parse_APCA_Contrast_Label
     (Text : String)
      return APCA_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Rest : constant String :=
        (if First_Comma = 0 then "" else Item (First_Comma + 2 .. Item'Last));
      Second_Comma : constant Natural := Find_Substring (Rest, ", ");
      Score : Long_Float;
      Strength_Text : String (1 .. 32);
      Strength_Length : Natural;
      Polarity_Text : String (1 .. 48);
      Polarity_Length : Natural;
   begin
      if not Starts_With (Item, "Lc ")
        or else First_Comma = 0
        or else Second_Comma = 0
        or else not Numeric_Value
          (Item (Item'First + 3 .. First_Comma - 1), Score)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Store (Rest (Rest'First .. Second_Comma - 1),
             Strength_Text, Strength_Length);
      Store (Rest (Second_Comma + 2 .. Rest'Last),
             Polarity_Text, Polarity_Length);
      return
        (Status => Humanize.Status.Ok,
         Score => Score,
         Strength => Strength_Text,
         Strength_Length => Strength_Length,
         Polarity => Polarity_Text,
         Polarity_Length => Polarity_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_APCA_Contrast_Label;

   function Deficiency_From_Text
     (Text       : String;
      Deficiency : out Humanize.Colors.Color_Vision_Deficiency)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "protanopia" then
         Deficiency := Humanize.Colors.Protanopia;
      elsif Item = "deuteranopia" then
         Deficiency := Humanize.Colors.Deuteranopia;
      elsif Item = "tritanopia" then
         Deficiency := Humanize.Colors.Tritanopia;
      elsif Item = "achromatopsia" then
         Deficiency := Humanize.Colors.Achromatopsia;
      else
         return False;
      end if;
      return True;
   end Deficiency_From_Text;

   function Parse_Color_Vision_Deficiency_Label
     (Text : String)
      return Color_Vision_Deficiency_Parse_Result
   is
      Item : constant String := Trim (Text);
      Space : constant Natural := Find_Substring (Item, " ");
      Delta_Mark : constant String := ", delta ";
      Delta_At : constant Natural := Find_Substring (Item, Delta_Mark);
      Deficiency : Humanize.Colors.Color_Vision_Deficiency;
      Risk_Buffer : String (1 .. 32);
      Risk_Length : Natural;
      Difference : Long_Float := 0.0;
      Has_Delta : Boolean := False;
   begin
      if Space = 0
        or else not Deficiency_From_Text
          (Item (Item'First .. Space - 1), Deficiency)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      end if;

      if Delta_At = 0 then
         Store (Trim (Item (Space + 1 .. Item'Last)), Risk_Buffer, Risk_Length);
      else
         Store (Trim (Item (Space + 1 .. Delta_At - 1)),
                Risk_Buffer, Risk_Length);
         if not Numeric_Value
           (Item (Delta_At + Delta_Mark'Length .. Item'Last), Difference)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Has_Delta := True;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Deficiency => Deficiency,
         Risk => Risk_Buffer,
         Risk_Length => Risk_Length,
         Difference => Difference,
         Has_Delta => Has_Delta,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Color_Vision_Deficiency_Label;

   function Parse_Contrast_Label
     (Text : String;
      Ratio : out Long_Float;
      Level : out String;
      Level_Length : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Ratio_Mark : constant Natural := Find_Substring (Item, ":1 ");
      Contrast_Mark : constant String := " contrast";
      End_Mark : constant Natural := Find_Substring (Item, Contrast_Mark);
   begin
      if Ratio_Mark = 0 or else End_Mark = 0
        or else not Numeric_Value (Item (Item'First .. Ratio_Mark - 1), Ratio)
      then
         return False;
      end if;

      Store (Item (Ratio_Mark + 3 .. End_Mark - 1), Level, Level_Length);
      return True;
   end Parse_Contrast_Label;

   function Parse_Color_Accessibility_Summary
     (Text : String)
      return Color_Accessibility_Parse_Result
   is
      Item : constant String := Trim (Text);
      First_Sep : constant Natural := Find_Substring (Item, "; ");
      Rest : constant String :=
        (if First_Sep = 0 then "" else Item (First_Sep + 2 .. Item'Last));
      Second_Sep : constant Natural := Find_Substring (Rest, "; ");
      Ratio : Long_Float;
      Level_Buffer : String (1 .. 32);
      Level_Length : Natural;
      APCA : APCA_Label_Parse_Result;
      CVD : Color_Vision_Deficiency_Parse_Result;
   begin
      if First_Sep = 0 or else Second_Sep = 0
        or else not Parse_Contrast_Label
          (Item (Item'First .. First_Sep - 1),
           Ratio, Level_Buffer, Level_Length)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      APCA := Parse_APCA_Contrast_Label (Rest (Rest'First .. Second_Sep - 1));
      CVD := Parse_Color_Vision_Deficiency_Label
        (Rest (Second_Sep + 2 .. Rest'Last));
      if APCA.Status /= Humanize.Status.Ok then
         return (Status => APCA.Status, Error => APCA.Error, others => <>);
      elsif CVD.Status /= Humanize.Status.Ok then
         return (Status => CVD.Status, Error => CVD.Error, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Contrast_Ratio => Ratio,
         Contrast_Level => Level_Buffer,
         Contrast_Level_Length => Level_Length,
         APCA => APCA,
         CVD => CVD,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Color_Accessibility_Summary;

   function Parse_Float_Field
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
   begin
      Value := Long_Float'Value (Trim (Text));
      return True;
   exception
      when others =>
         Value := 0.0;
         return False;
   end Parse_Float_Field;

   function Parse_Percent_Field
     (Text  : String;
      Value : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
   begin
      return Item'Length > 1
        and then Ends_With (Item, "%")
        and then Parse_Float_Field (Item (Item'First .. Item'Last - 1), Value);
   end Parse_Percent_Field;

   function To_Channel (Value : Natural) return Humanize.Colors.Color_Channel is
   begin
      if Value > 255 then
         return 0;
      else
         return Humanize.Colors.Color_Channel (Value);
      end if;
   end To_Channel;

   function Parse_RGB_Components
     (Text        : String;
      Prefix      : String;
      Need_Alpha  : Boolean;
      Color       : out Humanize.Colors.RGB_Color;
      Opacity     : out Long_Float)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Body_First : Natural;
      Body_Last  : Natural;
      C1 : Natural := 0;
      C2 : Natural := 0;
      C3 : Natural := 0;
      A  : Long_Float := 1.0;
      First_Comma : Natural;
      Second_Comma : Natural;
      Third_Comma : Natural := 0;
   begin
      Color := (others => 0);
      Opacity := 1.0;
      if not Starts_With (Item, Prefix & "(") or else not Ends_With (Item, ")") then
         return False;
      end if;

      Body_First := Item'First + Prefix'Length + 1;
      Body_Last := Item'Last - 1;
      First_Comma := Find_Substring (Item (Body_First .. Body_Last), ", ");
      if First_Comma = 0 then
         return False;
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Body_Last), ", ");
      if Second_Comma = 0 then
         return False;
      end if;
      if Need_Alpha then
         Third_Comma := Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ");
         if Third_Comma = 0 then
            return False;
         end if;
      end if;

      if not Parse_Natural_Field (Item (Body_First .. First_Comma - 1), C1)
        or else not Parse_Natural_Field (Item (First_Comma + 2 .. Second_Comma - 1), C2)
      then
         return False;
      end if;

      if Need_Alpha then
         if not Parse_Natural_Field (Item (Second_Comma + 2 .. Third_Comma - 1), C3)
           or else not Parse_Float_Field (Item (Third_Comma + 2 .. Body_Last), A)
         then
            return False;
         end if;
      else
         if Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ") /= 0
           or else not Parse_Natural_Field
             (Item (Second_Comma + 2 .. Body_Last), C3)
         then
            return False;
         end if;
      end if;

      if C1 > 255 or else C2 > 255 or else C3 > 255 or else A < 0.0 or else A > 1.0 then
         return False;
      end if;

      Color := (Red => To_Channel (C1), Green => To_Channel (C2),
                Blue => To_Channel (C3));
      Opacity := A;
      return True;
   exception
      when others =>
         return False;
   end Parse_RGB_Components;

   function Color_Label_Result
     (Item        : String;
      Color       : Humanize.Colors.RGB_Color;
      Opacity     : Long_Float := 1.0;
      Has_Opacity : Boolean := False;
      Is_Current  : Boolean := False)
      return Color_Label_Parse_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Color => Color,
         Opacity => Opacity,
         Has_Opacity => Has_Opacity,
         Is_Current => Is_Current,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Color_Label_Result;

   function RGB_Label_Error
     (Text       : String;
      Prefix     : String;
      Need_Alpha : Boolean)
      return Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Body_First : Natural;
      Body_Last  : Natural;
      C1 : Natural := 0;
      C2 : Natural := 0;
      C3 : Natural := 0;
      A  : Long_Float := 1.0;
      First_Comma : Natural := 0;
      Second_Comma : Natural := 0;
      Third_Comma : Natural := 0;

      function Failure
        (Status   : Humanize.Status.Status_Code;
         Error    : Parse_Error_Kind;
         Position : Natural)
         return Color_Label_Parse_Result is
      begin
         return
           (Status => Status,
            Error_Position => Position,
            Error => Error,
            others => <>);
      end Failure;
   begin
      if Item'Length = 0 then
         return Failure
           (Humanize.Status.Invalid_Argument, Empty_Input, Text'First);
      end if;

      if not Starts_With (Item, Prefix & "(") then
         if Starts_With (Item, Prefix) then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Expected_Separator,
               Item'First + Prefix'Length);
         else
            return Failure
              (Humanize.Status.Invalid_Argument,
               Unsupported_Form,
               Item'First);
         end if;
      elsif not Ends_With (Item, ")") then
         return Failure
           (Humanize.Status.Invalid_Argument,
            Expected_Separator,
            Item'Last + 1);
      end if;

      Body_First := Item'First + Prefix'Length + 1;
      Body_Last := Item'Last - 1;
      if Body_First > Body_Last then
         return Failure
           (Humanize.Status.Invalid_Argument, Expected_Number, Body_First);
      end if;

      First_Comma := Find_Substring (Item (Body_First .. Body_Last), ", ");
      if First_Comma = 0 then
         return Failure
           (Humanize.Status.Invalid_Argument,
            Expected_Separator,
            Body_First);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Body_Last), ", ");
      if Second_Comma = 0 then
         return Failure
           (Humanize.Status.Invalid_Argument,
            Expected_Separator,
            First_Comma + 2);
      end if;
      if Need_Alpha then
         Third_Comma :=
           Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ");
         if Third_Comma = 0 then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Expected_Separator,
               Second_Comma + 2);
         end if;
      end if;

      if not Parse_Natural_Field (Item (Body_First .. First_Comma - 1), C1) then
         return Failure
           (Humanize.Status.Invalid_Argument, Expected_Number, Body_First);
      elsif not Parse_Natural_Field
        (Item (First_Comma + 2 .. Second_Comma - 1), C2)
      then
         return Failure
           (Humanize.Status.Invalid_Argument, Expected_Number, First_Comma + 2);
      end if;

      if Need_Alpha then
         if not Parse_Natural_Field
           (Item (Second_Comma + 2 .. Third_Comma - 1), C3)
         then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Expected_Number,
               Second_Comma + 2);
         elsif not Parse_Float_Field (Item (Third_Comma + 2 .. Body_Last), A) then
            return Failure
              (Humanize.Status.Invalid_Argument,
               Expected_Number,
               Third_Comma + 2);
         end if;
      else
         declare
            Extra_Comma : constant Natural :=
              Find_Substring (Item (Second_Comma + 2 .. Body_Last), ", ");
         begin
            if Extra_Comma /= 0 then
               return Failure
                 (Humanize.Status.Invalid_Argument,
                  Unsupported_Form,
                  Extra_Comma);
            elsif not Parse_Natural_Field
              (Item (Second_Comma + 2 .. Body_Last), C3)
            then
               return Failure
                 (Humanize.Status.Invalid_Argument,
                  Expected_Number,
                  Second_Comma + 2);
            end if;
         end;
      end if;

      if C1 > 255 then
         return Failure
           (Humanize.Status.Invalid_Value, Out_Of_Range, Body_First);
      elsif C2 > 255 then
         return Failure
           (Humanize.Status.Invalid_Value, Out_Of_Range, First_Comma + 2);
      elsif C3 > 255 then
         return Failure
           (Humanize.Status.Invalid_Value, Out_Of_Range, Second_Comma + 2);
      elsif A < 0.0 or else A > 1.0 then
         return Failure
           (Humanize.Status.Invalid_Value, Out_Of_Range, Third_Comma + 2);
      end if;

      return Failure
        (Humanize.Status.Invalid_Argument, Expected_Number, Item'First);
   exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Item'Length = 0 then Text'First else Item'First),
            Error => Expected_Number,
            others => <>);
   end RGB_Label_Error;

   function Parse_RGB_Label
     (Text : String)
      return Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Color : Humanize.Colors.RGB_Color;
      Opacity : Long_Float;
   begin
      if Parse_RGB_Components (Item, "rgb", False, Color, Opacity) then
         return Color_Label_Result (Item, Color);
      else
         return RGB_Label_Error (Text, "rgb", False);
      end if;
   end Parse_RGB_Label;

   function Parse_RGBA_Label
     (Text : String)
      return Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Color : Humanize.Colors.RGB_Color;
      Opacity : Long_Float;
   begin
      if Parse_RGB_Components (Item, "rgba", True, Color, Opacity) then
         return Color_Label_Result (Item, Color, Opacity, True);
      else
         return RGB_Label_Error (Text, "rgba", True);
      end if;
   end Parse_RGBA_Label;

   function Hex_Color_Label_Error
     (Item : String;
      Code : Humanize.Status.Status_Code)
      return Color_Label_Parse_Result
   is
      function Is_Hex_Digit (C : Character) return Boolean is
      begin
         return C in '0' .. '9' or else C in 'a' .. 'f' or else C in 'A' .. 'F';
      end Is_Hex_Digit;
   begin
      for Index in Item'First + 1 .. Item'Last loop
         if not Is_Hex_Digit (Item (Index)) then
            return
              (Status => Humanize.Status.Invalid_Argument,
               Error_Position => Index,
               Error => Expected_Number,
               others => <>);
         end if;
      end loop;

      if Item'Length not in 4 | 5 | 7 | 9 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'Last + 1,
            Error => Unsupported_Form,
            others => <>);
      end if;

      return
        (Status => Code,
         Error_Position => Item'First,
         Error => Unsupported_Form,
         others => <>);
   end Hex_Color_Label_Error;

   function Parse_CSS_Color_Label
     (Text : String)
      return Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      CSS  : Humanize.Colors.CSS_Color;
      Code : Humanize.Status.Status_Code;
   begin
      if Item'Length = 0 then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            Error => Empty_Input,
            others => <>);
      end if;

      if Item = "currentColor" then
         return Color_Label_Result (Item, (others => 0), Is_Current => True);
      end if;

      Code := Humanize.Colors.Parse_CSS_Color (Item, CSS);
      if Code /= Humanize.Status.Ok then
         if Starts_With (Item, "#") then
            return Hex_Color_Label_Error (Item, Code);
         elsif Starts_With (Item, "rgba") then
            return RGB_Label_Error (Text, "rgba", True);
         elsif Starts_With (Item, "rgb") then
            return RGB_Label_Error (Text, "rgb", False);
         else
            return
              (Status => Code,
               Error_Position => Item'First,
               Error => Unsupported_Form,
               others => <>);
         end if;
      end if;

      return Color_Label_Result
        (Item, CSS.Color, CSS.Opacity, CSS.Has_Opacity, CSS.Is_Current);
   end Parse_CSS_Color_Label;

   function Parse_Color_Summary
     (Text : String)
      return Color_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Space : constant Natural := Find_Substring (Item, " ");
      RGB_At : constant Natural := Find_Substring (Item, "rgb(");
      Hex_Color : Humanize.Colors.RGB_Color;
      RGB : Color_Label_Parse_Result;
      Code : Humanize.Status.Status_Code;
   begin
      if RGB_At > Item'First and then (Space = 0 or else RGB_At < Space) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => RGB_At,
            Error => Expected_Separator,
            others => <>);
      end if;

      if Space = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => (if Item'Length = 0 then Text'First else Item'First),
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Code := Humanize.Colors.Parse_Hex_Color (Item (Item'First .. Space - 1), Hex_Color);
      RGB := Parse_RGB_Label (Item (Space + 1 .. Item'Last));
      if Code /= Humanize.Status.Ok then
         return
           (Status => Code,
            Error_Position => Item'First,
            Error => Unsupported_Form,
            others => <>);
      elsif RGB.Status /= Humanize.Status.Ok
        or else RGB.Color /= Hex_Color
      then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position =>
              (if RGB.Error_Position /= 0 then Space + RGB.Error_Position
               else Space + 1),
            Error =>
              (if RGB.Error /= No_Parse_Error then RGB.Error
               else Unsupported_Form),
            others => <>);
      end if;

      return Color_Label_Result (Item, Hex_Color);
   end Parse_Color_Summary;

   function Parse_Model_Label
     (Text   : String;
      Prefix : String)
      return Color_Model_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Body_First : Natural;
      Body_Last : Natural;
      First_Comma : Natural;
      Second_Comma : Natural;
      First_Value : Long_Float;
      Second_Value : Long_Float;
      Third_Value : Long_Float;
   begin
      if not Starts_With (Item, Prefix & "(") or else not Ends_With (Item, ")") then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position =>
                   (if Item'Length = 0 then Text'First
                    elsif Starts_With (Item, Prefix) then
                       Item'First + Prefix'Length
                    else Item'First),
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      Body_First := Item'First + Prefix'Length + 1;
      Body_Last := Item'Last - 1;
      First_Comma := Find_Substring (Item (Body_First .. Body_Last), ", ");
      if First_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Body_First,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Body_Last), ", ");
      if Second_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => First_Comma + 2,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      if not Parse_Float_Field (Item (Body_First .. First_Comma - 1), First_Value) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Body_First,
                 Error => Expected_Number,
                 others => <>);
      elsif not Parse_Percent_Field
        (Item (First_Comma + 2 .. Second_Comma - 1), Second_Value)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => First_Comma + 2,
                 Error => Expected_Number,
                 others => <>);
      elsif not Parse_Percent_Field
        (Item (Second_Comma + 2 .. Body_Last), Third_Value)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Second_Comma + 2,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         First => First_Value,
         Second => Second_Value,
         Third => Third_Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Item'Length = 0 then Text'First else Item'First),
            Error => Expected_Number,
            others => <>);
   end Parse_Model_Label;

   function Parse_HSL_Label
     (Text : String)
      return Color_Model_Label_Parse_Result is
   begin
      return Parse_Model_Label (Text, "hsl");
   end Parse_HSL_Label;

   function Parse_HSV_Label
     (Text : String)
      return Color_Model_Label_Parse_Result is
   begin
      return Parse_Model_Label (Text, "hsv");
   end Parse_HSV_Label;

   function Parse_Color_Bucket_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
   begin
      if Item not in "very dark" | "dark" | "medium brightness" | "light"
        | "very light" | "neutral" | "red" | "orange" | "yellow" | "green"
        | "cyan" | "blue" | "purple" | "magenta" | "desaturated" | "muted"
        | "saturated" | "vivid" | "neutral temperature" | "warm" | "cool"
        | "balanced temperature" | "grayish" | "pastel" | "soft"
        | "moderate chroma" | "high chroma" | "black" | "silver" | "gray"
        | "white" | "maroon" | "fuchsia" | "lime" | "olive" | "navy"
        | "teal" | "aqua" | "rebeccapurple" | "neutral palette"
        | "single-accent palette" | "monochrome palette" | "triadic palette"
        | "complementary palette" | "analogous palette" | "varied palette"
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => (if Item'Length = 0 then Text'First else Item'First),
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      Store (Item, Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Color_Bucket_Label;

   function Parse_Color_Description
     (Text : String)
      return Color_Description_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Second_Comma : Natural;
      Third_Comma : Natural;
      Brightness_Buffer : String (1 .. 32);
      Saturation_Buffer : String (1 .. 32);
      Hue_Buffer : String (1 .. 32);
      Temperature_Buffer : String (1 .. 32);
      Chroma_Buffer : String (1 .. 32);
      Brightness_Length : Natural;
      Saturation_Length : Natural;
      Hue_Length : Natural;
      Temperature_Length : Natural;
      Chroma_Length : Natural;
      Space : Natural;
   begin
      if First_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => (if Item'Length = 0 then Text'First else Item'First),
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Item'Last), ", ");
      if Second_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => First_Comma + 2,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Third_Comma := Find_Substring (Item (Second_Comma + 2 .. Item'Last), ", ");
      if Third_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Second_Comma + 2,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      declare
         Sat_Hue : constant String := Item (First_Comma + 2 .. Second_Comma - 1);
      begin
         for Index in reverse Sat_Hue'Range loop
            if Sat_Hue (Index) = ' ' then
               Space := Index;
               exit;
            end if;
         end loop;
         if Space = 0 then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error_Position => Sat_Hue'First,
                    Error => Expected_Separator,
                    others => <>);
         end if;
         Store (Sat_Hue (Sat_Hue'First .. Space - 1),
                Saturation_Buffer, Saturation_Length);
         Store (Sat_Hue (Space + 1 .. Sat_Hue'Last), Hue_Buffer, Hue_Length);
      end;

      Store (Item (Item'First .. First_Comma - 1),
             Brightness_Buffer, Brightness_Length);
      Store (Item (Second_Comma + 2 .. Third_Comma - 1),
             Temperature_Buffer, Temperature_Length);
      Store (Item (Third_Comma + 2 .. Item'Last), Chroma_Buffer, Chroma_Length);
      return
        (Status => Humanize.Status.Ok,
         Brightness => Brightness_Buffer,
         Brightness_Length => Brightness_Length,
         Saturation => Saturation_Buffer,
         Saturation_Length => Saturation_Length,
         Hue => Hue_Buffer,
         Hue_Length => Hue_Length,
         Temperature => Temperature_Buffer,
         Temperature_Length => Temperature_Length,
         Chroma => Chroma_Buffer,
         Chroma_Length => Chroma_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => (if Item'Length = 0 then Text'First else Item'First),
            Error => Expected_Separator,
            others => <>);
   end Parse_Color_Description;

   function Parse_Opacity_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Percent : Long_Float;
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
      Space : constant Natural := Find_Substring (Item, " ");
   begin
      if Space = 0
        or else not Parse_Percent_Field (Item (Item'First .. Space - 1), Percent)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Store (Item (Space + 1 .. Item'Last), Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Percent,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Perceptual => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Opacity_Label;

   function Parse_Palette_Summary
     (Text : String)
      return Palette_Summary_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Colors_Mark : constant String := " colors, mostly ";
      A : constant Natural := Find_Substring (Item, Colors_Mark);
      B : Natural;
      Count : Natural;
      Dominant_Buffer : String (1 .. 32);
      Spread_Buffer : String (1 .. 48);
      Dominant_Length : Natural;
      Spread_Length : Natural;
   begin
      if A = 0
        or else not Parse_Natural_Field (Item (Item'First .. A - 1), Count)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;
      B := Find_Substring (Item (A + Colors_Mark'Length .. Item'Last), ", ");
      if B = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Store (Item (A + Colors_Mark'Length .. B - 1),
             Dominant_Buffer, Dominant_Length);
      Store (Item (B + 2 .. Item'Last), Spread_Buffer, Spread_Length);
      return
        (Status => Humanize.Status.Ok,
         Count => Count,
         Dominant_Color => Dominant_Buffer,
         Dominant_Color_Length => Dominant_Length,
         Spread => Spread_Buffer,
         Spread_Length => Spread_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Palette_Summary;

   function Parse_Palette_Roles
     (Text : String)
      return Palette_Roles_Parse_Result
   is
      Item : constant String := Trim (Text);
      Text_Mark : constant String := ", text ";
      Accent_Mark : constant String := ", accent ";
      Prefix : constant String := "background ";
      A : constant Natural := Find_Substring (Item, Text_Mark);
      B : constant Natural := Find_Substring (Item, Accent_Mark);
      Background : Humanize.Colors.RGB_Color;
      Text_Color : Humanize.Colors.RGB_Color;
      Accent : Humanize.Colors.RGB_Color;
   begin
      if not Starts_With (Item, Prefix) or else A = 0 or else B = 0 or else A > B
        or else Humanize.Colors.Parse_Hex_Color
          (Item (Item'First + Prefix'Length .. A - 1), Background) /= Humanize.Status.Ok
        or else Humanize.Colors.Parse_Hex_Color
          (Item (A + Text_Mark'Length .. B - 1), Text_Color) /= Humanize.Status.Ok
        or else Humanize.Colors.Parse_Hex_Color
          (Item (B + Accent_Mark'Length .. Item'Last), Accent) /= Humanize.Status.Ok
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Background => Background,
         Text_Color => Text_Color,
         Accent => Accent,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Palette_Roles;

   function Parse_Palette_Harmony_Label
     (Text : String)
      return Color_Bucket_Label_Parse_Result is
   begin
      return Parse_Color_Bucket_Label (Text);
   end Parse_Palette_Harmony_Label;

   function Parse_Palette_Contrast_Suggestion
     (Text : String)
      return Palette_Contrast_Suggestion_Parse_Result
   is
      Item : constant String := Trim (Text);
      Prefix : constant String := "best contrast ";
      On_Mark : constant String := " on ";
      At_Mark : constant String := " at ";
      Ratio_Mark : constant String := ":1";
      A : constant Natural := Find_Substring (Item, On_Mark);
      B : constant Natural := Find_Substring (Item, At_Mark);
      Foreground : Humanize.Colors.RGB_Color;
      Background : Humanize.Colors.RGB_Color;
      Ratio : Long_Float;
   begin
      if not Starts_With (Item, Prefix) or else A = 0 or else B = 0 or else A > B
        or else not Ends_With (Item, Ratio_Mark)
        or else Humanize.Colors.Parse_Hex_Color
          (Item (Item'First + Prefix'Length .. A - 1), Foreground) /= Humanize.Status.Ok
        or else Humanize.Colors.Parse_Hex_Color
          (Item (A + On_Mark'Length .. B - 1), Background) /= Humanize.Status.Ok
        or else not Parse_Float_Field
          (Item (B + At_Mark'Length .. Item'Last - Ratio_Mark'Length), Ratio)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;
      return
        (Status => Humanize.Status.Ok,
         Foreground => Foreground,
         Background => Background,
         Ratio => Ratio,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Palette_Contrast_Suggestion;

   function Parse_Palette_Accessibility_Label
     (Text : String)
      return Palette_Accessibility_Label_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Of_Mark : constant String := " of ";
      Normal_Mark : constant String := " pairs pass normal text contrast";
      Large_Mark : constant String := " pairs pass large text only";
      Of_At : constant Natural := Find_Substring (Item, Of_Mark);
      Passing : Natural := 0;
      Total : Natural := 0;
      Normal : Boolean := False;
      Large : Boolean := False;
      End_At : Natural := 0;
   begin
      if Item = "no accessible text pairs" then
         return
           (Status => Humanize.Status.Ok,
            Has_Accessible_Pairs => False,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Ends_With (Item, Normal_Mark) then
         Normal := True;
         End_At := Item'Last - Normal_Mark'Length;
      elsif Ends_With (Item, Large_Mark) then
         Large := True;
         End_At := Item'Last - Large_Mark'Length;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      if Of_At = 0
        or else not Parse_Natural_Field (Item (Item'First .. Of_At - 1), Passing)
        or else not Parse_Natural_Field
          (Item (Of_At + Of_Mark'Length .. End_At), Total)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Passing => Passing,
         Total => Total,
         Normal_Text => Normal,
         Large_Text_Only => Large,
         Has_Accessible_Pairs => Passing > 0,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Palette_Accessibility_Label;

   function Parse_Palette_Mood_Label
     (Text : String)
      return Palette_Mood_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Second_Comma : Natural;
      Mood_Mark : constant String := " mood";
      Tone_Buffer : String (1 .. 32);
      Energy_Buffer : String (1 .. 32);
      Temperature_Buffer : String (1 .. 32);
      Tone_Length : Natural;
      Energy_Length : Natural;
      Temperature_Length : Natural;
   begin
      if First_Comma = 0 or else not Ends_With (Item, Mood_Mark) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Second_Comma := Find_Substring (Item (First_Comma + 2 .. Item'Last), ", ");
      if Second_Comma = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      Store (Item (Item'First .. First_Comma - 1), Tone_Buffer, Tone_Length);
      Store (Item (First_Comma + 2 .. Second_Comma - 1), Energy_Buffer, Energy_Length);
      Store (Item (Second_Comma + 2 .. Item'Last - Mood_Mark'Length),
             Temperature_Buffer, Temperature_Length);
      return
        (Status => Humanize.Status.Ok,
         Tone => Tone_Buffer,
         Tone_Length => Tone_Length,
         Energy => Energy_Buffer,
         Energy_Length => Energy_Length,
         Temperature => Temperature_Buffer,
         Temperature_Length => Temperature_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Palette_Mood_Label;

   function Parse_Advanced_Palette_Summary
     (Text : String)
      return Palette_Mood_Parse_Result
   is
      Item : constant String := Trim (Text);
      First_Comma : constant Natural := Find_Substring (Item, ", ");
      Mood_At : constant Natural := Find_Substring (Item, " mood");
   begin
      if First_Comma = 0 or else Mood_At = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;
      return Parse_Palette_Mood_Label (Item (First_Comma + 2 .. Mood_At + 4));
   end Parse_Advanced_Palette_Summary;

   function Parse_Color_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Percent : Long_Float;
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
      Space : constant Natural := Find_Substring (Item, " ");
   begin
      if Space = 0
        or else not Parse_Percent_Field (Item (Item'First .. Space - 1), Percent)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;
      Store (Item (Space + 1 .. Item'Last), Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Percent,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Perceptual => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Color_Difference_Label;

   function Parse_Perceptual_Difference_Label
     (Text : String)
      return Color_Difference_Label_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Prefix : constant String := "oklab delta ";
      Comma : constant Natural := Find_Substring (Item, ", ");
      Difference : Long_Float;
      Label_Buffer : String (1 .. 48);
      Label_Length : Natural;
   begin
      if not Starts_With (Item, Prefix) or else Comma = 0
        or else not Parse_Float_Field
          (Item (Item'First + Prefix'Length .. Comma - 1), Difference)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;
      Store (Item (Comma + 2 .. Item'Last), Label_Buffer, Label_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Difference,
         Label => Label_Buffer,
         Label_Length => Label_Length,
         Perceptual => True,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Perceptual_Difference_Label;

   function Parse_Failed_Segment
     (Text   : String;
      Failed : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Mark : constant String := " failed";
   begin
      return Ends_With (Item, Mark)
        and then Parse_Natural_Field
          (Item (Item'First .. Item'Last - Mark'Length), Failed);
   end Parse_Failed_Segment;

   function Parse_Domain_Summary
     (Text : String)
      return Domain_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Header_End : constant Natural := Find_Substring (Item, ": ");
      Header_Space : Natural := 0;
      Summary_Body : Unbounded_String;
      Main : Unbounded_String;
      Failed_Text : Unbounded_String;
      Of_Mark : constant String := " of ";
      Complete_Mark : constant String := " complete";
      Of_At : Natural;
      Complete_At : Natural;
      Amount : Long_Float;
      Tail : Unbounded_String;
      Domain_Buffer : String (1 .. 32);
      State_Buffer : String (1 .. 32);
      Unit_Buffer : String (1 .. 32);
      Domain_Length : Natural;
      State_Length : Natural;
      Unit_Length : Natural := 0;
      Completed : Natural := 0;
      Total : Natural := 0;
      Failed : Natural := 0;
   begin
      if Header_End = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      for Index in Item'First .. Header_End - 1 loop
         if Item (Index) = ' ' then
            Header_Space := Index;
            exit;
         end if;
      end loop;
      if Header_Space = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Store (Item (Item'First .. Header_Space - 1),
             Domain_Buffer, Domain_Length);
      Store (Item (Header_Space + 1 .. Header_End - 1),
             State_Buffer, State_Length);
      Summary_Body :=
        To_Unbounded_String (Trim (Item (Header_End + 2 .. Item'Last)));

      declare
         Body_Text : constant String := To_String (Summary_Body);
         Comma : constant Natural := Find_Substring (Body_Text, ", ");
      begin
         if Comma = 0 then
            Main := Summary_Body;
         else
            Main := To_Unbounded_String
              (Trim (Body_Text (Body_Text'First .. Comma - 1)));
            Failed_Text := To_Unbounded_String
              (Trim (Body_Text (Comma + 2 .. Body_Text'Last)));
            if not Parse_Failed_Segment (To_String (Failed_Text), Failed) then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
         end if;
      end;

      declare
         Main_Text : constant String := To_String (Main);
      begin
         if Starts_With (Main_Text, "no ") then
            Store (Trim (Main_Text (Main_Text'First + 3 .. Main_Text'Last)),
                   Unit_Buffer, Unit_Length);
         else
            Of_At := Find_Substring (Main_Text, Of_Mark);
            Complete_At := Find_Substring (Main_Text, Complete_Mark);
            if Complete_At = 0 then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Unit,
                       others => <>);
            elsif Of_At = 0 then
               if not Parse_Number_And_Tail
                 (Main_Text (Main_Text'First .. Complete_At - 1),
                  Amount, Tail)
                 or else Amount < 0.0
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;

               Completed := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Completed) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            elsif not Parse_Natural_Field
              (Main_Text (Main_Text'First .. Of_At - 1), Completed)
              or else not Parse_Number_And_Tail
              (Main_Text
                 (Of_At + Of_Mark'Length .. Complete_At - 1),
               Amount, Tail)
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            else
               Total := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Total) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            end if;
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Domain => Domain_Buffer,
         Domain_Length => Domain_Length,
         State => State_Buffer,
         State_Length => State_Length,
         Completed => Completed,
         Total => Total,
         Failed => Failed,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Domain_Summary;

   function Parse_Phrase_Severity_Label
     (Text : String)
      return Phrase_Severity_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Severity : Humanize.Phrases.Phrase_Severity;
   begin
      if Item = "neutral" then
         Severity := Humanize.Phrases.Neutral_Severity;
      elsif Item = "success" then
         Severity := Humanize.Phrases.Success_Severity;
      elsif Item = "warning" then
         Severity := Humanize.Phrases.Warning_Severity;
      elsif Item = "danger" then
         Severity := Humanize.Phrases.Danger_Severity;
      elsif Item = "info" then
         Severity := Humanize.Phrases.Info_Severity;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Severity => Severity,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Phrase_Severity_Label;

   function Parse_Phrase_Tone_Label
     (Text : String)
      return Phrase_Tone_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Tone : Humanize.Phrases.Phrase_Tone;
   begin
      if Item = "neutral" then
         Tone := Humanize.Phrases.Neutral_Tone;
      elsif Item = "positive" then
         Tone := Humanize.Phrases.Positive_Tone;
      elsif Item = "attention" then
         Tone := Humanize.Phrases.Attention_Tone;
      elsif Item = "critical" then
         Tone := Humanize.Phrases.Critical_Tone;
      elsif Item = "informational" then
         Tone := Humanize.Phrases.Informational_Tone;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Tone => Tone,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Phrase_Tone_Label;

   function Parse_Phrase_Domain_Label
     (Text : String)
      return Phrase_Domain_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Domain : Humanize.Phrases.Summary_Domain;
   begin
      if Item = "queue" then
         Domain := Humanize.Phrases.Queue_Domain;
      elsif Item = "job" then
         Domain := Humanize.Phrases.Job_Domain;
      elsif Item = "run" then
         Domain := Humanize.Phrases.Run_Domain;
      elsif Item = "cache" then
         Domain := Humanize.Phrases.Cache_Domain;
      elsif Item = "sync" then
         Domain := Humanize.Phrases.Sync_Domain;
      elsif Item = "import" then
         Domain := Humanize.Phrases.Import_Domain;
      elsif Item = "export" then
         Domain := Humanize.Phrases.Export_Domain;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Domain => Domain,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Phrase_Domain_Label;

   function Parse_Phrase_State_Label
     (Text : String)
      return Phrase_State_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      State : Humanize.Phrases.Summary_State;
   begin
      if Item = "queued" then
         State := Humanize.Phrases.Summary_Queued;
      elsif Item = "running" then
         State := Humanize.Phrases.Summary_Running;
      elsif Item = "waiting" then
         State := Humanize.Phrases.Summary_Waiting;
      elsif Item = "paused" then
         State := Humanize.Phrases.Summary_Paused;
      elsif Item = "complete" then
         State := Humanize.Phrases.Summary_Complete;
      elsif Item = "failed" then
         State := Humanize.Phrases.Summary_Failed;
      elsif Item = "stale" then
         State := Humanize.Phrases.Summary_Stale;
      elsif Item = "skipped" then
         State := Humanize.Phrases.Summary_Skipped;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         State => State,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Phrase_State_Label;

   function Parse_Phrase_Key
     (Text : String)
      return Phrase_Key_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Dot : constant Natural := Find_Substring (Item, ".");
      Prefix_Buffer : String (1 .. 16);
      Prefix_Length : Natural;
      Name_Buffer : String (1 .. 64);
      Name_Length : Natural;

      function Valid_Key_Part (Part : String) return Boolean is
      begin
         if Part'Length = 0 then
            return False;
         end if;
         for Ch of Part loop
            if not (Ch in 'a' .. 'z' or else Ch in '0' .. '9'
                    or else Ch = '_')
            then
               return False;
            end if;
         end loop;
         return True;
      end Valid_Key_Part;
   begin
      if Dot = 0
        or else not Valid_Key_Part (Item (Item'First .. Dot - 1))
        or else not Valid_Key_Part (Item (Dot + 1 .. Item'Last))
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Store (Item (Item'First .. Dot - 1), Prefix_Buffer, Prefix_Length);
      Store (Item (Dot + 1 .. Item'Last), Name_Buffer, Name_Length);
      return
        (Status => Humanize.Status.Ok,
         Prefix => Prefix_Buffer,
         Prefix_Length => Prefix_Length,
         Name => Name_Buffer,
         Name_Length => Name_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Phrase_Key;

   function Count_Words (Text : String) return Natural is
      Item : constant String := Trim (Text);
      Count : Natural := 0;
      In_Word : Boolean := False;
   begin
      for Ch of Item loop
         if Ch = ' ' then
            In_Word := False;
         elsif not In_Word then
            Count := Count + 1;
            In_Word := True;
         end if;
      end loop;
      return Count;
   end Count_Words;

   function Contains_Word
     (Text : String;
      Word : String)
      return Boolean
   is
      Item : constant String := " " & Lower (Trim (Text)) & " ";
   begin
      return Find_Substring (Item, " " & Word & " ") /= 0;
   end Contains_Word;

   function Parse_Phrase_Pack_Summary
     (Text : String)
      return Phrase_Pack_Summary_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Count : constant Natural := Count_Words (Item);
   begin
      if Count = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Pack_Count => Count,
         Has_Summaries => Contains_Word (Item, "summaries"),
         Has_Comparisons => Contains_Word (Item, "comparisons"),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Phrase_Pack_Summary;

   function Parse_Supported_Phrase_Locales
     (Text : String)
      return Phrase_Locales_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Count : constant Natural := Count_Words (Item);
   begin
      if Count = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Locale_Count => Count,
         Has_Generated_Locales =>
           Contains_Word (Item, "sv") or else Contains_Word (Item, "ja")
           or else Contains_Word (Item, "ar") or else Contains_Word (Item, "hi"),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Supported_Phrase_Locales;

   function Parse_Domain_With_Expected
     (Text     : String;
      Expected : String)
      return Domain_Summary_Parse_Result
   is
      Result : constant Domain_Summary_Parse_Result :=
        Parse_Domain_Summary (Text);
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Result.Domain (1 .. Result.Domain_Length) /= Expected then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      else
         return Result;
      end if;
   end Parse_Domain_With_Expected;

   function Parse_Sync_Summary
     (Text : String)
      return Domain_Summary_Parse_Result is
   begin
      return Parse_Domain_With_Expected (Text, "sync");
   end Parse_Sync_Summary;

   function Parse_Import_Summary
     (Text : String)
      return Domain_Summary_Parse_Result is
   begin
      return Parse_Domain_With_Expected (Text, "import");
   end Parse_Import_Summary;

   function Parse_Export_Summary
     (Text : String)
      return Domain_Summary_Parse_Result is
   begin
      return Parse_Domain_With_Expected (Text, "export");
   end Parse_Export_Summary;

   function Parse_Queue_Summary
     (Text : String)
      return Queue_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Details : constant String :=
        (if Starts_With (Item, "queue: ") then
           Item (Item'First + 7 .. Item'Last)
         else "");
      Position : Natural := Details'First;
      Queued : Natural := 0;
      Running : Natural := 0;
      Failed : Natural := 0;
      Completed : Natural := 0;
      Unit_Buffer : String (1 .. 32) := [others => ' '];
      Unit_Length : Natural := 0;

      function Parse_Part (Part : String) return Boolean is
         Segment : constant String := Trim (Part);
         Amount : Long_Float;
         Tail : Unbounded_String;
         Mark : constant String := " queued";
      begin
         if Ends_With (Segment, Mark) then
            if not Parse_Number_And_Tail
              (Segment (Segment'First .. Segment'Last - Mark'Length),
               Amount, Tail)
            then
               return False;
            end if;
            Queued := Natural (Long_Float'Rounding (Amount));
            Store (To_String (Tail), Unit_Buffer, Unit_Length);
         elsif Ends_With (Segment, " running") then
            if not Parse_Natural_Field
              (Segment (Segment'First .. Segment'Last - 8), Running)
            then
               return False;
            end if;
         elsif Ends_With (Segment, " failed") then
            if not Parse_Natural_Field
              (Segment (Segment'First .. Segment'Last - 7), Failed)
            then
               return False;
            end if;
         elsif Ends_With (Segment, " complete") then
            if not Parse_Natural_Field
              (Segment (Segment'First .. Segment'Last - 9), Completed)
            then
               return False;
            end if;
         else
            return False;
         end if;
         return True;
      end Parse_Part;
   begin
      if Item = "queue empty" then
         return
           (Status => Humanize.Status.Ok,
            Empty => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif not Starts_With (Item, "queue: ") or else Details'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      while Position <= Details'Last loop
         declare
            Next : constant Natural :=
              Find_Substring (Details (Position .. Details'Last), ", ");
            Last : Natural;
         begin
            if Next = 0 then
               Last := Details'Last;
            else
               Last := Next - 1;
            end if;

            if not Parse_Part (Details (Position .. Last)) then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            exit when Last = Details'Last;
            Position := Last + 3;
         end;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Queued => Queued,
         Running => Running,
         Failed => Failed,
         Completed => Completed,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Empty => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Queue_Summary;

   function Parse_Cache_Summary
     (Text : String)
      return Cache_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Hits_Mark : constant String := "cache: ";
      Misses_Mark : constant String := " hits, ";
      Rate_Mark : constant String := " misses, ";
      End_Mark : constant String := "% hit rate";
      A : constant Natural := Find_Substring (Item, Misses_Mark);
      B : constant Natural := Find_Substring (Item, Rate_Mark);
      C : constant Natural := Find_Substring (Item, End_Mark);
      Hits : Natural;
      Misses : Natural;
      Rate : Natural;
   begin
      if Item = "cache: no requests" then
         return
           (Status => Humanize.Status.Ok,
            Empty => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif not Starts_With (Item, Hits_Mark)
        or else A = 0 or else B = 0 or else C = 0
        or else not Parse_Natural_Field
          (Item (Item'First + Hits_Mark'Length .. A - 1), Hits)
        or else not Parse_Natural_Field
          (Item (A + Misses_Mark'Length .. B - 1), Misses)
        or else not Parse_Natural_Field
          (Item (B + Rate_Mark'Length .. C - 1), Rate)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Hits => Hits,
         Misses => Misses,
         Hit_Rate => Rate,
         Empty => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Cache_Summary;

   function Parse_File_Count_Label
     (Text  : String;
      Count : out Natural)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Item = "no files" then
         Count := 0;
         return True;
      elsif Item = "1 file" then
         Count := 1;
         return True;
      elsif Parse_Number_And_Tail (Item, Amount, Tail)
        and then To_String (Tail) = "files"
        and then Amount >= 0.0
      then
         Count := Natural (Long_Float'Rounding (Amount));
         return Long_Float (Count) = Amount;
      else
         return False;
      end if;
   exception
      when others =>
         return False;
   end Parse_File_Count_Label;

   function Parse_File_Size_Summary
     (Text : String)
      return File_Size_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Comma : constant Natural := Find_Substring (Item, ", ");
      Count : Natural;
      Size : Byte_Parse_Result;
   begin
      if Comma = 0
        or else not Parse_File_Count_Label
          (Item (Item'First .. Comma - 1), Count)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Size := Parse_Bytes (Item (Comma + 2 .. Item'Last));
      if Size.Status /= Humanize.Status.Ok then
         return (Status => Size.Status, Error => Size.Error, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         File_Count => Count,
         Total => Size.Value,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_File_Size_Summary;

   function Parse_Transfer_Remaining
     (Text : String)
      return Transfer_Remaining_Parse_Result
   is
      Item : constant String := Trim (Text);
      Remaining_Mark : constant String := " remaining";
      Rate_Mark : constant String := " remaining at ";
      Stalled_Mark : constant String := " remaining, stalled";
      Rate_At : constant Natural := Find_Substring (Item, Rate_Mark);
      Stalled_At : constant Natural := Find_Substring (Item, Stalled_Mark);
      Remaining : Byte_Parse_Result;
      Rate : Byte_Parse_Result;
   begin
      if Item = "transfer complete" then
         return
           (Status => Humanize.Status.Ok,
            Complete => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Rate_At /= 0 then
         Remaining := Parse_Bytes (Item (Item'First .. Rate_At - 1));
         declare
            Rate_Text : constant String :=
              Item (Rate_At + Rate_Mark'Length .. Item'Last);
         begin
            if not Ends_With (Rate_Text, "/s") then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Unit,
                       others => <>);
            end if;
            Rate := Parse_Bytes (Rate_Text (Rate_Text'First .. Rate_Text'Last - 2));
         end;
         if Remaining.Status /= Humanize.Status.Ok then
            return (Status => Remaining.Status, Error => Remaining.Error, others => <>);
         elsif Rate.Status /= Humanize.Status.Ok then
            return (Status => Rate.Status, Error => Rate.Error, others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Remaining => Remaining.Value,
            Bytes_Per_Second => Rate.Value,
            Has_Rate => True,
            Complete => False,
            Stalled => False,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Stalled_At /= 0 then
         Remaining := Parse_Bytes (Item (Item'First .. Stalled_At - 1));
         if Remaining.Status /= Humanize.Status.Ok then
            return (Status => Remaining.Status, Error => Remaining.Error, others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Remaining => Remaining.Value,
            Stalled => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Ends_With (Item, Remaining_Mark) then
         Remaining :=
           Parse_Bytes (Item (Item'First .. Item'Last - Remaining_Mark'Length));
         if Remaining.Status /= Humanize.Status.Ok then
            return (Status => Remaining.Status, Error => Remaining.Error, others => <>);
         end if;
         return
           (Status => Humanize.Status.Ok,
            Remaining => Remaining.Value,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      end if;
   end Parse_Transfer_Remaining;

   function Parse_Disk_Usage
     (Text : String)
      return Disk_Usage_Parse_Result
   is
      Item : constant String := Trim (Text);
      Of_Mark : constant String := " of ";
      Used_Mark : constant String := " used (";
      End_Mark : constant String := "%)";
      Of_At : constant Natural := Find_Substring (Item, Of_Mark);
      Used_At : constant Natural := Find_Substring (Item, Used_Mark);
      End_At : constant Natural := Find_Substring (Item, End_Mark);
      Used : Byte_Parse_Result;
      Total : Byte_Parse_Result;
      Percent : Natural;
   begin
      if Of_At = 0 or else Used_At = 0 or else End_At = 0
        or else Used_At <= Of_At
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Used := Parse_Bytes (Item (Item'First .. Of_At - 1));
      Total := Parse_Bytes (Item (Of_At + Of_Mark'Length .. Used_At - 1));
      if Used.Status /= Humanize.Status.Ok then
         return (Status => Used.Status, Error => Used.Error, others => <>);
      elsif Total.Status /= Humanize.Status.Ok then
         return (Status => Total.Status, Error => Total.Error, others => <>);
      elsif not Parse_Natural_Field
        (Item (Used_At + Used_Mark'Length .. End_At - 1), Percent)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Used => Used.Value,
         Total => Total.Value,
         Percent_Used => Percent,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Disk_Usage;

   function Severity_From_Noun
     (Text     : String;
      Severity : out Validation_Severity_Label)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "error" or else Item = "errors" then
         Severity := Parsed_Validation_Error;
      elsif Item = "warning" or else Item = "warnings" then
         Severity := Parsed_Validation_Warning;
      elsif Item = "notice" or else Item = "notices" then
         Severity := Parsed_Validation_Info;
      else
         return False;
      end if;
      return True;
   end Severity_From_Noun;

   function Parse_Validation_Count_Header
     (Text     : String;
      Count    : out Natural;
      Severity : out Validation_Severity_Label)
      return Boolean
   is
      Item : constant String := Trim (Text);
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Starts_With (Lower (Item), "no ") then
         Count := 0;
         return Severity_From_Noun (Item (Item'First + 3 .. Item'Last),
                                    Severity);
      elsif Parse_Number_And_Tail (Item, Amount, Tail) and then Amount >= 0.0
      then
         Count := Natural (Long_Float'Rounding (Amount));
         return Long_Float (Count) = Amount
           and then Severity_From_Noun (To_String (Tail), Severity);
      else
         return False;
      end if;
   exception
      when others =>
         return False;
   end Parse_Validation_Count_Header;

   function Parse_Other_Count_From_Details (Text : String) return Natural is
      Item : constant String := Lower (Trim (Text));
      Other_Mark : constant String := " other";
      Others_Mark : constant String := " others";
      And_Mark : constant String := " and ";
      And_At : constant Natural := Find_Substring (Item, And_Mark);
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if And_At = 0 then
         return 0;
      end if;

      declare
         Candidate : constant String :=
           Trim (Item (And_At + And_Mark'Length .. Item'Last));
      begin
         if Candidate = "1 other" then
            return 1;
         elsif (Ends_With (Candidate, Other_Mark)
                or else Ends_With (Candidate, Others_Mark))
           and then Parse_Number_And_Tail (Candidate, Amount, Tail)
           and then (To_String (Tail) = "other"
                     or else To_String (Tail) = "others")
           and then Amount >= 0.0
         then
            return Natural (Long_Float'Rounding (Amount));
         else
            return 0;
         end if;
      end;
   exception
      when others =>
         return 0;
   end Parse_Other_Count_From_Details;

   function Parse_Validation_Summary
     (Text : String)
      return Validation_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Colon : constant Natural := Find_Substring (Item, ": ");
      Count : Natural;
      Severity : Validation_Severity_Label;
      Details_Buffer : String (1 .. 160);
      Details_Length : Natural := 0;
      Other_Count : Natural := 0;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      elsif Colon = 0 then
         if not Parse_Validation_Count_Header (Item, Count, Severity) then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
      else
         if not Parse_Validation_Count_Header
           (Item (Item'First .. Colon - 1), Count, Severity)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Store (Trim (Item (Colon + 2 .. Item'Last)),
                Details_Buffer, Details_Length);
         Other_Count :=
           Parse_Other_Count_From_Details
             (Details_Buffer (1 .. Details_Length));
      end if;

      if Details_Length = 0 then
         Store ("", Details_Buffer, Details_Length);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Count => Count,
         Severity => Severity,
         Has_Details => Details_Length > 0,
         Details => Details_Buffer,
         Details_Length => Details_Length,
         Other_Count => Other_Count,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Validation_Summary;

   function Parse_Field_Problem_Summary
     (Text : String)
      return Field_Problem_Parse_Result
   is
      Item : constant String := Trim (Text);
      Colon : constant Natural := Find_Substring (Item, ": ");
      Field_Buffer : String (1 .. 64);
      Field_Length : Natural;
      Summary : Validation_Summary_Parse_Result;
   begin
      if Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Separator,
                 others => <>);
      end if;

      Store (Trim (Item (Item'First .. Colon - 1)), Field_Buffer, Field_Length);
      Summary := Parse_Validation_Summary (Item (Colon + 2 .. Item'Last));
      if Summary.Status /= Humanize.Status.Ok then
         return (Status => Summary.Status, Error => Summary.Error, others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Field => Field_Buffer,
         Field_Length => Field_Length,
         Summary => Summary,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Field_Problem_Summary;

   function Parse_Selection_Summary
     (Text : String)
      return Selection_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low : constant String := Lower (Item);
      Selected_Mark : constant String := " selected";
      Unit_Buffer : String (1 .. 32);
      Unit_Length : Natural;
      Selected : Natural := 0;
      Total : Natural := 0;
   begin
      if not Ends_With (Low, Selected_Mark) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      end if;

      declare
         Core : constant String :=
           Trim (Item (Item'First .. Item'Last - Selected_Mark'Length));
         Core_Low : constant String := Lower (Core);
      begin
         if Starts_With (Core_Low, "no ") then
            Store (Trim (Core (Core'First + 3 .. Core'Last)),
                   Unit_Buffer, Unit_Length);
            return
              (Status => Humanize.Status.Ok,
               Kind => Selection_None,
               Selected => 0,
               Total => 0,
               Unit => Unit_Buffer,
               Unit_Length => Unit_Length,
               Exact => True,
               Consumed => Item'Length,
               Error_Position => 0,
               Error => No_Parse_Error);
         elsif Starts_With (Core_Low, "all ") then
            declare
               Amount : Long_Float;
               Tail : Unbounded_String;
            begin
               if not Parse_Number_And_Tail
                 (Core (Core'First + 4 .. Core'Last), Amount, Tail)
                 or else Amount < 0.0
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Total := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Total) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;
               Store (To_String (Tail), Unit_Buffer, Unit_Length);
               return
                 (Status => Humanize.Status.Ok,
                  Kind => Selection_All,
                  Selected => Total,
                  Total => Total,
                  Unit => Unit_Buffer,
                  Unit_Length => Unit_Length,
                  Exact => True,
                  Consumed => Item'Length,
                  Error_Position => 0,
                  Error => No_Parse_Error);
            end;
         else
            declare
               Of_At : constant Natural := Find_Substring (Core, " of ");
               Amount : Long_Float;
               Tail : Unbounded_String;
            begin
               if Of_At = 0
                 or else not Parse_Natural_Field
                   (Core (Core'First .. Of_At - 1), Selected)
                 or else not Parse_Number_And_Tail
                   (Core (Of_At + 4 .. Core'Last), Amount, Tail)
                 or else Amount < 0.0
               then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;

               Total := Natural (Long_Float'Rounding (Amount));
               if Long_Float (Total) /= Amount then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Expected_Number,
                          others => <>);
               end if;

               Store (To_String (Tail), Unit_Buffer, Unit_Length);
            end;
         end if;
      end;

      return
        (Status => Humanize.Status.Ok,
         Kind => Selection_Partial,
         Selected => Selected,
         Total => Total,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Selection_Summary;

   function Parse_More_Count
     (Text : String)
      return More_Count_Parse_Result
   is
      Item : constant String := Trim (Text);
      Mark : constant String := " shown, +";
      More_Mark : constant String := " more";
      Mark_At : constant Natural := Find_Substring (Item, Mark);
      Visible : Natural;
      Remaining : Natural;
   begin
      if Mark_At = 0 or else not Ends_With (Item, More_Mark)
        or else not Parse_Natural_Field (Item (Item'First .. Mark_At - 1),
                                         Visible)
        or else not Parse_Natural_Field
          (Item (Mark_At + Mark'Length .. Item'Last - More_Mark'Length),
           Remaining)
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Visible => Visible,
         Remaining => Remaining,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_More_Count;

   function Parse_Pagination_Range
     (Text : String)
      return Pagination_Range_Parse_Result
   is
      Item : constant String := Trim (Text);
      Dash : constant Natural := Find_Substring (Item, "-");
      Of_At : constant Natural := Find_Substring (Item, " of ");
      First : Natural;
      Last : Natural;
      Total : Natural;
      Unit_Buffer : String (1 .. 32);
      Unit_Length : Natural;
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Dash = 0 or else Of_At = 0 or else Dash > Of_At
        or else not Parse_Natural_Field (Item (Item'First .. Dash - 1), First)
        or else not Parse_Natural_Field (Item (Dash + 1 .. Of_At - 1), Last)
        or else not Parse_Number_And_Tail
          (Item (Of_At + 4 .. Item'Last), Amount, Tail)
        or else Amount < 0.0
      then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Total := Natural (Long_Float'Rounding (Amount));
      if Long_Float (Total) /= Amount then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Store (To_String (Tail), Unit_Buffer, Unit_Length);
      return
        (Status => Humanize.Status.Ok,
         First => First,
         Last => Last,
         Total => Total,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Pagination_Range;

   function Parse_Collection_Display
     (Text : String)
      return Collection_Display_Parse_Result
   is
      Item : constant String := Trim (Text);
      More : constant More_Count_Parse_Result := Parse_More_Count (Item);
      Visible : Natural := 0;
      Remaining : Natural := 0;
      Visible_Unit : String (1 .. 32);
      Visible_Unit_Length : Natural := 0;
      Remaining_Unit : String (1 .. 32);
      Remaining_Unit_Length : Natural := 0;
   begin
      if More.Status = Humanize.Status.Ok then
         Store ("", Visible_Unit, Visible_Unit_Length);
         Store ("", Remaining_Unit, Remaining_Unit_Length);
         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Summary,
            Visible => More.Visible,
            Remaining => More.Remaining,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Starts_With (Item, "+") then
         if not Parse_Natural_Field (Item (Item'First + 1 .. Item'Last),
                                     Remaining)
         then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Store ("", Visible_Unit, Visible_Unit_Length);
         Store ("", Remaining_Unit, Remaining_Unit_Length);
         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Compact,
            Visible => 0,
            Remaining => Remaining,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      elsif Parse_Natural_Field (Item, Visible) then
         Store ("", Visible_Unit, Visible_Unit_Length);
         Store ("", Remaining_Unit, Remaining_Unit_Length);
         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Compact,
            Visible => Visible,
            Remaining => 0,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      else
         declare
            Shown_Mark : constant String := " shown, ";
            Available_Mark : constant String := " available";
            Shown_At : constant Natural := Find_Substring (Item, Shown_Mark);
            Available_At : constant Natural :=
              Find_Substring (Item, Available_Mark);
            Amount : Long_Float;
            Tail : Unbounded_String;
         begin
            if Shown_At = 0 or else Available_At = 0
              or else not Parse_Number_And_Tail
                (Item (Item'First .. Shown_At - 1), Amount, Tail)
              or else Amount < 0.0
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Visible := Natural (Long_Float'Rounding (Amount));
            if Long_Float (Visible) /= Amount then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Store (To_String (Tail), Visible_Unit, Visible_Unit_Length);
            if not Parse_Number_And_Tail
              (Item (Shown_At + Shown_Mark'Length .. Available_At - 1),
               Amount, Tail)
              or else Amount < 0.0
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Remaining := Natural (Long_Float'Rounding (Amount));
            if Long_Float (Remaining) /= Amount then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Expected_Number,
                       others => <>);
            end if;
            Store (To_String (Tail), Remaining_Unit, Remaining_Unit_Length);
         end;

         return
           (Status => Humanize.Status.Ok,
            Kind => Collection_Screen_Reader,
            Visible => Visible,
            Remaining => Remaining,
            Visible_Unit => Visible_Unit,
            Visible_Unit_Length => Visible_Unit_Length,
            Remaining_Unit => Remaining_Unit,
            Remaining_Unit_Length => Remaining_Unit_Length,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      end if;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Collection_Display;

   function Parse_Text_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Count : Natural := 0;
      Unit_Buffer : String (1 .. 32);
      Unit_Length : Natural;
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      elsif Starts_With (Item, "no ") then
         Store (Item (Item'First + 3 .. Item'Last), Unit_Buffer, Unit_Length);
      elsif Parse_Number_And_Tail (Item, Amount, Tail) and then Amount >= 0.0
      then
         Count := Natural (Long_Float'Rounding (Amount));
         if Long_Float (Count) /= Amount then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Expected_Number,
                    others => <>);
         end if;
         Store (To_String (Tail), Unit_Buffer, Unit_Length);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Count => Count,
         Unit => Unit_Buffer,
         Unit_Length => Unit_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Text_Count_Summary;

   function Parse_Count_With_Expected_Unit
     (Text          : String;
      Singular_Unit : String;
      Plural_Unit   : String)
      return Text_Count_Summary_Parse_Result
   is
      Result : constant Text_Count_Summary_Parse_Result :=
        Parse_Text_Count_Summary (Text);
      Unit : constant String :=
        (if Result.Unit_Length = 0 then ""
         else Result.Unit (1 .. Result.Unit_Length));
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Unit /= Singular_Unit and then Unit /= Plural_Unit then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      else
         return Result;
      end if;
   end Parse_Count_With_Expected_Unit;

   function Parse_Word_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result is
   begin
      return Parse_Count_With_Expected_Unit (Text, "word", "words");
   end Parse_Word_Count_Summary;

   function Parse_Sentence_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result is
   begin
      return Parse_Count_With_Expected_Unit (Text, "sentence", "sentences");
   end Parse_Sentence_Count_Summary;

   function Parse_Paragraph_Count_Summary
     (Text : String)
      return Text_Count_Summary_Parse_Result is
   begin
      return Parse_Count_With_Expected_Unit (Text, "paragraph", "paragraphs");
   end Parse_Paragraph_Count_Summary;

   function Parse_Text_Time_Label
     (Text : String)
      return Text_Time_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Prefix : constant String := "less than 1 minute ";
      Mark : constant String := " minutes ";
      Compact_Mark : constant String := " min ";
      Mark_At : constant Natural := Find_Substring (Item, Mark);
      Compact_At : constant Natural := Find_Substring (Item, Compact_Mark);
      Minutes : Natural := 0;
      Less_Than : Boolean := False;
      Suffix_Buffer : String (1 .. 16);
      Suffix_Length : Natural;
   begin
      if Starts_With (Item, Prefix) then
         Minutes := 1;
         Less_Than := True;
         Store (Item (Item'First + Prefix'Length .. Item'Last),
                Suffix_Buffer, Suffix_Length);
      elsif Mark_At /= 0
        and then Parse_Natural_Field (Item (Item'First .. Mark_At - 1), Minutes)
      then
         Store (Item (Mark_At + Mark'Length .. Item'Last),
                Suffix_Buffer, Suffix_Length);
      elsif Compact_At /= 0
        and then Parse_Natural_Field
          (Item (Item'First .. Compact_At - 1), Minutes)
      then
         Store (Item (Compact_At + Compact_Mark'Length .. Item'Last),
                Suffix_Buffer, Suffix_Length);
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Number,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Minutes => Minutes,
         Less_Than => Less_Than,
         Suffix => Suffix_Buffer,
         Suffix_Length => Suffix_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Text_Time_Label;

   function Parse_Time_With_Suffix
     (Text   : String;
      Suffix : String)
      return Text_Time_Parse_Result
   is
      Result : constant Text_Time_Parse_Result := Parse_Text_Time_Label (Text);
   begin
      if Result.Status /= Humanize.Status.Ok then
         return Result;
      elsif Result.Suffix (1 .. Result.Suffix_Length) /= Suffix then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Expected_Unit,
                 others => <>);
      else
         return Result;
      end if;
   end Parse_Time_With_Suffix;

   function Parse_Reading_Time
     (Text : String)
      return Text_Time_Parse_Result is
   begin
      return Parse_Time_With_Suffix (Text, "read");
   end Parse_Reading_Time;

   function Parse_Speaking_Time
     (Text : String)
      return Text_Time_Parse_Result is
   begin
      return Parse_Time_With_Suffix (Text, "spoken");
   end Parse_Speaking_Time;

   procedure Apply_Text_Summary_Part
     (Part   : String;
      Result : in out Text_Summary_Parse_Result;
      Valid  : in out Boolean)
   is
      Item : constant String := Lower (Trim (Part));
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

   function Parse_Text_Summary
     (Text : String)
      return Text_Summary_Parse_Result
   is
      Item : constant String := Trim (Text);
      Result : Text_Summary_Parse_Result :=
        (Status => Humanize.Status.Ok,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error,
         others => <>);
      Position : Natural := Item'First;
      Valid : Boolean := True;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Empty_Input,
                 others => <>);
      end if;

      while Position <= Item'Last loop
         declare
            Next : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), ", ");
            Last : constant Natural :=
              (if Next = 0 then Item'Last else Next - 1);
         begin
            Apply_Text_Summary_Part (Item (Position .. Last), Result, Valid);
            exit when not Valid or else Last = Item'Last;
            Position := Last + 3;
         end;
      end loop;

      if not Valid then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;
      return Result;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Text_Summary;

   function Parse_Mask
     (Text : String;
      Mask_Char : Character := '*')
      return Mask_Parse_Result
   is
      Item : constant String := Text;
      Hidden : Natural := 0;
      Visible_Buffer : String (1 .. 80);
      Visible_Length : Natural;
   begin
      for Ch of Item loop
         exit when Ch /= Mask_Char;
         Hidden := Hidden + 1;
      end loop;

      if Hidden = 0 then
         Store (Item, Visible_Buffer, Visible_Length);
      elsif Hidden = Item'Length then
         Store ("", Visible_Buffer, Visible_Length);
      else
         Store (Item (Item'First + Hidden .. Item'Last),
                Visible_Buffer, Visible_Length);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Masked_Count => Hidden,
         Visible_Count => Item'Length - Hidden,
         Mask_Char => Mask_Char,
         Visible_Tail => Visible_Buffer,
         Visible_Tail_Length => Visible_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Mask;

   function Parse_Grouped_Token
     (Text : String;
      Separator : Character := '-')
      return Grouped_Token_Parse_Result
   is
      Item : constant String := Trim (Text);
      Groups : Natural := (if Item'Length = 0 then 0 else 1);
      Has_Separator : Boolean := False;
      Normal : String (1 .. 160);
      Normal_Length : Natural := 0;
   begin
      for Ch of Item loop
         if Ch = Separator then
            Groups := Groups + 1;
            Has_Separator := True;
         else
            if Normal_Length < Normal'Length then
               Normal_Length := Normal_Length + 1;
               Normal (Normal_Length) := Ch;
            end if;
         end if;
      end loop;
      if Normal_Length < Normal'Length then
         Normal (Normal_Length + 1 .. Normal'Last) := [others => ' '];
      end if;

      return
        (Status => Humanize.Status.Ok,
         Group_Count => Groups,
         Token_Length => Normal_Length,
         Separator => Separator,
         Has_Separator => Has_Separator,
         Normalized => Normal,
         Normalized_Length => Normal_Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Grouped_Token;

   function Parse_Masked_Token
     (Text : String;
      Separator : Character := '-';
      Mask_Char : Character := '*')
      return Grouped_Token_Parse_Result
   is
      pragma Unreferenced (Mask_Char);
   begin
      return Parse_Grouped_Token (Text, Separator);
   end Parse_Masked_Token;

   function Parse_String_Label
     (Text : String)
      return String_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Has_Path_Separator : Boolean := False;
      Path_Separator : Character := ASCII.NUL;
      Path_Separator_Count : Natural := 0;
      Looks_Handle : Boolean := False;
   begin
      for Ch of Item loop
         if Ch = '/' or else Ch = '\' then
            Has_Path_Separator := True;
            Path_Separator_Count := Path_Separator_Count + 1;
            if Path_Separator = ASCII.NUL then
               Path_Separator := Ch;
            end if;
         end if;
      end loop;
      Looks_Handle :=
        Item'Length > 1
        and then Item (Item'First) = '@'
        and then Find_Substring (Item, " ") = 0;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Word_Count => Word_Count (Item),
         Empty => Item'Length = 0,
         Has_Space => Find_Substring (Item, " ") /= 0,
         Has_Dot => Find_Substring (Item, ".") /= 0,
         Has_Path_Separator => Has_Path_Separator,
         Path_Separator => Path_Separator,
         Path_Separator_Count => Path_Separator_Count,
         Has_At_Prefix => Item'Length > 0 and then Item (Item'First) = '@',
         Looks_Handle => Looks_Handle,
         ASCII_Only => ASCII_Only_Label (Item),
         Lowercase => Lowercase_Label (Item),
         Uppercase => Uppercase_Label (Item),
         Title_Case => Title_Case_Label (Item),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_String_Label;

   function Parse_Path_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Path_Label;

   function Parse_Path_Basename
     (Text : String)
      return Filename_Label_Parse_Result is
   begin
      return Parse_Safe_Filename (Text);
   end Parse_Path_Basename;

   function Parse_Path_Title
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Path_Title;

   function Parse_Extension_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Extension_Label;

   function Parse_Shortened_Path
     (Text : String)
      return Excerpt_Parse_Result is
   begin
      return Parse_Excerpt (Text, "~");
   end Parse_Shortened_Path;

   function Parse_Handle_Label
     (Text : String)
      return String_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
   begin
      if Item'Length > 0 and then Item (Item'First) /= '@' then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;
      return Parse_String_Label (Item);
   end Parse_Handle_Label;

   function Parse_Name_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Name_Label;

   function Parse_Clean_Name
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_Name_Label (Text);
   end Parse_Clean_Name;

   function Parse_Display_Name
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_Name_Label (Text);
   end Parse_Display_Name;

   function Parse_Name_Part
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_Name_Label (Text);
   end Parse_Name_Part;

   function Parse_Initials
     (Text : String)
      return Initials_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 32);
      Length : Natural;
      Uppercase : Boolean := True;
      Has_Digit : Boolean := False;
   begin
      for Ch of Item loop
         if not Is_Alnum (Ch) then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Unsupported_Form,
                    others => <>);
         elsif Ch in 'a' .. 'z' then
            Uppercase := False;
         elsif Is_Digit (Ch) then
            Has_Digit := True;
         end if;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Initial_Count => Item'Length,
         All_Uppercase => Uppercase,
         Has_Digit => Has_Digit,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Initials;

   function Parse_Person_Initials
     (Text : String)
      return Initials_Parse_Result is
   begin
      return Parse_Initials (Text);
   end Parse_Person_Initials;

   function Parse_Possessive_Label
     (Text : String)
      return Possessive_Parse_Result
   is
      Item : constant String := Trim (Text);
      Owner_Last : Natural := 0;
      Apostrophe_Only : Boolean := False;
      Buffer : String (1 .. 160);
      Length : Natural;
      Owner_Text : Unbounded_String;
   begin
      if Ends_With (Item, "'s") then
         Owner_Last := Item'Last - 2;
      elsif Ends_With (Item, "'") then
         Owner_Last := Item'Last - 1;
         Apostrophe_Only := True;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      if Owner_Last < Item'First then
         Store ("", Buffer, Length);
         Owner_Text := To_Unbounded_String ("");
      else
         Store (Item (Item'First .. Owner_Last), Buffer, Length);
         Owner_Text := To_Unbounded_String (Item (Item'First .. Owner_Last));
      end if;

      return
        (Status => Humanize.Status.Ok,
         Owner => Buffer,
         Owner_Length => Length,
         Apostrophe_Only => Apostrophe_Only,
         Owner_Ends_With_S =>
           Length > 0
           and then Lower (To_String (Owner_Text)
             (To_String (Owner_Text)'Last .. To_String (Owner_Text)'Last)) = "s",
         Owner_Word_Count => Word_Count (To_String (Owner_Text)),
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Possessive_Label;

   function Parse_Possessive_Name
     (Text : String)
      return Possessive_Parse_Result is
   begin
      return Parse_Possessive_Label (Text);
   end Parse_Possessive_Name;

   function Parse_Email_Local_Part
     (Text : String)
      return Email_Local_Part_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Segments : Natural := (if Item'Length = 0 then 0 else 1);
      Has_Dot : Boolean := False;
      Looks_Local : Boolean := Item'Length > 0;
   begin
      for Ch of Item loop
         if Ch = '@' then
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Unsupported_Form,
                    others => <>);
         elsif Ch = '.' then
            Has_Dot := True;
            Segments := Segments + 1;
         elsif not (Is_Alnum (Ch)
                    or else Ch = '!'
                    or else Ch = '#'
                    or else Ch = '$'
                    or else Ch = '%'
                    or else Ch = '&'
                    or else Ch = '''
                    or else Ch = '*'
                    or else Ch = '+'
                    or else Ch = '-'
                    or else Ch = '/'
                    or else Ch = '='
                    or else Ch = '?'
                    or else Ch = '^'
                    or else Ch = '_'
                    or else Ch = '`'
                    or else Ch = '{'
                    or else Ch = '|'
                    or else Ch = '}'
                    or else Ch = '~')
         then
            Looks_Local := False;
         end if;
      end loop;

      if Item'Length > 0
        and then (Item (Item'First) = '.'
                  or else Item (Item'Last) = '.'
                  or else Find_Substring (Item, "..") /= 0)
      then
         Looks_Local := False;
      end if;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Empty => Item'Length = 0,
         Segment_Count => Segments,
         Has_Dot => Has_Dot,
         Looks_Local_Part => Looks_Local,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Email_Local_Part;

   function Parse_Safe_Filename
     (Text : String)
      return Filename_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Dot : Natural := 0;
      Safe : Boolean := Item'Length > 0;
      Buffer : String (1 .. 160);
      Buffer_Length : Natural;
      Ext_Buffer : String (1 .. 32);
      Ext_Length : Natural := 0;
      Stem_Length : Natural := 0;
      Ext_Lower : Boolean := False;
      Ext_Upper : Boolean := False;
      Reserved : Boolean := False;
      Sep : Character := ASCII.NUL;
      Sep_Count : Natural := 0;
   begin
      for Index in Item'Range loop
         declare
            Ch : constant Character := Item (Index);
         begin
            if Ch = '/' or else Ch = '\' or else Ch = ASCII.NUL
              or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
              or else Ch = ASCII.CR
            then
               Safe := False;
            elsif not (Is_Alnum (Ch)
                       or else Ch = '.'
                       or else Ch = '-'
                       or else Ch = '_')
            then
               Safe := False;
            end if;

            if Ch = '.' and then Index > Item'First then
               Dot := Index;
            elsif Ch = '-' or else Ch = '_' then
               Sep_Count := Sep_Count + 1;
               if Sep = ASCII.NUL then
                  Sep := Ch;
               end if;
            end if;
         end;
      end loop;

      if Item'Length > 0
        and then (Item (Item'Last) = '.' or else Item (Item'Last) = '-'
                  or else Item (Item'Last) = '_')
      then
         Safe := False;
      end if;

      Store (Item, Buffer, Buffer_Length);
      if Dot /= 0 and then Dot < Item'Last then
         Store (Item (Dot + 1 .. Item'Last), Ext_Buffer, Ext_Length);
         Stem_Length := Dot - Item'First;
         Ext_Lower := Lowercase_Label (Item (Dot + 1 .. Item'Last));
         Ext_Upper := Uppercase_Label (Item (Dot + 1 .. Item'Last));
      else
         Store ("", Ext_Buffer, Ext_Length);
         Stem_Length := Item'Length;
      end if;

      declare
         Stem : constant String :=
           (if Dot /= 0 and then Dot > Item'First
            then Item (Item'First .. Dot - 1)
            else Item);
         Stem_Low : constant String := Lower (Stem);
      begin
         Reserved :=
           Stem_Low = "con" or else Stem_Low = "prn"
           or else Stem_Low = "aux" or else Stem_Low = "nul"
           or else Stem_Low = "com1" or else Stem_Low = "com2"
           or else Stem_Low = "com3" or else Stem_Low = "com4"
           or else Stem_Low = "com5" or else Stem_Low = "com6"
           or else Stem_Low = "com7" or else Stem_Low = "com8"
           or else Stem_Low = "com9" or else Stem_Low = "lpt1"
           or else Stem_Low = "lpt2" or else Stem_Low = "lpt3"
           or else Stem_Low = "lpt4" or else Stem_Low = "lpt5"
           or else Stem_Low = "lpt6" or else Stem_Low = "lpt7"
           or else Stem_Low = "lpt8" or else Stem_Low = "lpt9";
      end;

      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Buffer_Length,
         Stem_Length => Stem_Length,
         Has_Extension => Ext_Length > 0,
         Extension => Ext_Buffer,
         Extension_Length => Ext_Length,
         Hidden => Item'Length > 1 and then Item (Item'First) = '.',
         Looks_Safe => Safe,
         Extension_Lowercase => Ext_Lower,
         Extension_Uppercase => Ext_Upper,
         Reserved_Name => Reserved,
         Separator => Sep,
         Separator_Count => Sep_Count,
         Extension_Preserved => Ext_Length > 0,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Safe_Filename;

   function Parse_Identifier_Label
     (Text : String;
      Separator : Character := '_')
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Tokens : Natural := (if Item'Length = 0 then 0 else 1);
      Has_Separator : Boolean := False;
      Lowercase : Boolean := True;
      Leading : constant Boolean :=
        Item'Length > 0 and then Item (Item'First) = Separator;
      Trailing : constant Boolean :=
        Item'Length > 0 and then Item (Item'Last) = Separator;
      Repeated : Boolean := False;
      Previous_Was_Separator : Boolean := False;
   begin
      for Ch of Item loop
         if Ch = Separator then
            Has_Separator := True;
            Tokens := Tokens + 1;
            if Previous_Was_Separator then
               Repeated := True;
            end if;
            Previous_Was_Separator := True;
         elsif not Is_Lower_Alnum_Or (Ch, Separator) then
            Lowercase := False;
            Previous_Was_Separator := False;
         else
            Previous_Was_Separator := False;
         end if;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Token_Count => Tokens,
         Separator => Separator,
         Has_Separator => Has_Separator,
         Lowercase => Lowercase,
         Camel_Case => False,
         Natural_Sort_Key => False,
         Numeric_Run_Count => 0,
         Leading_Separator => Leading,
         Trailing_Separator => Trailing,
         Repeated_Separator => Repeated,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Identifier_Label;

   function Parse_Parameterize_Label
     (Text : String;
      Separator : Character := '-')
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Identifier_Label (Text, Separator);
   end Parse_Parameterize_Label;

   function Parse_Dasherize_Label
     (Text : String)
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Identifier_Label (Text, '-');
   end Parse_Dasherize_Label;

   function Parse_Underscore_Label
     (Text : String)
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Identifier_Label (Text, '_');
   end Parse_Underscore_Label;

   function Parse_Camelize_Label
     (Text : String)
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Tokens : Natural := 0;
      Previous_Lower_Or_Digit : Boolean := False;
   begin
      for Index in Item'Range loop
         declare
            Ch : constant Character := Item (Index);
         begin
            if Index = Item'First then
               Tokens := (if Item'Length = 0 then 0 else 1);
            elsif Ch in 'A' .. 'Z' and then Previous_Lower_Or_Digit then
               Tokens := Tokens + 1;
            end if;
            Previous_Lower_Or_Digit := Ch in 'a' .. 'z' or else Is_Digit (Ch);
         end;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Token_Count => Tokens,
         Separator => ASCII.NUL,
         Has_Separator => False,
         Lowercase => False,
         Camel_Case => Item'Length > 0,
         Natural_Sort_Key => False,
         Numeric_Run_Count => 0,
         Leading_Separator => False,
         Trailing_Separator => False,
         Repeated_Separator => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Camelize_Label;

   function Parse_Transliteration_Label
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Transliteration_Label;

   function Parse_Casefold_Label
     (Text : String)
      return Identifier_Label_Parse_Result is
   begin
      return Parse_Search_Key (Text);
   end Parse_Casefold_Label;

   function Parse_Cleanup_Label
     (Text      : String;
      Separator : Character := ASCII.NUL)
      return Cleanup_Label_Parse_Result
   is
      Item : constant String := Text;
      Buffer : String (1 .. 160);
      Length : Natural;
      Entity_Count : Natural := 0;
      Break_Count : Natural := 0;
      Line_Feed_Count : Natural := 0;
      Whitespace_Run_Count : Natural := 0;
      Tag_Like_Count : Natural := 0;
      Separator_Count : Natural := 0;
      Repeated_Separator : Boolean := False;
      Previous_Separator : Boolean := False;
      In_Whitespace_Run : Boolean := False;
      Index : Natural := Item'First;
   begin
      Store (Item, Buffer, Length);

      while Index <= Item'Last loop
         if Starts_At (Item, Index, "&amp;")
           or else Starts_At (Item, Index, "&lt;")
           or else Starts_At (Item, Index, "&gt;")
           or else Starts_At (Item, Index, "&quot;")
           or else Starts_At (Item, Index, "&#39;")
         then
            Entity_Count := Entity_Count + 1;
         end if;

         if Starts_At (Item, Index, "<br>")
           or else Starts_At (Item, Index, "<br/>")
           or else Starts_At (Item, Index, "<br />")
         then
            Break_Count := Break_Count + 1;
         end if;

         if Item (Index) = '<' then
            Tag_Like_Count := Tag_Like_Count + 1;
         end if;

         if Item (Index) = ASCII.LF then
            Line_Feed_Count := Line_Feed_Count + 1;
         end if;

         if Is_Space (Item (Index)) then
            if not In_Whitespace_Run then
               Whitespace_Run_Count := Whitespace_Run_Count + 1;
            end if;
            In_Whitespace_Run := True;
         else
            In_Whitespace_Run := False;
         end if;

         if Separator /= ASCII.NUL and then Item (Index) = Separator then
            Separator_Count := Separator_Count + 1;
            if Previous_Separator then
               Repeated_Separator := True;
            end if;
            Previous_Separator := True;
         elsif Separator /= ASCII.NUL then
            Previous_Separator := False;
         end if;

         Index := Index + 1;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Empty => Item'Length = 0,
         Entity_Count => Entity_Count,
         Break_Count => Break_Count,
         Line_Feed_Count => Line_Feed_Count,
         Whitespace_Run_Count => Whitespace_Run_Count,
         Tag_Like_Count => Tag_Like_Count,
         Separator => Separator,
         Separator_Count => Separator_Count,
         Repeated_Separator => Repeated_Separator,
         Leading_Separator =>
           Separator /= ASCII.NUL
           and then Item'Length > 0
           and then Item (Item'First) = Separator,
         Trailing_Separator =>
           Separator /= ASCII.NUL
           and then Item'Length > 0
           and then Item (Item'Last) = Separator,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Cleanup_Label;

   function Parse_Escaped_HTML
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Escaped_HTML;

   function Parse_NL_To_BR
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_NL_To_BR;

   function Parse_BR_To_NL
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_BR_To_NL;

   function Parse_Normalized_Whitespace
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Normalized_Whitespace;

   function Parse_Squished
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Squished;

   function Parse_Stripped_Tags
     (Text : String)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text);
   end Parse_Stripped_Tags;

   function Parse_Preserved_Separator
     (Text      : String;
      Separator : Character)
      return Cleanup_Label_Parse_Result is
   begin
      return Parse_Cleanup_Label (Text, Separator);
   end Parse_Preserved_Separator;

   function Parse_Pluralized_Word
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Pluralized_Word;

   function Parse_Singularized_Word
     (Text : String)
      return String_Label_Parse_Result is
   begin
      return Parse_String_Label (Text);
   end Parse_Singularized_Word;

   function Parse_Search_Key
     (Text : String)
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Result : Identifier_Label_Parse_Result := Parse_Identifier_Label (Item, ' ');
   begin
      for Index in Item'Range loop
         declare
            Ch : constant Character := Item (Index);
         begin
            if not ((Ch in 'a' .. 'z') or else Is_Digit (Ch) or else Ch = ' ')
              or else (Ch = ' ' and then
                       (Index = Item'First
                        or else Index = Item'Last
                        or else Item (Index - 1) = ' '))
            then
               return (Status => Humanize.Status.Invalid_Argument,
                       Error => Unsupported_Form,
                       others => <>);
            end if;
         end;
      end loop;
      Result.Separator := ' ';
      return Result;
   end Parse_Search_Key;

   function Parse_Natural_Sort_Key
     (Text : String)
      return Identifier_Label_Parse_Result
   is
      Item : constant String := Trim (Text);
      Buffer : String (1 .. 160);
      Length : Natural;
      Tokens : Natural := (if Item'Length = 0 then 0 else 1);
      Numeric_Runs : Natural := 0;
      Index : Natural := Item'First;
   begin
      while Index <= Item'Last loop
         if Item (Index) = ' ' then
            Tokens := Tokens + 1;
            Index := Index + 1;
         elsif Item (Index) = '{' then
            declare
               Close : constant Natural :=
                 Find_Substring (Item (Index .. Item'Last), "}");
               Colon : constant Natural :=
                 Find_Substring (Item (Index .. Item'Last), ":");
            begin
               if Close = 0 or else Colon = 0 or else Colon > Close then
                  return (Status => Humanize.Status.Invalid_Argument,
                          Error => Unsupported_Form,
                          others => <>);
               end if;
               Numeric_Runs := Numeric_Runs + 1;
               Index := Close + 1;
            end;
         elsif (Item (Index) in 'a' .. 'z') or else Is_Digit (Item (Index)) then
            Index := Index + 1;
         else
            return (Status => Humanize.Status.Invalid_Argument,
                    Error => Unsupported_Form,
                    others => <>);
         end if;
      end loop;

      Store (Item, Buffer, Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Buffer,
         Value_Length => Length,
         Token_Count => Tokens,
         Separator => ' ',
         Has_Separator => Find_Substring (Item, " ") /= 0,
         Lowercase => True,
         Camel_Case => False,
         Natural_Sort_Key => True,
         Numeric_Run_Count => Numeric_Runs,
         Leading_Separator => Item'Length > 0 and then Item (Item'First) = ' ',
         Trailing_Separator => Item'Length > 0 and then Item (Item'Last) = ' ',
         Repeated_Separator => Find_Substring (Item, "  ") /= 0,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Natural_Sort_Key;

   function Parse_Person_List
     (Text : String)
      return Person_List_Parse_Result
   is
      Item : constant String := Trim (Text);
      And_At : constant Natural := Find_Substring (Item, " and ");
      Other_Count : Natural := 0;
      Visible : Natural := 0;
      Amount : Long_Float;
      Tail : Unbounded_String;
   begin
      if Item'Length = 0 or else Item = "no one" then
         return
           (Status => Humanize.Status.Ok,
            Empty => True,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      end if;

      if And_At /= 0
        and then Parse_Number_And_Tail
          (Item (And_At + 5 .. Item'Last), Amount, Tail)
        and then (To_String (Tail) = "other"
                  or else To_String (Tail) = "others")
      then
         Other_Count := Natural (Long_Float'Rounding (Amount));
         declare
            Prefix : constant String := Item (Item'First .. And_At - 1);
         begin
            Visible := 1;
            for Ch of Prefix loop
               if Ch = ',' then
                  Visible := Visible + 1;
               end if;
            end loop;
         end;
      else
         Visible := 1;
         for Ch of Item loop
            if Ch = ',' then
               Visible := Visible + 1;
            end if;
         end loop;
         if And_At /= 0 then
            Visible := Visible + 1;
         end if;
      end if;

      return
        (Status => Humanize.Status.Ok,
         Visible_Count => Visible,
         Other_Count => Other_Count,
         Empty => False,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Person_List;

   function Parse_Excerpt
     (Text : String;
      Ellipsis : String := "...")
      return Excerpt_Parse_Result
   is
      Item : constant String := Text;
      Starts : constant Boolean := Starts_With (Item, Ellipsis);
      Ends   : constant Boolean := Ends_With (Item, Ellipsis);
      First  : Natural := Item'First;
      Last   : Natural := Item'Last;
      Buffer : String (1 .. 160);
      Length : Natural;
      Ellipsis_Count : Natural := 0;
      Position : Natural := Item'First;
      Inner : Boolean := False;
   begin
      while Position <= Item'Last loop
         declare
            Found : constant Natural :=
              Find_Substring (Item (Position .. Item'Last), Ellipsis);
         begin
            exit when Found = 0;
            Ellipsis_Count := Ellipsis_Count + 1;
            if not (Found = Item'First
                    or else Found + Ellipsis'Length - 1 = Item'Last)
            then
               Inner := True;
            end if;
            Position := Found + Natural'Max (Ellipsis'Length, 1);
         end;
      end loop;

      if Starts then
         First := First + Ellipsis'Length;
      end if;
      if Ends and then Last >= First + Ellipsis'Length - 1 then
         Last := Last - Ellipsis'Length;
      end if;
      if Item'Length = 0 or else First > Last then
         Store ("", Buffer, Length);
      else
         Store (Item (First .. Last), Buffer, Length);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Starts_With_Ellipsis => Starts,
         Ends_With_Ellipsis => Ends,
         Ellipsis_Length => Ellipsis'Length,
         Ellipsis_Count => Ellipsis_Count,
         Has_Inner_Ellipsis => Inner,
         Content => Buffer,
         Content_Length => Length,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Excerpt;

   function Parse_Highlight
     (Text   : String;
      Before : String := "<mark>";
      After  : String := "</mark>")
      return Highlight_Parse_Result
   is
      Item : constant String := Text;
      Position : Natural := Item'First;
      Count : Natural := 0;
      Open_Count : Natural := 0;
      Close_Count : Natural := 0;
      Open_At : Natural;
      Close_At : Natural;
   begin
      declare
         Scan : Natural := Item'First;
      begin
         while Scan <= Item'Last loop
            declare
               Found : constant Natural :=
                 Find_Substring (Item (Scan .. Item'Last), Before);
            begin
               exit when Found = 0;
               Open_Count := Open_Count + 1;
               Scan := Found + Natural'Max (Before'Length, 1);
            end;
         end loop;
      end;

      declare
         Scan : Natural := Item'First;
      begin
         while Scan <= Item'Last loop
            declare
               Found : constant Natural :=
                 Find_Substring (Item (Scan .. Item'Last), After);
            begin
               exit when Found = 0;
               Close_Count := Close_Count + 1;
               Scan := Found + Natural'Max (After'Length, 1);
            end;
         end loop;
      end;

      loop
         Open_At := Find_Substring (Item (Position .. Item'Last), Before);
         exit when Open_At = 0;
         Close_At := Find_Substring (Item (Open_At + Before'Length .. Item'Last), After);
         exit when Close_At = 0;
         Count := Count + 1;
         Position := Close_At + After'Length;
         exit when Position > Item'Last;
      end loop;

      return
        (Status => Humanize.Status.Ok,
         Match_Count => Count,
         Has_Markers => Count > 0,
         Text_Length => Item'Length,
         Before_Length => Before'Length,
         After_Length => After'Length,
         Unbalanced_Markers => Open_Count /= Close_Count,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Highlight;

   function Parse_Highlighted_Excerpt
     (Text     : String;
      Ellipsis : String := "...";
      Before   : String := "<mark>";
      After    : String := "</mark>")
      return Highlight_Parse_Result
   is
      pragma Unreferenced (Ellipsis);
   begin
      return Parse_Highlight (Text, Before, After);
   end Parse_Highlighted_Excerpt;

   function Parse_Inflection_Source_Label
     (Text : String)
      return Inflection_Source_Parse_Result
   is
      Item : constant String := Lower (Trim (Text));
      Source : Humanize.Strings.Inflection_Source;
   begin
      if Item = "dictionary" then
         Source := Humanize.Strings.Dictionary_Inflection;
      elsif Item = "irregular" then
         Source := Humanize.Strings.Irregular_Inflection;
      elsif Item = "uncountable" then
         Source := Humanize.Strings.Uncountable_Inflection;
      elsif Item = "rule" then
         Source := Humanize.Strings.Rule_Inflection;
      elsif Item = "unchanged" then
         Source := Humanize.Strings.Unchanged_Inflection;
      else
         return (Status => Humanize.Status.Invalid_Argument,
                 Error => Unsupported_Form,
                 others => <>);
      end if;

      return
        (Status => Humanize.Status.Ok,
         Source => Source,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   end Parse_Inflection_Source_Label;

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
      when others =>
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
      if Item = "never" or else Item = "aldrig" or else Item = "aldri"
        or else Item = "nie"
        or else Item = "jamais" or else Item = "nunca" or else Item = "mai"
        or else Item = "nooit" or else Item = "ei koskaan"
        or else Item = "nigdy" or else Item = "nikdy" or else Item = "asla"
        or else Item = B ("D0BDD0B8D0BAD0BED0B3D0B4D0B0")
        or else Item = B ("D0BDD196D0BAD0BED0BBD0B8")
        or else Item = B ("E381AAE38197")
        or else Item = B ("EC9786EC9D8C")
        or else Item = B ("E4BB8EE4B88D")
        or else Item = B ("D8A3D8A8D8AFD98BD8A7")
        or else Item = B ("E0A495E0A4ADE0A58020E0A4A8E0A4B9E0A580E0A482")
      then
         return (Status => Humanize.Status.Ok, Count => 0,
                 Exact => True, Consumed => Item'Length,
                 Error_Position => 0,
         Error => No_Parse_Error);
      elsif Item = "once" or else Item = B ("C3A96E2067616E67")
        or else Item = "einmal" or else Item = "une fois"
        or else Item = "una vez" or else Item = "una volta"
        or else Item = "uma vez" or else Item = "een keer"
        or else Item = "eenmaal" or else Item = "en gang"
        or else Item = B ("656E2067C3A56E67")
        or else Item = "kerran" or else Item = "raz"
        or else Item = B ("6A65646E6F75")
        or else Item = "bir kez" or else Item = B ("D0BED0B4D0B8D0BD20D180D0B0D0B7")
        or else Item = B ("D0BED0B4D0B8D0BD20D180D0B0D0B7")
        or else Item = B ("E4B880E59B9E")
        or else Item = B ("ED959C20EBB288")
        or else Item = B ("E4B880E6ACA1")
        or else Item = B ("D985D8B1D8A920D988D8A7D8ADD8AFD8A9")
        or else Item = B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0")
      then
         return (Status => Humanize.Status.Ok, Count => 1,
                 Exact => True, Consumed => Item'Length,
                 Error_Position => 0,
         Error => No_Parse_Error);
      elsif Item = "twice" or else Item = "to gange" or else Item = "to ganger"
        or else Item = "zweimal"
        or else Item = "deux fois" or else Item = "dos veces"
        or else Item = "due volte" or else Item = "duas vezes"
        or else Item = "twee keer" or else Item = "tweemaal"
        or else Item = B ("7476C3A52067C3A56E676572")
        or else Item = "kaksi kertaa" or else Item = "kahdesti"
        or else Item = "dwa razy"
        or else Item = B ("6476616B72C3A174")
        or else Item = "iki kez" or else Item = B ("D0B4D0B2D0B020D180D0B0D0B7D0B0")
        or else Item = B ("D0B4D0B2D0B020D180D0B0D0B7D0B8")
        or else Item = B ("E4BA8CE59B9E")
        or else Item = B ("EB919020EBB288")
        or else Item = B ("E4B8A4E6ACA1")
        or else Item = B ("D985D8B1D8AAD98AD986")
        or else Item = B ("E0A4A6E0A58B20E0A4ACE0A4BEE0A4B0")
      then
         return (Status => Humanize.Status.Ok, Count => 2,
                 Exact => True, Consumed => Item'Length,
                 Error_Position => 0,
         Error => No_Parse_Error);
      end if;

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
                    and then (Unit = "time" or else Unit = "times"
                              or else Unit = "gang" or else Unit = "gange"
                              or else Unit = "ganger"
                              or else Unit = "mal"
                              or else Unit = B ("67C3A56E676572")
                              or else Unit = "fois" or else Unit = "vez"
                              or else Unit = "veces" or else Unit = "vezes"
                              or else Unit = "volta"
                              or else Unit = "volte" or else Unit = "keer"
                              or else Unit = "kertaa" or else Unit = "razy"
                              or else Unit = B ("6B72C3A174")
                              or else Unit = "kez"
                              or else Unit = B ("D180D0B0D0B7")
                              or else Unit = B ("D180D0B0D0B7D0B0")
                              or else Unit = B ("D180D0B0D0B7D0B8")
                              or else Unit = B ("E59B9E")
                              or else Unit = B ("EBB288")
                              or else Unit = B ("E6ACA1")
                              or else Unit = B ("D985D8B1D8A9")
                              or else Unit = B ("D985D8B1D8A7D8AA")
                              or else Unit = B ("E0A4ACE0A4BEE0A4B0"))
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
           or else not
             (Unit = "time" or else Unit = "times"
              or else Unit = "gang" or else Unit = "gange"
              or else Unit = "ganger"
              or else Unit = "mal"
              or else Unit = B ("67C3A56E676572")
              or else Unit = "fois" or else Unit = "vez"
              or else Unit = "veces" or else Unit = "vezes"
              or else Unit = "volta"
              or else Unit = "volte" or else Unit = "keer"
              or else Unit = "kertaa" or else Unit = "razy"
              or else Unit = B ("6B72C3A174")
              or else Unit = "kez"
              or else Unit = B ("D180D0B0D0B7")
              or else Unit = B ("D180D0B0D0B7D0B0")
              or else Unit = B ("D180D0B0D0B7D0B8")
              or else Unit = B ("E59B9E")
              or else Unit = B ("EBB288")
              or else Unit = B ("E6ACA1")
              or else Unit = B ("D985D8B1D8A9")
              or else Unit = B ("D985D8B1D8A7D8AA")
              or else Unit = B ("E0A4ACE0A4BEE0A4B0"))
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
      when others =>
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
      Item : constant String := Lower (Trim (Text));
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
        or else Item = "woche"
        or else Item = "semaine"
        or else Item = "semana"
        or else Item = "settimana"
        or else Item = "viikossa"
        or else Item = "haftada"
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
        or else Try (" por ") or else Try (" na ") or else Try (" za ")
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
                  Is_Less : constant Boolean :=
                    Less_Suffix'Length > 0 and then Ends_With (Rest, Less_Suffix);
                  Frequency_Text : constant String :=
                    (if Is_Less
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

      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Parse_Period_First_Rate;

   function Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
      return Boolean
   is
      Item : constant String := Lower (Trim (Text));
   begin
      if Item = "m" or else Item = "meter" or else Item = "meters"
        or else Item = "metre" or else Item = "metres"
        or else Item = B ("6DC3A8747265")
        or else Item = B ("6DC3A874726573")
        or else Item = "meter" or else Item = "metri"
        or else Item = B ("6D65747269C3A4")
        or else Item = "metro"
        or else Item = "metros" or else Item = "metr" or else Item = "metry"
        or else Item = B ("6D657472C3B377")
        or else Item = B ("6D657472C5AF")
        or else Item = "metreler" or else Item = B ("D0BCD0B5D182D180")
        or else Item = B ("D0BCD0B5D182D180D0B0")
        or else Item = B ("D0BCD0B5D182D180D0BED0B2")
        or else Item = B ("D0BCD0B5D182D180D18B")
        or else Item = B ("D0BCD0B5D182D180D0B8")
        or else Item = B ("D0BCD0B5D182D180D196D0B2")
        or else Item = B ("E383A1E383BCE38388E383AB")
        or else Item = B ("EBAFB8ED84B0")
        or else Item = B ("E7B1B3")
        or else Item = B ("D985D8AAD8B1")
        or else Item = B ("D8A3D985D8AAD8A7D8B1")
        or else Item = B ("E0A4AEE0A580E0A49FE0A4B0")
      then
         Unit := Humanize.Units.Meter;
      elsif Item = "km" or else Item = "kilometer" or else Item = "kilometers"
        or else Item = "kilometre" or else Item = "kilometres"
        or else Item = B ("6B696C6F6DC3A8747265")
        or else Item = B ("6B696C6F6DC3A874726573")
        or else Item = "kilometro" or else Item = "kilometros"
        or else Item = B ("6B696CC3B36D6574726F")
        or else Item = B ("6B696CC3B36D6574726F73")
        or else Item = B ("7175696CC3B46D6574726F")
        or else Item = B ("7175696CC3B46D6574726F73")
        or else Item = B ("7175696CC3B36D6574726F")
        or else Item = B ("7175696CC3B36D6574726F73")
        or else Item = "chilometro" or else Item = "chilometri"
        or else Item = "kilometr" or else Item = "kilometry"
        or else Item = B ("6B696C6F6D657472C3B377")
        or else Item = B ("6B696C6F6D657472C5AF")
        or else Item = B ("6B696C6F6D65747269C3A4")
        or else Item = "kilometreler"
        or else Item = B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180")
        or else Item = B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D0B0")
        or else Item = B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D0BED0B2")
        or else Item = B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B")
        or else Item = B ("D0BAD196D0BBD0BED0BCD0B5D182D180")
        or else Item = B ("D0BAD196D0BBD0BED0BCD0B5D182D180D0B8")
        or else Item = B ("D0BAD196D0BBD0BED0BCD0B5D182D180D196D0B2")
        or else Item = B ("E382ADE383ADE383A1E383BCE38388E383AB")
        or else Item = B ("ED82ACEBA19CEBAFB8ED84B0")
        or else Item = B ("E58D83E7B1B3")
        or else Item = B ("D983D98AD984D988D985D8AAD8B1")
        or else Item = B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA")
        or else Item = B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0")
      then
         Unit := Humanize.Units.Kilometer;
      elsif Item = "cm" or else Item = "centimeter"
        or else Item = "centimeters" or else Item = "centimetre"
        or else Item = "centimetres"
        or else Item = B ("63656E74696DC3A8747265")
        or else Item = B ("63656E74696DC3A874726573")
        or else Item = "centimetro" or else Item = "centimetros"
        or else Item = B ("63656E74C3AD6D6574726F")
        or else Item = B ("63656E74C3AD6D6574726F73")
        or else Item = "centimetr" or else Item = "centimetry"
        or else Item = B ("63656E74796D657472C3B377")
        or else Item = B ("63656E74696D657472C5AF")
        or else Item = B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180")
        or else Item = B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B0")
        or else Item = B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0BED0B2")
        or else Item = B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D18B")
        or else Item = B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B8")
        or else Item = B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D196D0B2")
        or else Item = B ("E382BBE383B3E38381E383A1E383BCE38388E383AB")
        or else Item = B ("E58E98E7B1B3")
      then
         Unit := Humanize.Units.Centimeter;
      elsif Item = "mm" or else Item = "millimeter"
        or else Item = "millimeters" or else Item = "millimetre"
        or else Item = "millimetres"
        or else Item = B ("6D696C6C696DC3A8747265")
        or else Item = B ("6D696C6C696DC3A874726573")
        or else Item = "milimetro" or else Item = "milimetros"
        or else Item = B ("6D696CC3AD6D6574726F")
        or else Item = B ("6D696CC3AD6D6574726F73")
        or else Item = "millimetro" or else Item = "millimetri"
        or else Item = "milimetr" or else Item = "milimetry"
        or else Item = B ("6D696C696D657472C3B377")
        or else Item = B ("6D696C696D657472C5AF")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0B0")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0BED0B2")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D18B")
        or else Item = B ("D0BCD196D0BBD196D0BCD0B5D182D180")
        or else Item = B ("D0BCD196D0BBD196D0BCD0B5D182D180D0B8")
        or else Item = B ("D0BCD196D0BBD196D0BCD0B5D182D180D196D0B2")
        or else Item = B ("E3839FE383AAE383A1E383BCE38388E383AB")
        or else Item = B ("E6AFABE7B1B3")
      then
         Unit := Humanize.Units.Millimeter;
      elsif Item = "g" or else Item = "gram" or else Item = "grams"
        or else Item = "gramy"
        or else Item = B ("6772616DC3B377")
        or else Item = B ("6772616DC5AF")
        or else Item = B ("D0B3D180D0B0D0BC")
        or else Item = B ("D0B3D180D0B0D0BCD0BC")
        or else Item = B ("D0B3D180D0B0D0BCD0B8")
        or else Item = B ("D0B3D180D0B0D0BCD196D0B2")
        or else Item = B ("D0B3D180D0B0D0BCD0BCD0B0")
        or else Item = B ("D0B3D180D0B0D0BCD0BCD0BED0B2")
      then
         Unit := Humanize.Units.Gram;
      elsif Item = "kg" or else Item = "kilogram" or else Item = "kilograms"
        or else Item = "kilogramm" or else Item = "kilogramme"
        or else Item = "kilogramme" or else Item = "kilogrammes"
        or else Item = "kilogramo" or else Item = "kilogramos"
        or else Item = "quilograma" or else Item = "quilogramas"
        or else Item = "chilogrammo" or else Item = "chilogrammi"
        or else Item = "kilogrammaa"
        or else Item = "kilogramy" or else Item = "kilogramlar"
        or else Item = B ("6B696C6F6772616DC3B377")
        or else Item = B ("6B696C6F6772616DC5AF")
        or else Item = B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BC")
        or else Item = B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0B0")
        or else Item = B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2")
        or else Item = B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD18B")
        or else Item = B ("D0BAD196D0BBD0BED0B3D180D0B0D0BC")
        or else Item = B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD0B8")
        or else Item = B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2")
        or else Item = B ("E382ADE383ADE382B0E383A9E383A0")
        or else Item = B ("ED82ACEBA19CEAB7B8EBA7A8")
        or else Item = B ("ED82ACEBA19CEAB7B8EB9EA8")
        or else Item = B ("E58D83E5858B")
        or else Item = B ("D983D98AD984D988D8ACD8B1D8A7D985")
        or else Item = B ("D983D98AD984D988D8ACD8B1D8A7D985D8A7D8AA")
        or else Item = B ("D983D98AD984D988D8BAD8B1D8A7D985")
        or else Item = B ("D983D98AD984D988D8BAD8B1D8A7D985D8A7D8AA")
        or else Item = B ("E0A495E0A4BFE0A4B2E0A58BE0A497E0A58DE0A4B0E0A4BEE0A4AE")
      then
         Unit := Humanize.Units.Kilogram;
      elsif Item = "mg" or else Item = "milligram"
        or else Item = "milligrams"
        or else Item = "miligram" or else Item = "miligramy"
        or else Item = B ("6D696C696772616DC3B377")
        or else Item = B ("6D696C696772616DC5AF")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BC")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0B0")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0BED0B2")
        or else Item = B ("D0BCD196D0BBD196D0B3D180D0B0D0BC")
        or else Item = B ("D0BCD196D0BBD196D0B3D180D0B0D0BCD0B8")
        or else Item = B ("D0BCD196D0BBD196D0B3D180D0B0D0BCD196D0B2")
      then
         Unit := Humanize.Units.Milligram;
      elsif Item = "l" or else Item = "liter" or else Item = "liters"
        or else Item = "litre" or else Item = "litres"
        or else Item = "litri"
        or else Item = "litro" or else Item = "litros"
        or else Item = "litraa"
        or else Item = "litr" or else Item = "litry"
        or else Item = B ("6C697472C3B377")
        or else Item = B ("6C697472C5AF")
        or else Item = "litreler"
        or else Item = B ("D0BBD0B8D182D180")
        or else Item = B ("D0BBD0B8D182D180D0B0")
        or else Item = B ("D0BBD0B8D182D180D0BED0B2")
        or else Item = B ("D0BBD0B8D182D180D18B")
        or else Item = B ("D0BBD196D182D180")
        or else Item = B ("D0BBD196D182D180D0B8")
        or else Item = B ("D0BBD196D182D180D196D0B2")
        or else Item = B ("E383AAE38383E38388E383AB")
        or else Item = B ("EBA6ACED84B0")
        or else Item = B ("E58D87")
        or else Item = B ("D984D8AAD8B1")
        or else Item = B ("D984D8AAD8B1D8A7D8AA")
        or else Item = B ("E0A4B2E0A580E0A49FE0A4B0")
      then
         Unit := Humanize.Units.Liter;
      elsif Item = "ml" or else Item = "milliliter"
        or else Item = "milliliters" or else Item = "millilitre"
        or else Item = "millilitres"
        or else Item = "mililitr" or else Item = "mililitry"
        or else Item = B ("6D696C696C697472C3B377")
        or else Item = B ("6D696C696C697472C5AF")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0B0")
        or else Item = B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0BED0B2")
        or else Item = B ("D0BCD196D0BBD196D0BBD196D182D180")
        or else Item = B ("D0BCD196D0BBD196D0BBD196D182D180D0B8")
        or else Item = B ("D0BCD196D0BBD196D0BBD196D182D180D196D0B2")
      then
         Unit := Humanize.Units.Milliliter;
      elsif Item = "c" or else Item = "deg c" or else Item = "degree c"
        or else Item = "degrees c" or else Item = "celsius"
        or else Item = "degree celsius" or else Item = "degrees celsius"
      then
         Unit := Humanize.Units.Celsius;
      elsif Item = "f" or else Item = "deg f" or else Item = "degree f"
        or else Item = "degrees f" or else Item = "fahrenheit"
        or else Item = "degree fahrenheit"
        or else Item = "degrees fahrenheit"
      then
         Unit := Humanize.Units.Fahrenheit;
      elsif Item = "m2" or else Item = "square meter"
        or else Item = "square meters" or else Item = "square metre"
        or else Item = "square metres"
      then
         Unit := Humanize.Units.Square_Meter;
      elsif Item = "km2" or else Item = "square kilometer"
        or else Item = "square kilometers" or else Item = "square kilometre"
        or else Item = "square kilometres"
      then
         Unit := Humanize.Units.Square_Kilometer;
      elsif Item = "ha" or else Item = "hectare" or else Item = "hectares" then
         Unit := Humanize.Units.Hectare;
      elsif Item = "acre" or else Item = "acres" or else Item = "ac" then
         Unit := Humanize.Units.Acre;
      elsif Item = "m3" or else Item = "cubic meter"
        or else Item = "cubic meters" or else Item = "cubic metre"
        or else Item = "cubic metres"
      then
         Unit := Humanize.Units.Cubic_Meter;
      elsif Item = "km/h" or else Item = "kilometer per hour"
        or else Item = "kilometers per hour"
      then
         Unit := Humanize.Units.Kilometer_Per_Hour;
      elsif Item = "m/s" or else Item = "meter per second"
        or else Item = "meters per second"
      then
         Unit := Humanize.Units.Meter_Per_Second;
      elsif Item = "pa" or else Item = "pascal" or else Item = "pascals" then
         Unit := Humanize.Units.Pascal;
      elsif Item = "kpa" or else Item = "kilopascal"
        or else Item = "kilopascals"
      then
         Unit := Humanize.Units.Kilopascal;
      elsif Item = "j" or else Item = "joule" or else Item = "joules" then
         Unit := Humanize.Units.Joule;
      elsif Item = "kj" or else Item = "kilojoule"
        or else Item = "kilojoules"
      then
         Unit := Humanize.Units.Kilojoule;
      elsif Item = "w" or else Item = "watt" or else Item = "watts" then
         Unit := Humanize.Units.Watt;
      elsif Item = "kw" or else Item = "kilowatt"
        or else Item = "kilowatts"
      then
         Unit := Humanize.Units.Kilowatt;
      elsif Item = "hz" or else Item = "hertz" or else Item = "cycles per second"
      then
         Unit := Humanize.Units.Hertz;
      elsif Item = "khz" or else Item = "kilohertz" then
         Unit := Humanize.Units.Kilohertz;
      elsif Item = "mi" or else Item = "mile" or else Item = "miles" then
         Unit := Humanize.Units.Mile;
      elsif Item = "nmi" or else Item = "nautical mile"
        or else Item = "nautical miles"
      then
         Unit := Humanize.Units.Nautical_Mile;
      elsif Item = "yd" or else Item = "yard" or else Item = "yards" then
         Unit := Humanize.Units.Yard;
      elsif Item = "ft" or else Item = "foot" or else Item = "feet" then
         Unit := Humanize.Units.Foot;
      elsif Item = "in" or else Item = "inch" or else Item = "inches" then
         Unit := Humanize.Units.Inch;
      elsif Item = "tsp" or else Item = "teaspoon"
        or else Item = "teaspoons"
      then
         Unit := Humanize.Units.Teaspoon;
      elsif Item = "tbsp" or else Item = "tablespoon"
        or else Item = "tablespoons"
      then
         Unit := Humanize.Units.Tablespoon;
      elsif Item = "cup" or else Item = "cups" then
         Unit := Humanize.Units.Cup;
      elsif Item = "gal" or else Item = "gallon" or else Item = "gallons" then
         Unit := Humanize.Units.Gallon;
      elsif Item = "lb" or else Item = "lbs" or else Item = "pound"
        or else Item = "pounds"
      then
         Unit := Humanize.Units.Pound;
      elsif Item = "oz" or else Item = "ounce" or else Item = "ounces" then
         Unit := Humanize.Units.Ounce;
      elsif Item = "st" or else Item = "stone" then
         Unit := Humanize.Units.Stone;
      elsif Item = "tonne" or else Item = "tonnes" then
         Unit := Humanize.Units.Tonne;
      elsif Item = "ton" or else Item = "tons" then
         Unit := Humanize.Units.Ton;
      else
         return False;
      end if;
      return True;
   end Unit_Value;

   function Parse_Rate
     (Text : String)
      return Rate_Parse_Result
   is
      Item : constant String := Lower (Trim (Normalize_Native_Digits (Text)));
      Prefix : constant String := "approximately ";
      Less_Prefix : constant String := "less than ";
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
      elsif Starts_With (Item, "ongeveer ") then
         Body_First := Item'First + 9;
      elsif Starts_With (Item, "noin ") then
         Body_First := Item'First + 5;
      elsif Starts_With (Item, B ("6F6B6FC5826F20")) then
         Body_First := Item'First + 7;
      elsif Starts_With (Item, B ("70C59969626C69C5BE6EC49B20")) then
         Body_First := Item'First + 13;
      elsif Starts_With (Item, "aproximadamente ") then
         Body_First := Item'First + 16;
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
      elsif Starts_With (Item, B ("E0A4B2E0A497E0A4ADE0A49720")) then
         Body_First := Item'First + 13;
      elsif Starts_With (Item, "mindre end ") then
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
      elsif Starts_With (Item, B ("6D6E656CC5A1206E65C5BE20")) then
         Body_First := Item'First + 10;
         Less := True;
      elsif Starts_With (Item, B ("D0BCD0B5D0BDD18CD188D0B520D187D0B5D0BC20"))
        or else Starts_With (Item, B ("D0BCD0B5D0BDD188D0B520D0BDD196D0B620"))
      then
         Body_First := Item'First + Find_Substring (Item, " ");
         Body_First := Body_First + Find_Substring (Item (Body_First .. Item'Last), " ");
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
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      declare
         F : constant Frequency_Parse_Result :=
           Parse_Frequency (Item (Body_First .. Per_Pos - 1));
      begin
         if F.Status /= Humanize.Status.Ok then
            return (Status => F.Status, others => <>);
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
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
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
                 or else Low (Index .. Index + 3) = " ve "
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
      when others =>
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
      Item : constant String := Lower (Trim (Text));
      Last_Number : Natural := Item'First - 1;
      Amount : Long_Float;
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
      when others =>
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

   function Roman_Digit (Ch : Character) return Natural is
   begin
      case Ada.Characters.Handling.To_Upper (Ch) is
         when 'I' => return 1;
         when 'V' => return 5;
         when 'X' => return 10;
         when 'L' => return 50;
         when 'C' => return 100;
         when 'D' => return 500;
         when 'M' => return 1000;
         when others => return 0;
      end case;
   end Roman_Digit;

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
           or else To_String (Canonical.Text) /= Item
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
      when others =>
         return
           (Status => Humanize.Status.Invalid_Value,
            Error => Out_Of_Range,
            others => <>);
   end Parse_Roman;

   function Is_Roman_Character (Ch : Character) return Boolean is
     (Roman_Digit (Ch) /= 0);

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

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result
   is
      Item : constant String := Trim (Normalize_Native_Digits (Text));
      Last_Number : Natural;
      Unit_Start : Natural;
      Amount : Long_Float;
      Unit : Humanize.Units.Unit_Kind;
   begin
      if not Split_Number_Unit (Item, Last_Number, Unit_Start) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error =>
              (if Item'Length = 0 then Empty_Input
               elsif Is_Digit (Item (Item'First))
                 or else Item (Item'First) = '+'
                 or else Item (Item'First) = '-'
               then Expected_Unit
               else Expected_Number),
            others => <>);
      end if;

      if not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Item'First,
            Error => Expected_Number,
            others => <>);
      elsif not Unit_Value (Item (Unit_Start .. Item'Last), Unit) then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Unit_Start,
            Error => Expected_Unit,
            others => <>);
      end if;

      return
        (Status   => Humanize.Status.Ok,
         Value    => Amount,
         Unit     => Unit,
         Exact    => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Unit;

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result
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
            Result : constant Unit_Parse_Result :=
              Parse_Unit (Text (Text'First .. Stop));
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
   end Scan_Unit;

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
      when others =>
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

   function Compound_Result
     (Value    : Long_Float;
      Unit     : String;
      Consumed : Natural)
      return Compound_Unit_Parse_Result
   is
      Result : Compound_Unit_Parse_Result;
      Count  : constant Natural := Natural'Min (Unit'Length, Result.Unit'Length);
   begin
      Result.Status := Humanize.Status.Ok;
      Result.Value := Value;
      Result.Unit_Length := Count;
      Result.Unit (1 .. Count) := Unit (Unit'First .. Unit'First + Count - 1);
      Result.Exact := True;
      Result.Consumed := Consumed;
      Result.Error_Position := 0;
      return Result;
   end Compound_Result;

   function Parse_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Item : constant String := Trim (Text);
      Last_Number : Natural;
      Unit_Start : Natural;
      Amount : Long_Float;
      Unit : Humanize.Status.Text_Result;
   begin
      if not Split_Number_Unit (Item, Last_Number, Unit_Start) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error =>
                   (if Item'Length = 0 then Empty_Input
                    elsif Is_Digit (Item (Item'First))
                      or else Item (Item'First) = '+'
                      or else Item (Item'First) = '-'
                    then Expected_Unit
                    else Expected_Number),
                 others => <>);
      elsif not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Unit := Normalize_Unit_Text (Item (Unit_Start .. Item'Last));
      declare
         U : constant String := To_String (Unit.Text);
      begin
         if U = "px" or else U = "em" or else U = "rem" or else U = "vh"
           or else U = "vw" or else U = "%" or else U = "pt"
         then
            return Compound_Result (Amount, U, Item'Length);
         else
            return (Status => Humanize.Status.Invalid_Argument,
                    Error_Position => Unit_Start,
                    Error => Expected_Unit,
                    others => <>);
         end if;
      end;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_CSS_Length;

   function Scan_CSS_Length
     (Text : String)
      return Compound_Unit_Parse_Result
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
            Result : constant Compound_Unit_Parse_Result :=
              Parse_CSS_Length (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_CSS_Length;

   function Known_Compound_Unit (Unit : String) return Boolean is
      U : constant String := Lower (Trim (Unit));
   begin
      return U = "ms" or else U = "us" or else U = "s"
        or else U = "db" or else U = "dbm" or else U = "tbw"
        or else U = "hz" or else U = "hz refresh"
        or else U = "nits" or else U = "dpi" or else U = "iops"
        or else U = "k iops" or else U = "m iops"
        or else U = "bit" or else U = "kbit" or else U = "mbit"
        or else U = "gbit"
        or else U = "kg/m3" or else U = "m/s2" or else U = "n m"
        or else U = "l/100 km" or else U = "ml/s"
        or else U = "ma" or else U = "a" or else U = "kv"
        or else U = "v" or else U = "ppi" or else U = "kohm"
        or else U = "ohm" or else U = "uf" or else U = "mh"
        or else U = "mol/l" or else U = "mpg"
        or else U = "gb/s" or else U = "mb/s" or else U = "kb/s"
        or else U = "gbit/s" or else U = "mbit/s"
        or else U = "kbit/s" or else U = "bit/s"
        or else U = "mib/s" or else U = "kib/s"
        or else U = "b/s" or else U = "% cpu" or else U = "% battery"
        or else U = "in screen" or else U = "pt";
   end Known_Compound_Unit;

   function Parse_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result
   is
      Item : constant String := Trim (Text);
      Last_Number : Natural;
      Unit_Start : Natural;
      Amount : Long_Float;
      Unit : Humanize.Status.Text_Result;
   begin
      if not Split_Number_Unit (Item, Last_Number, Unit_Start) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error =>
                   (if Item'Length = 0 then Empty_Input
                    elsif Is_Digit (Item (Item'First))
                      or else Item (Item'First) = '+'
                      or else Item (Item'First) = '-'
                    then Expected_Unit
                    else Expected_Number),
                 others => <>);
      elsif not Numeric_Value (Item (Item'First .. Last_Number), Amount) then
         return (Status => Humanize.Status.Invalid_Argument,
                 Error_Position => Item'First,
                 Error => Expected_Number,
                 others => <>);
      end if;

      Unit := Normalize_Unit_Text (Item (Unit_Start .. Item'Last));
      declare
         U : constant String := To_String (Unit.Text);
      begin
         if Known_Compound_Unit (U) then
            return Compound_Result (Amount, U, Item'Length);
         else
            return (Status => Humanize.Status.Invalid_Argument,
                    Error_Position => Unit_Start,
                    Error => Expected_Unit,
                    others => <>);
         end if;
      end;
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Parse_Compound_Unit;

   function Scan_Compound_Unit
     (Text : String)
      return Compound_Unit_Parse_Result
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
            Result : constant Compound_Unit_Parse_Result :=
              Parse_Compound_Unit (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return (Status => Humanize.Status.Invalid_Argument,
              Error_Position => Text'First,
              others => <>);
   end Scan_Compound_Unit;

end Humanize.Parsing;
