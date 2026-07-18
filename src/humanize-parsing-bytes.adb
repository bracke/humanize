with Humanize.Bounded_Text;
with Humanize.Bytes;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Bytes is
   use type Humanize.Status.Status_Code;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Normalize_Native_Digits (Text : String) return String
      renames Humanize.Parsing.Support.Normalize_Native_Digits;

   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;

   function Rounded_Nonnegative (Value : Long_Float) return Long_Long_Integer
      renames Humanize.Parsing.Support.Rounded_Nonnegative;

   function Split_Number_Unit
     (Text        : String;
      Number_Text : out Natural;
      Unit_Start  : out Natural)
      return Boolean
      renames Humanize.Parsing.Support.Split_Number_Unit;

   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;

   function Byte_Multiplier (Unit : String) return Long_Float is
      U : constant String := Clean_Lower (Unit);
   begin
      if U = "byte" or else U = "bytes" or else U = "b" then
         return 1.0;
      elsif U = "bytes"
        or else U = "byte"
        or else U = "byt" or else U = "bytes"
        or else U = "octet" or else U = "octets"
        or else U = "byte" or else U = "bytes"
        or else U = "bajt" or else U = "bajty"
        or else U = "baitas" or else U = "baitai"
        or else U = "bait"
        or else U = "baiti"
        or else U = "bajto" or else U = "bajtoj"
        or else U = "tavu" or else U = "tavua"
        or else U = "bayt"
        or else U = "greep"
        or else U = B ("D0B1D0B0D0B9D182")
        or else U = B ("D0B1D0B0D0B9D182D0B0")
        or else U = B ("D0B1D0B0D0B9D182D196D0B2")
        or else U = B ("E38390E382A4E38388")
        or else U = B ("EBB094EC9DB4ED8AB8")
        or else U = B ("E5AD97E88A82")
        or else U = B ("D8A8D8A7D98AD8AA")
        or else U = B ("E0A4ACE0A4BEE0A487E0A49F")
      then
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
            Consumed => Trim (Text)'Length,
            Error_Position => 0,
            Error => No_Parse_Error);
      exception
         when others => --  parse failure normalization
            return
              (Status => Humanize.Status.Invalid_Value,
               Value => 0,
               Error => Out_Of_Range,
               others => <>);
      end;
   end Parse_Bytes;

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
end Humanize.Parsing.Bytes;
