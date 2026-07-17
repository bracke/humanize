with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Cross_Domain.Support is
   use type Humanize.Domain_Details.Domain_Surface;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   function Find_Text (Text, Pattern : String) return Natural
      renames Humanize.Bounded_Text.Index_Text;

   function Is_Digit (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (C : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Is_ASCII_Alphanumeric (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Alphanumeric;

   function Is_Upper (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;

   function Is_Lower (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;

   function Bool_Text (Value : Boolean) return String is
   begin
      if Value then
         return "yes";
      else
         return "no";
      end if;
   end Bool_Text;

   function Offset_Label (Offset_Minutes : Integer) return String is
      Abs_Minutes : constant Natural := Natural (abs Offset_Minutes);
      Hours       : constant Natural := Abs_Minutes / 60;
      Minutes     : constant Natural := Abs_Minutes mod 60;
      Sign        : constant String := (if Offset_Minutes < 0 then "-" else "+");
      Hour_Text   : constant String :=
        (if Hours < 10 then "0" & Image (Hours) else Image (Hours));
      Minute_Text : constant String :=
        (if Minutes < 10 then "0" & Image (Minutes) else Image (Minutes));
   begin
      return "UTC" & Sign & Hour_Text & ":" & Minute_Text;
   end Offset_Label;

   function Identifier_Kind_Text (Kind : Identifier_Kind) return String is
   begin
      case Kind is
         when UUID_Identifier     => return "uuid";
         when ULID_Identifier     => return "ulid";
         when Commit_Identifier   => return "commit";
         when Checksum_Identifier => return "checksum";
         when Trace_Identifier    => return "trace";
         when Ticket_Identifier   => return "ticket";
         when Opaque_Identifier   => return "identifier";
      end case;
   end Identifier_Kind_Text;

   function Contact_Kind_Text (Kind : Contact_Kind) return String is
   begin
      case Kind is
         when Email_Contact   => return "email";
         when Phone_Contact   => return "phone";
         when Address_Contact => return "address";
         when Unknown_Contact => return "contact";
      end case;
   end Contact_Kind_Text;

   function Progress_State_Text (State : Progress_State) return String is
   begin
      case State is
         when Progress_Not_Started => return "not started";
         when Progress_Running     => return "running";
         when Progress_Stalled     => return "stalled";
         when Progress_Retrying    => return "retrying";
         when Progress_Complete    => return "complete";
         when Progress_Failed      => return "failed";
      end case;
   end Progress_State_Text;

   function File_Kind_Text (Kind : File_Metadata_Kind) return String is
   begin
      case Kind is
         when Plain_File      => return "file";
         when Directory_File  => return "directory";
         when Archive_File    => return "archive";
         when Compressed_File => return "compressed file";
         when Image_File      => return "image";
         when Script_File     => return "script";
         when Executable_File => return "executable";
         when Unknown_File    => return "unknown file";
      end case;
   end File_Kind_Text;

   function Network_Event_Text (Event : Network_Event_Kind) return String is
   begin
      case Event is
         when Connecting_Network   => return "connecting";
         when Connected_Network    => return "connected";
         when Redirected_Network   => return "redirected";
         when Retrying_Network     => return "retrying";
         when Rate_Limited_Network => return "rate limited";
         when TLS_Failed_Network   => return "TLS failed";
         when Stalled_Network      => return "stalled";
         when Complete_Network     => return "complete";
         when Failed_Network       => return "failed";
      end case;
   end Network_Event_Text;

   function Network_Diagnostic_Text
     (Kind : Network_Diagnostic_Kind)
      return String
   is
   begin
      case Kind is
         when DNS_Diagnostic             => return "DNS lookup failed";
         when TCP_Diagnostic             => return "TCP connection failed";
         when TLS_Diagnostic             => return "TLS certificate failed";
         when HTTP_Diagnostic            => return "HTTP request failed";
         when Proxy_Diagnostic           => return "proxy failed";
         when Timeout_Diagnostic         => return "timed out";
         when Reset_Diagnostic           => return "connection reset";
         when Unknown_Network_Diagnostic => return "network diagnostic";
      end case;
   end Network_Diagnostic_Text;

   function Alignment_Text (Alignment : Terminal_Alignment) return String is
   begin
      case Alignment is
         when Align_Left   => return "left";
         when Align_Right  => return "right";
         when Align_Center => return "center";
      end case;
   end Alignment_Text;

   function Product_Code_Kind_Text (Kind : Product_Code_Kind) return String is
   begin
      case Kind is
         when ISBN_10_Code         => return "ISBN-10";
         when ISBN_13_Code         => return "ISBN-13";
         when EAN_13_Code          => return "EAN-13";
         when UPC_A_Code           => return "UPC-A";
         when SKU_Code             => return "SKU";
         when Barcode_Code         => return "barcode";
         when Unknown_Product_Code => return "product code";
      end case;
   end Product_Code_Kind_Text;

   function Checksum_State_Text (State : Checksum_State) return String is
   begin
      case State is
         when Checksum_Not_Checked => return "checksum not checked";
         when Checksum_Valid       => return "checksum valid";
         when Checksum_Mismatch    => return "checksum mismatch";
         when Checksum_Missing     => return "checksum missing";
      end case;
   end Checksum_State_Text;

   function Checksum_Value_Text (State : Checksum_State) return String is
   begin
      case State is
         when Checksum_Not_Checked => return "";
         when Checksum_Valid       => return "valid";
         when Checksum_Mismatch    => return "mismatch";
         when Checksum_Missing     => return "missing";
      end case;
   end Checksum_Value_Text;

   function Enum_Category_Text (Category : Enum_State_Category) return String is
   begin
      case Category is
         when Neutral_State => return "neutral";
         when Success_State => return "success";
         when Warning_State => return "warning";
         when Failure_State => return "failure";
         when Pending_State => return "pending";
      end case;
   end Enum_Category_Text;

   function Diff_Node_Kind_Text (Kind : Diff_Node_Kind) return String is
   begin
      case Kind is
         when Field_Node  => return "field";
         when Object_Node => return "object";
         when List_Node   => return "list";
      end case;
   end Diff_Node_Kind_Text;

   function Validation_Relation_Text
     (Relation : Validation_Relation)
      return String
   is
   begin
      case Relation is
         when No_Relation      => return "must be valid";
         when Less_Than        => return "must be less than";
         when Less_Or_Equal    => return "must be at most";
         when Greater_Than     => return "must be greater than";
         when Greater_Or_Equal => return "must be at least";
         when Equal_To         => return "must equal";
         when Not_Equal_To     => return "must not equal";
         when Before_Field     => return "must be before";
         when After_Field      => return "must be after";
      end case;
   end Validation_Relation_Text;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Contains_CI (Text, Pattern : String) return Boolean is
   begin
      return Humanize.Bounded_Text.Contains_Text (Lower (Text), Lower (Pattern));
   end Contains_CI;

   function Starts_With_CI (Text, Prefix : String) return Boolean is
      Item : constant String := Lower (Text);
      P    : constant String := Lower (Prefix);
   begin
      return Item'Length >= P'Length
        and then Item (Item'First .. Item'First + P'Length - 1) = P;
   end Starts_With_CI;

   function Ends_With_CI (Text, Suffix : String) return Boolean is
      Item : constant String := Lower (Text);
      S    : constant String := Lower (Suffix);
   begin
      return Item'Length >= S'Length
        and then Item (Item'Last - S'Length + 1 .. Item'Last) = S;
   end Ends_With_CI;

   function Is_Hex (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Hex_Digit;

   function Digit_Count (Text : String) return Natural is
      Count : Natural := 0;
   begin
      for C of Text loop
         if Is_Digit (C) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Digit_Count;

   function Alpha_Num_Count (Text : String) return Natural is
      Count : Natural := 0;
   begin
      for C of Text loop
         if Is_ASCII_Alphanumeric (C) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Alpha_Num_Count;

   function Hex_Count (Text : String) return Natural is
      Count : Natural := 0;
   begin
      for C of Text loop
         if Is_Hex (C) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Hex_Count;

   function Shorten
     (Value          : String;
      Visible_Prefix : Natural;
      Visible_Suffix : Natural)
      return String
   is
      Item : constant String := Clean (Value);
   begin
      if Item'Length = 0 then
         return "empty";
      elsif Item'Length <= Visible_Prefix + Visible_Suffix + 3 then
         return Item;
      elsif Visible_Prefix = 0 and then Visible_Suffix = 0 then
         return "hidden";
      elsif Visible_Prefix = 0 then
         return "..." & Item (Item'Last - Visible_Suffix + 1 .. Item'Last);
      elsif Visible_Suffix = 0 then
         return Item (Item'First .. Item'First + Visible_Prefix - 1) & "...";
      else
         return Item (Item'First .. Item'First + Visible_Prefix - 1)
           & "..."
           & Item (Item'Last - Visible_Suffix + 1 .. Item'Last);
      end if;
   end Shorten;

   function Line_Text (Text : String) return String is
      Last : Natural := Text'Last;
   begin
      for Index in Text'Range loop
         if Text (Index) = ASCII.LF or else Text (Index) = ASCII.CR then
            Last := Index - 1;
            exit;
         end if;
      end loop;
      if Last < Text'First then
         return "";
      else
         return Text (Text'First .. Last);
      end if;
   end Line_Text;

   function Natural_At (Text : String; Start : Natural) return Natural is
      Index : Natural := Start;
      Value : Natural := 0;
   begin
      while Index <= Text'Last and then Is_Digit (Text (Index)) loop
         Value := Value * 10 + Digit_Value (Text (Index));
         Index := Index + 1;
      end loop;
      return Value;
   end Natural_At;

   function Natural_After (Text, Prefix : String) return Natural is
      Pos : constant Natural := Find_Text (Text, Prefix);
   begin
      if Pos = 0 then
         return 0;
      else
         return Natural_At (Text, Pos + Prefix'Length);
      end if;
   end Natural_After;

   function Humanize_Token (Value : String) return String is
      Item : constant String := Clean (Value);
      Result : Unbounded_String;
      Previous_Was_Space : Boolean := True;
   begin
      for Index in Item'Range loop
         declare
            C : constant Character := Item (Index);
            Next_Is_Lower : constant Boolean :=
              Index < Item'Last and then Is_Lower (Item (Index + 1));
            Prev_Is_Lower_Or_Digit : constant Boolean :=
              Index > Item'First
              and then (Is_Lower (Item (Index - 1))
                        or else Is_Digit (Item (Index - 1)));
         begin
            if C = '_' or else C = '-' or else C = '.' or else C = '/' then
               if not Previous_Was_Space then
                  Append (Result, ' ');
                  Previous_Was_Space := True;
               end if;
            elsif Is_Upper (C) then
               if (Prev_Is_Lower_Or_Digit or else Next_Is_Lower)
                 and then not Previous_Was_Space
               then
                  Append (Result, ' ');
               end if;
               Append (Result,
                 Character'Val
                   (Character'Pos (C) - Character'Pos ('A')
                    + Character'Pos ('a')));
               Previous_Was_Space := False;
            elsif Is_Lower (C) or else Is_Digit (C) then
               Append (Result, C);
               Previous_Was_Space := False;
            else
               if not Previous_Was_Space then
                  Append (Result, ' ');
                  Previous_Was_Space := True;
               end if;
            end if;
         end;
      end loop;
      return Clean (To_String (Result));
   end Humanize_Token;

   function Strip_Affixes
     (Value, Strip_Prefix, Strip_Suffix : String)
      return String
   is
      Item : constant String := Clean (Value);
      First : Natural := Item'First;
      Last  : Natural := Item'Last;
   begin
      if Item'Length = 0 then
         return "";
      end if;

      if Strip_Prefix'Length > 0
        and then Item'Length >= Strip_Prefix'Length
        and then Item (Item'First .. Item'First + Strip_Prefix'Length - 1)
          = Strip_Prefix
      then
         First := First + Strip_Prefix'Length;
      end if;

      if Strip_Suffix'Length > 0
        and then Last - First + 1 >= Strip_Suffix'Length
        and then Item (Last - Strip_Suffix'Length + 1 .. Last) = Strip_Suffix
      then
         Last := Last - Strip_Suffix'Length;
      end if;

      if Last < First then
         return "";
      else
         return Item (First .. Last);
      end if;
   end Strip_Affixes;

   function Time_Zone_Label
     (Kind           : Time_Zone_Kind;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant String := Clean (Name);
      Base : Unbounded_String;
   begin
      case Kind is
         when UTC_Zone =>
            Base := To_Unbounded_String ("time zone: UTC");
         when Offset_Zone =>
            Base := To_Unbounded_String
              ("time zone: " & Offset_Label (Offset_Minutes));
         when Named_Zone =>
            if Clean_Name'Length = 0 then
               return Invalid_Text ("invalid time zone name");
            end if;
            Base := To_Unbounded_String
              ("time zone: " & Clean_Name & " (" & Offset_Label (Offset_Minutes)
               & ")");
         when Local_Zone =>
            Base := To_Unbounded_String ("time zone: local time");
         when Unknown_Zone =>
            Base := To_Unbounded_String ("time zone: unknown zone");
      end case;

      if Has_DST then
         Append (Base, ", observes daylight saving");
      end if;
      return Ok_Text (To_String (Base));
   end Time_Zone_Label;

   function Zoned_Time_Label
     (Local_Time     : String;
      Zone_Name      : String;
      Offset_Minutes : Integer;
      Ambiguous      : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Time : constant String := Clean (Local_Time);
      Zone : constant String := Clean (Zone_Name);
   begin
      if Time'Length = 0 then
         return Invalid_Text ("invalid local time");
      elsif Zone'Length = 0 then
         return Ok_Text ("zoned time: " & Time & " " & Offset_Label (Offset_Minutes)
            & (if Ambiguous then ", ambiguous local time" else ""));
      else
         return Ok_Text ("zoned time: " & Time & " " & Zone & " ("
            & Offset_Label (Offset_Minutes) & ")"
            & (if Ambiguous then ", ambiguous local time" else ""));
      end if;
   end Zoned_Time_Label;

   function Resolve_Time_Zone_Label
     (Name       : String;
      Local_Time : String;
      Resolution : Time_Zone_Resolution)
      return Humanize.Status.Text_Result
   is
      Zone : constant String := Clean (Name);
      Time : constant String := Clean (Local_Time);
      Result : Unbounded_String;
   begin
      if Zone'Length = 0 then
         return Invalid_Text ("invalid time zone name");
      elsif Time'Length = 0 then
         return Invalid_Text ("invalid local time");
      end if;

      Result := To_Unbounded_String
        ("time zone resolution: " & Time & " " & Zone & " => "
         & Offset_Label (Resolution.Offset_Minutes));
      if Resolution.Ambiguous then
         Append (Result, ", ambiguous local time");
      end if;
      if Resolution.Skipped then
         Append (Result, ", skipped local time");
      end if;
      if Resolution.Has_DST then
         Append (Result, ", daylight saving");
      end if;
      return Ok_Text (To_String (Result));
   end Resolve_Time_Zone_Label;

   function Time_Zone_Resolution_Label
     (Name       : String;
      Resolution : Time_Zone_Resolution)
      return Humanize.Status.Text_Result
   is
      Zone : constant String := Clean (Name);
   begin
      if Zone'Length = 0 then
         return Invalid_Text ("invalid time zone name");
      end if;
      return Ok_Text ("time zone metadata " & Zone & ": offset="
         & Offset_Label (Resolution.Offset_Minutes)
         & " ambiguous=" & Bool_Text (Resolution.Ambiguous)
         & " skipped=" & Bool_Text (Resolution.Skipped)
         & " dst=" & Bool_Text (Resolution.Has_DST));
   end Time_Zone_Resolution_Label;

   function Identifier_Label
     (Kind           : Identifier_Kind;
      Value          : String;
      Visible_Prefix : Natural := 6;
      Visible_Suffix : Natural := 4)
      return Humanize.Status.Text_Result
   is
   begin
      if Clean (Value)'Length = 0 then
         return Invalid_Text ("invalid identifier");
      end if;
      return Ok_Text ("identifier " & Identifier_Kind_Text (Kind) & ": "
         & Shorten (Value, Visible_Prefix, Visible_Suffix));
   end Identifier_Label;

   function Identifier_Kind_Of
     (Value : String)
      return Identifier_Classification
   is
      Item : constant String := Clean (Value);
      Alnum : constant Natural := Alpha_Num_Count (Item);
      Hexes : constant Natural := Hex_Count (Item);
      Dashes : Natural := 0;
      Upper_Alnum : Boolean := True;
   begin
      for C of Item loop
         if C = '-' then
            Dashes := Dashes + 1;
         elsif Is_Lower (C) then
            Upper_Alnum := False;
         end if;
      end loop;

      if Item'Length = 36 and then Dashes = 4 and then Hexes = 32 then
         return (UUID_Identifier, True, 122);
      elsif Item'Length = 26 and then Alnum = 26 and then Upper_Alnum then
         return (ULID_Identifier, True, 128);
      elsif (Item'Length in 7 .. 40) and then Hexes = Item'Length then
         return (Commit_Identifier, True, Natural'Min (160, Item'Length * 4));
      elsif Starts_With_CI (Item, "sha256:")
        or else Starts_With_CI (Item, "sha1:")
        or else (Item'Length in 32 | 40 | 64 and then Hexes = Item'Length)
      then
         return (Checksum_Identifier, True, Natural'Min (256, Hexes * 4));
      elsif Contains_CI (Item, "-") and then Digit_Count (Item) > 0 then
         return (Ticket_Identifier, True, 32);
      elsif Item'Length >= 12 and then Alnum >= Item'Length - 2 then
         return (Trace_Identifier, True, Natural'Min (128, Alnum * 4));
      elsif Item'Length > 0 then
         return (Opaque_Identifier, True, Natural'Min (64, Alnum * 4));
      else
         return (Opaque_Identifier, False, 0);
      end if;
   end Identifier_Kind_Of;

   function Auto_Identifier_Label
     (Value : String)
      return Humanize.Status.Text_Result
   is
      Classified : constant Identifier_Classification := Identifier_Kind_Of (Value);
   begin
      if not Classified.Valid_Shape then
         return Invalid_Text ("invalid identifier");
      end if;
      return Identifier_Label (Classified.Kind, Value);
   end Auto_Identifier_Label;

   function Contact_Label
     (Kind           : Contact_Kind;
      Value          : String;
      Preserve_Domain : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Clean (Value);
      At_Pos : Natural := 0;
   begin
      if Item'Length = 0 then
         return Invalid_Text ("invalid contact");
      end if;

      if Kind = Email_Contact and then Preserve_Domain then
         for Index in Item'Range loop
            if Item (Index) = '@' then
               At_Pos := Index;
               exit;
            end if;
         end loop;
         if At_Pos /= 0 and then At_Pos < Item'Last then
            return Ok_Text ("contact email: hidden@" & Item (At_Pos + 1 .. Item'Last));
         end if;
      end if;

      return Ok_Text ("contact " & Contact_Kind_Text (Kind) & ": "
         & Shorten (Item, 0, Natural'Min (4, Item'Length)));
   end Contact_Label;

   function Contact_Profile_Of
     (Value : String)
      return Contact_Profile
   is
      Item : constant String := Clean (Value);
      Digit_Total : constant Natural := Digit_Count (Item);
      Has_At : constant Boolean := Find_Text (Item, "@") /= 0;
      Has_Dot : constant Boolean := Find_Text (Item, ".") /= 0;
   begin
      if Item'Length = 0 then
         return (Unknown_Contact, False, False, True, 0);
      elsif Has_At and then Has_Dot then
         return (Email_Contact, True, True, True, 0);
      elsif Digit_Total >= 7 then
         return (Phone_Contact, True, False, True, Natural'Min (4, Digit_Total));
      elsif Contains_CI (Item, " street") or else Contains_CI (Item, " road")
        or else Contains_CI (Item, " ave") or else Contains_CI (Item, ",")
      then
         return (Address_Contact, True, False, True, 0);
      else
         return (Unknown_Contact, True, False, True, 0);
      end if;
   end Contact_Profile_Of;

   function Auto_Contact_Label
     (Value : String)
      return Humanize.Status.Text_Result
   is
      Profile : constant Contact_Profile := Contact_Profile_Of (Value);
   begin
      if not Profile.Valid_Shape then
         return Invalid_Text ("invalid contact");
      end if;
      return Contact_Label (Profile.Kind, Value);
   end Auto_Contact_Label;

   function Product_Code_Kind_Of
     (Value : String)
      return Product_Code_Kind
   is
      Item : constant String := Clean (Value);
      Digit_Total : constant Natural := Digit_Count (Item);
   begin
      if Starts_With_CI (Item, "isbn-10") or else Starts_With_CI (Item, "isbn10") then
         return ISBN_10_Code;
      elsif Starts_With_CI (Item, "isbn-13") or else Starts_With_CI (Item, "isbn13") then
         return ISBN_13_Code;
      elsif Digit_Total = 10 and then Contains_CI (Item, "isbn") then
         return ISBN_10_Code;
      elsif Digit_Total = 13 and then Contains_CI (Item, "isbn") then
         return ISBN_13_Code;
      elsif Digit_Total = 13 then
         return EAN_13_Code;
      elsif Digit_Total = 12 then
         return UPC_A_Code;
      elsif Contains_CI (Item, "-") and then Alpha_Num_Count (Item) >= 4 then
         return SKU_Code;
      elsif Digit_Total >= 8 then
         return Barcode_Code;
      else
         return Unknown_Product_Code;
      end if;
   end Product_Code_Kind_Of;

   function Product_Code_Label
     (Value : String;
      Kind  : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Clean (Value);
      Actual : constant Product_Code_Kind :=
        (if Kind = Unknown_Product_Code then Product_Code_Kind_Of (Item)
         else Kind);
   begin
      if Item'Length = 0 then
         return Invalid_Text ("invalid product code");
      end if;
      return Ok_Text ("product code " & Product_Code_Kind_Text (Actual) & ": "
         & Shorten (Item, 6, 4) & ", " & Checksum_State_Text (Checksum));
   end Product_Code_Label;

   function Only_Digits (Text : String) return String is
      Result : Unbounded_String;
   begin
      for C of Text loop
         if Is_Digit (C) then
            Append (Result, C);
         end if;
      end loop;
      return To_String (Result);
   end Only_Digits;

   function Product_Code_Checksum
     (Value : String;
      Kind  : Product_Code_Kind := Unknown_Product_Code)
      return Checksum_State
      is separate;

   function Machine_Checksum_Kind_Text
     (Kind : Machine_Checksum_Kind)
      return String
   is
   begin
      case Kind is
         when Luhn_Checksum    => return "Luhn";
         when IBAN_Checksum    => return "IBAN";
         when ISIN_Checksum    => return "ISIN";
         when VIN_Checksum     => return "VIN";
         when Unknown_Checksum => return "unknown";
      end case;
   end Machine_Checksum_Kind_Text;

   function Upper_ASCII (C : Character) return Character is
   begin
      if Is_Lower (C) then
         return Character'Val (Character'Pos (C) - 32);
      else
         return C;
      end if;
   end Upper_ASCII;

   function Alnum_Upper (Text : String) return String is
      Result : Unbounded_String;
   begin
      for C of Text loop
         if Is_ASCII_Alphanumeric (C) then
            Append (Result, Upper_ASCII (C));
         end if;
      end loop;
      return To_String (Result);
   end Alnum_Upper;

   function Luhn_Digits_Checksum (Digit_Text : String) return Checksum_State is
      Sum : Natural := 0;
      Double : Boolean := False;
   begin
      if Digit_Text'Length < 2 then
         return Checksum_Missing;
      end if;

      for Index in reverse Digit_Text'Range loop
         declare
            Value : Natural := Natural'Value (Digit_Text (Index .. Index));
         begin
            if Double then
               Value := Value * 2;
               if Value > 9 then
                  Value := Value - 9;
               end if;
            end if;
            Sum := Sum + Value;
            Double := not Double;
         end;
      end loop;

      if Sum mod 10 = 0 then
         return Checksum_Valid;
      else
         return Checksum_Mismatch;
      end if;
   exception
      when others =>
         return Checksum_Mismatch;
   end Luhn_Digits_Checksum;

   function Expanded_Alnum_Digits (Text : String) return String is
      Result : Unbounded_String;
   begin
      for C of Text loop
         if Is_Digit (C) then
            Append (Result, C);
         elsif Is_Upper (C) then
            Append (Result, Image (Character'Pos (C) - Character'Pos ('A') + 10));
         end if;
      end loop;
      return To_String (Result);
   end Expanded_Alnum_Digits;

   function Mod_97 (Digit_Text : String) return Natural is
      Remainder : Natural := 0;
   begin
      for C of Digit_Text loop
         if not Is_Digit (C) then
            return 98;
         end if;
         Remainder :=
           (Remainder * 10 + Natural'Value (String'(1 => C))) mod 97;
      end loop;
      return Remainder;
   end Mod_97;

   function VIN_Value (C : Character) return Natural is
   begin
      if Is_Digit (C) then
         return Natural'Value (String'(1 => C));
      end if;
      case C is
         when 'A' | 'J' => return 1;
         when 'B' | 'K' | 'S' => return 2;
         when 'C' | 'L' | 'T' => return 3;
         when 'D' | 'M' | 'U' => return 4;
         when 'E' | 'N' | 'V' => return 5;
         when 'F' | 'W' => return 6;
         when 'G' | 'P' | 'X' => return 7;
         when 'H' | 'Y' => return 8;
         when 'R' | 'Z' => return 9;
         when others => return 99;
      end case;
   end VIN_Value;

   function VIN_Checksum_State (Item : String) return Checksum_State is
      Weights : constant array (Positive range 1 .. 17) of Natural :=
        [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];
      Sum : Natural := 0;
      Value : Natural;
      Check : Natural;
      Expected : Character;
   begin
      if Item'Length /= 17 then
         return Checksum_Missing;
      end if;
      for Offset in 0 .. 16 loop
         Value := VIN_Value (Item (Item'First + Offset));
         if Value > 9 then
            return Checksum_Mismatch;
         end if;
         Sum := Sum + Value * Weights (Offset + 1);
      end loop;
      Check := Sum mod 11;
      Expected := (if Check = 10 then 'X' else Character'Val (Character'Pos ('0') + Check));
      if Item (Item'First + 8) = Expected then
         return Checksum_Valid;
      else
         return Checksum_Mismatch;
      end if;
   end VIN_Checksum_State;

   function Machine_Checksum
     (Value : String;
      Kind  : Machine_Checksum_Kind)
      return Checksum_State
      is separate;

   function Machine_Checksum_Label
     (Value : String;
      Kind  : Machine_Checksum_Kind)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Clean (Value);
   begin
      if Item'Length = 0 then
         return Invalid_Text ("invalid machine checksum");
      end if;

      return Ok_Text ("machine checksum " & Machine_Checksum_Kind_Text (Kind) & ": "
         & Shorten (Item, 6, 4) & ", "
         & Checksum_State_Text (Machine_Checksum (Item, Kind)));
   end Machine_Checksum_Label;

   function Product_Code_Kind_From_Text (Text : String) return Product_Code_Kind is
   begin
      if Contains_CI (Text, "ISBN-10") then
         return ISBN_10_Code;
      elsif Contains_CI (Text, "ISBN-13") then
         return ISBN_13_Code;
      elsif Contains_CI (Text, "EAN-13") then
         return EAN_13_Code;
      elsif Contains_CI (Text, "UPC-A") then
         return UPC_A_Code;
      elsif Contains_CI (Text, "SKU") then
         return SKU_Code;
      elsif Contains_CI (Text, "barcode") then
         return Barcode_Code;
      else
         return Unknown_Product_Code;
      end if;
   end Product_Code_Kind_From_Text;

   function Checksum_State_From_Text (Text : String) return Checksum_State is
   begin
      if Contains_CI (Text, "checksum valid") then
         return Checksum_Valid;
      elsif Contains_CI (Text, "checksum mismatch") then
         return Checksum_Mismatch;
      elsif Contains_CI (Text, "checksum missing") then
         return Checksum_Missing;
      else
         return Checksum_Not_Checked;
      end if;
   end Checksum_State_From_Text;

   function Parse_Product_Code_Label
     (Text : String)
      return Product_Code_Parse_Result
   is
      Item : constant String := Clean (Text);
      Marker : constant String := "product code ";
      Colon : constant Natural := Find_Text (Item, ": ");
      Comma : constant Natural := Find_Text (Item, ", ");
      Result : Product_Code_Parse_Result;
   begin
      if not Starts_With_CI (Item, Marker) or else Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Kind := Product_Code_Kind_From_Text (Item (Marker'Length + 1 .. Colon - 1));
      Result.Checksum := Checksum_State_From_Text (Item);
      Result.Value_First := Colon + 2;
      Result.Value_Length :=
        (if Comma = 0 then Item'Last - Result.Value_First + 1
         else Comma - Result.Value_First);
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Product_Code_Label;

   function Scan_Product_Code_Label
     (Text : String)
      return Product_Code_Parse_Result
   is
   begin
      return Parse_Product_Code_Label (Line_Text (Text));
   end Scan_Product_Code_Label;

   function Progress_Label
     (Subject : String;
      Done    : Natural;
      Total   : Natural;
      State   : Progress_State := Progress_Running)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Subject);
      Percent : constant Natural :=
        (if Total = 0 then 0 else Natural'Min (100, Done * 100 / Total));
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid progress subject");
      elsif Total = 0 then
         return Ok_Text ("progress " & Name & ": " & Image (Done) & " complete, "
            & Progress_State_Text (State));
      else
         return Ok_Text ("progress " & Name & ": " & Image (Done) & " of " & Image (Total)
            & " complete (" & Image (Percent) & "%), "
            & Progress_State_Text (State));
      end if;
   end Progress_Label;

   function Progress_Bar_Label
     (Done  : Natural;
      Total : Natural;
      Width : Positive := 10)
      return Humanize.Status.Text_Result
   is
      Filled : constant Natural :=
        (if Total = 0 then 0 else Natural'Min (Width, Done * Width / Total));
      Percent : constant Natural :=
        (if Total = 0 then 0 else Natural'Min (100, Done * 100 / Total));
      Result : String (1 .. Width);
   begin
      for Index in Result'Range loop
         Result (Index) := (if Index <= Filled then '#' else '-');
      end loop;
      return Ok_Text ("progress bar: [" & Result & "] " & Image (Percent) & "%");
   end Progress_Bar_Label;

   function Collection_Summary_Label
     (Name       : String;
      Total      : Natural;
      Unique     : Natural := 0;
      Duplicates : Natural := 0;
      Outliers   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid collection name");
      end if;
      return Ok_Text ("collection " & Label & ": " & Count_Text (Total, "item", "items")
         & ", " & Count_Text (Unique, "unique value", "unique values")
         & ", " & Count_Text (Duplicates, "duplicate", "duplicates")
         & ", " & Count_Text (Outliers, "outlier", "outliers"));
   end Collection_Summary_Label;

   function Top_Frequency_Label
     (Name  : String;
      Value : String;
      Count : Natural)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
      Item  : constant String := Clean (Value);
   begin
      if Label'Length = 0 or else Item'Length = 0 then
         return Invalid_Text ("invalid top frequency");
      end if;
      return Ok_Text ("top " & Label & ": " & Item & " (" & Count_Text (Count, "time",
         "times") & ")");
   end Top_Frequency_Label;

   function Enum_Label
     (Value        : String;
      Strip_Prefix : String := "";
      Strip_Suffix : String := "")
      return Humanize.Status.Text_Result
   is
      Stripped : constant String := Strip_Affixes (Value, Strip_Prefix,
                                                  Strip_Suffix);
      Rendered : constant String := Humanize_Token (Stripped);
   begin
      if Rendered'Length = 0 then
         return Invalid_Text ("invalid enum value");
      end if;
      return Ok_Text ("enum: " & Rendered);
   end Enum_Label;

   function Structured_Diff_Label
     (Path       : String;
      Old_Value  : String := "";
      New_Value  : String := "";
      Redacted   : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean (Path);
      Old_Text : constant String := Clean (Old_Value);
      New_Text : constant String := Clean (New_Value);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid diff path");
      elsif Redacted then
         return Ok_Text ("diff " & Field & ": changed; values redacted");
      elsif Old_Text'Length = 0 and then New_Text'Length = 0 then
         return Ok_Text ("diff " & Field & ": unchanged");
      elsif Old_Text'Length = 0 then
         return Ok_Text ("diff " & Field & ": added " & New_Text);
      elsif New_Text'Length = 0 then
         return Ok_Text ("diff " & Field & ": removed " & Old_Text);
      else
         return Ok_Text ("diff " & Field & ": changed from " & Old_Text & " to "
            & New_Text);
      end if;
   end Structured_Diff_Label;

   function Validation_Problem_Label
     (Field   : String;
      Kind    : Validation_Problem_Kind;
      Detail  : String := "")
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Field);
      Info : constant String := Clean (Detail);
      Problem : constant String :=
        (case Kind is
           when Required_Problem   => "is required",
           when Minimum_Problem    => "is below minimum",
           when Maximum_Problem    => "is above maximum",
           when Range_Problem      => "is outside range",
           when Pattern_Problem    => "does not match pattern",
           when Choice_Problem     => "must be one of the allowed choices",
           when Dependency_Problem => "depends on another field",
           when Custom_Problem     => "is invalid");
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid validation field");
      elsif Info'Length = 0 then
         return Ok_Text ("validation " & Name & ": " & Problem);
      else
         return Ok_Text ("validation " & Name & ": " & Problem & " (" & Info & ")");
      end if;
   end Validation_Problem_Label;

   function Validation_Constraint_Label
     (Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Actual   : String := "")
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Field);
      Expected : constant String := Clean (Value);
      Got : constant String := Clean (Actual);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid validation field");
      elsif Expected'Length = 0 then
         return Invalid_Text ("invalid validation constraint");
      elsif Got'Length = 0 then
         return Ok_Text ("validation " & Name & ": " & Validation_Relation_Text (Relation)
            & " " & Expected);
      else
         return Ok_Text ("validation " & Name & ": " & Validation_Relation_Text (Relation)
            & " " & Expected & ", got " & Got);
      end if;
   end Validation_Constraint_Label;

   function Validation_Choice_Label
     (Field   : String;
      Choices : String;
      Actual  : String := "")
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Field);
      Allowed : constant String := Clean (Choices);
      Got : constant String := Clean (Actual);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid validation field");
      elsif Allowed'Length = 0 then
         return Invalid_Text ("invalid validation choices");
      elsif Got'Length = 0 then
         return Ok_Text ("validation " & Name & ": allowed values " & Allowed);
      else
         return Ok_Text ("validation " & Name & ": allowed values " & Allowed & ", got "
            & Got);
      end if;
   end Validation_Choice_Label;

   function Validation_Result_Label
     (Summary : Validation_Result_Summary)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("validation result: " & Count_Text (Summary.Fields, "field", "fields")
         & ", " & Count_Text (Summary.Errors, "error", "errors")
         & ", " & Count_Text (Summary.Warnings, "warning", "warnings")
         & ", " & Count_Text (Summary.Required, "required field",
                              "required fields")
         & ", " & Count_Text (Summary.Hidden, "hidden problem",
                              "hidden problems"));
   end Validation_Result_Label;

   function Relation_From_Text (Text : String) return Validation_Relation is
   begin
      if Contains_CI (Text, "must be at least") then
         return Greater_Or_Equal;
      elsif Contains_CI (Text, "must be greater than") then
         return Greater_Than;
      elsif Contains_CI (Text, "must be at most") then
         return Less_Or_Equal;
      elsif Contains_CI (Text, "must be less than") then
         return Less_Than;
      elsif Contains_CI (Text, "must equal") then
         return Equal_To;
      elsif Contains_CI (Text, "must not equal") then
         return Not_Equal_To;
      elsif Contains_CI (Text, "must be before") then
         return Before_Field;
      elsif Contains_CI (Text, "must be after") then
         return After_Field;
      else
         return No_Relation;
      end if;
   end Relation_From_Text;

   function Parse_Validation_Constraint_Label
     (Text : String)
      return Validation_Constraint_Parse_Result
   is
      Item : constant String := Clean (Text);
      Prefix : constant String := "validation ";
      Colon : constant Natural := Find_Text (Item, ": ");
      Got : constant Natural := Find_Text (Item, ", got ");
      Result : Validation_Constraint_Parse_Result;
   begin
      if not Starts_With_CI (Item, Prefix) or else Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Relation := Relation_From_Text (Item);
      Result.Field_First := Prefix'Length + 1;
      Result.Field_Length := Colon - Result.Field_First;
      declare
         Constraint_First : constant Natural := Colon + 2;
         Phrase : constant String :=
           Validation_Relation_Text (Result.Relation);
         Phrase_Last : constant Natural :=
           Constraint_First + Phrase'Length - 1;
      begin
         if Phrase_Last <= Item'Last
           and then Item (Constraint_First .. Phrase_Last) = Phrase
           and then Phrase_Last < Item'Last
           and then Item (Phrase_Last + 1) = ' '
         then
            Result.Value_First := Phrase_Last + 2;
         else
            Result.Value_First := Constraint_First;
            while Result.Value_First <= Item'Last
              and then Item (Result.Value_First) /= ' '
            loop
               Result.Value_First := Result.Value_First + 1;
            end loop;
            if Result.Value_First <= Item'Last then
               Result.Value_First := Result.Value_First + 1;
            end if;
         end if;
      end;
      Result.Value_Length :=
        (if Got = 0 then Item'Last - Result.Value_First + 1
         else Got - Result.Value_First);
      if Got /= 0 then
         Result.Actual_First := Got + 6;
         Result.Actual_Length := Item'Last - Result.Actual_First + 1;
      end if;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Validation_Constraint_Label;

   function Scan_Validation_Constraint_Label
     (Text : String)
      return Validation_Constraint_Parse_Result
   is
   begin
      return Parse_Validation_Constraint_Label (Line_Text (Text));
   end Scan_Validation_Constraint_Label;

   function File_Metadata_Label
     (Name     : String;
      Kind     : File_Metadata_Kind;
      Size     : String := "";
      Checksum : String := "")
      return Humanize.Status.Text_Result
   is
      File_Name : constant String := Clean (Name);
      File_Size : constant String := Clean (Size);
      Sum       : constant String := Clean (Checksum);
      Result    : Unbounded_String;
   begin
      if File_Name'Length = 0 then
         return Invalid_Text ("invalid file name");
      end if;
      Result := To_Unbounded_String
        ("file " & File_Name & ": " & File_Kind_Text (Kind));
      if File_Size'Length > 0 then
         Append (Result, ", " & File_Size);
      end if;
      if Sum'Length > 0 then
         Append (Result, ", checksum " & Shorten (Sum, 6, 4));
      end if;
      return Ok_Text (To_String (Result));
   end File_Metadata_Label;

   function File_Metadata_Kind_Of
     (Name         : String;
      Content_Type : String := "";
      Executable   : Boolean := False;
      Checksum     : Checksum_State := Checksum_Not_Checked)
      return File_Metadata_Classification
   is
      File_Name : constant String := Clean (Name);
      Type_Text : constant String := Clean (Content_Type);
      Kind : File_Metadata_Kind := Unknown_File;
      Archive : Boolean := False;
      Compressed : Boolean := False;
      Has_Ext : constant Boolean := Find_Text (File_Name, ".") /= 0;
   begin
      if Ends_With_CI (File_Name, ".tar") or else Ends_With_CI (File_Name, ".zip")
        or else Ends_With_CI (File_Name, ".7z")
      then
         Kind := Archive_File;
         Archive := True;
      elsif Ends_With_CI (File_Name, ".tar.gz") or else Ends_With_CI (File_Name, ".tgz")
        or else Ends_With_CI (File_Name, ".gz") or else Ends_With_CI (File_Name, ".xz")
      then
         Kind := Compressed_File;
         Archive := Contains_CI (File_Name, ".tar");
         Compressed := True;
      elsif Starts_With_CI (Type_Text, "image/")
        or else Ends_With_CI (File_Name, ".png") or else Ends_With_CI (File_Name, ".jpg")
        or else Ends_With_CI (File_Name, ".jpeg") or else Ends_With_CI (File_Name, ".gif")
      then
         Kind := Image_File;
      elsif Executable or else Ends_With_CI (File_Name, ".exe") then
         Kind := Executable_File;
      elsif Ends_With_CI (File_Name, ".sh") or else Ends_With_CI (File_Name, ".py")
        or else Ends_With_CI (File_Name, ".rb")
      then
         Kind := Script_File;
      elsif Ends_With_CI (File_Name, "/") then
         Kind := Directory_File;
      elsif File_Name'Length > 0 then
         Kind := Plain_File;
      end if;

      return
        (Kind              => Kind,
         Has_Extension     => Has_Ext,
         Archive           => Archive,
         Compressed        => Compressed,
         Executable_Hint   => Executable or else Kind = Executable_File,
         Checksum_Verified => Checksum);
   end File_Metadata_Kind_Of;

   function Auto_File_Metadata_Label
     (Name         : String;
      Content_Type : String := "";
      Size         : String := "";
      Executable   : Boolean := False;
      Checksum     : Checksum_State := Checksum_Not_Checked)
      return Humanize.Status.Text_Result
   is
      Classified : constant File_Metadata_Classification :=
        File_Metadata_Kind_Of (Name, Content_Type, Executable, Checksum);
   begin
      return File_Metadata_Label
        (Name, Classified.Kind, Size, Checksum_Value_Text (Checksum));
   end Auto_File_Metadata_Label;

   function File_Signature_Label
     (Name             : String;
      Extension_Kind   : File_Metadata_Kind;
      Signature_Kind   : File_Metadata_Kind)
      return Humanize.Status.Text_Result
   is
      File_Name : constant String := Clean (Name);
   begin
      if File_Name'Length = 0 then
         return Invalid_Text ("invalid file name");
      elsif Extension_Kind = Signature_Kind then
         return Ok_Text ("file signature " & File_Name & ": "
            & File_Kind_Text (Signature_Kind) & " matches extension");
      else
         return Ok_Text ("file signature " & File_Name & ": extension says "
            & File_Kind_Text (Extension_Kind) & ", content looks like "
            & File_Kind_Text (Signature_Kind));
      end if;
   end File_Signature_Label;

   function File_Kind_From_Text (Text : String) return File_Metadata_Kind is
   begin
      if Contains_CI (Text, "compressed file") then
         return Compressed_File;
      elsif Contains_CI (Text, "archive") then
         return Archive_File;
      elsif Contains_CI (Text, "image") then
         return Image_File;
      elsif Contains_CI (Text, "script") then
         return Script_File;
      elsif Contains_CI (Text, "executable") then
         return Executable_File;
      elsif Contains_CI (Text, "directory") then
         return Directory_File;
      elsif Contains_CI (Text, "file") then
         return Plain_File;
      else
         return Unknown_File;
      end if;
   end File_Kind_From_Text;

   function Parse_File_Metadata_Label
     (Text : String)
      return File_Metadata_Parse_Result
   is
      Item : constant String := Clean (Text);
      Prefix : constant String := "file ";
      Colon : constant Natural := Find_Text (Item, ": ");
      Result : File_Metadata_Parse_Result;
   begin
      if not Starts_With_CI (Item, Prefix) or else Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Name_First := Prefix'Length + 1;
      Result.Name_Length := Colon - Result.Name_First;
      Result.Kind := File_Kind_From_Text (Item (Colon + 2 .. Item'Last));
      Result.Checksum := Checksum_State_From_Text (Item);
      Result.Consumed := Item'Length;
      return Result;
   end Parse_File_Metadata_Label;

   function Scan_File_Metadata_Label
     (Text : String)
      return File_Metadata_Parse_Result
   is
   begin
      return Parse_File_Metadata_Label (Line_Text (Text));
   end Scan_File_Metadata_Label;

   function Network_Session_Label
     (Endpoint   : String;
      Event      : Network_Event_Kind;
      Detail     : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result
   is
      Target : constant String := Clean (Endpoint);
      Info   : constant String := Clean (Detail);
      Retry  : constant String := Clean (Retry_After);
      Result : Unbounded_String;
   begin
      if Target'Length = 0 then
         return Invalid_Text ("invalid network endpoint");
      end if;
      Result := To_Unbounded_String
        ("network " & Target & ": " & Network_Event_Text (Event));
      if Info'Length > 0 then
         Append (Result, ", " & Info);
      end if;
      if Retry'Length > 0 then
         Append (Result, ", retry in " & Retry);
      end if;
      return Ok_Text (To_String (Result));
   end Network_Session_Label;

   function Network_Diagnostic_Label
     (Endpoint : String;
      Kind     : Network_Diagnostic_Kind;
      Detail   : String := "";
      Retry_After : String := "")
      return Humanize.Status.Text_Result
   is
      Target : constant String := Clean (Endpoint);
      Info : constant String := Clean (Detail);
      Retry : constant String := Clean (Retry_After);
      Result : Unbounded_String;
   begin
      if Target'Length = 0 then
         return Invalid_Text ("invalid network endpoint");
      end if;
      Result := To_Unbounded_String
        ("network diagnostic " & Target & ": " & Network_Diagnostic_Text (Kind));
      if Info'Length > 0 then
         Append (Result, ", " & Info);
      end if;
      if Retry'Length > 0 then
         Append (Result, ", retry in " & Retry);
      end if;
      return Ok_Text (To_String (Result));
   end Network_Diagnostic_Label;

   function Network_Event_Kind_Of
     (Status_Code : Natural;
      Retrying    : Boolean := False;
      TLS_Failed  : Boolean := False)
      return Network_Event_Kind
   is
   begin
      if TLS_Failed then
         return TLS_Failed_Network;
      elsif Retrying then
         return Retrying_Network;
      elsif Status_Code = 0 then
         return Connecting_Network;
      elsif Status_Code in 200 .. 299 then
         return Complete_Network;
      elsif Status_Code in 300 .. 399 then
         return Redirected_Network;
      elsif Status_Code = 429 then
         return Rate_Limited_Network;
      else
         return Failed_Network;
      end if;
   end Network_Event_Kind_Of;

   function Network_Diagnostic_Kind_Of
     (Detail : String)
      return Network_Diagnostic_Kind
   is
   begin
      if Contains_CI (Detail, "dns") or else Contains_CI (Detail, "nxdomain") then
         return DNS_Diagnostic;
      elsif Contains_CI (Detail, "tls") or else Contains_CI (Detail, "certificate") then
         return TLS_Diagnostic;
      elsif Contains_CI (Detail, "proxy") then
         return Proxy_Diagnostic;
      elsif Contains_CI (Detail, "timeout") or else Contains_CI (Detail, "timed out") then
         return Timeout_Diagnostic;
      elsif Contains_CI (Detail, "reset") then
         return Reset_Diagnostic;
      elsif Contains_CI (Detail, "http") then
         return HTTP_Diagnostic;
      elsif Contains_CI (Detail, "tcp") or else Contains_CI (Detail, "connection") then
         return TCP_Diagnostic;
      else
         return Unknown_Network_Diagnostic;
      end if;
   end Network_Diagnostic_Kind_Of;

   function Diagnostic_From_Text (Text : String) return Network_Diagnostic_Kind is
   begin
      return Network_Diagnostic_Kind_Of (Text);
   end Diagnostic_From_Text;

   function Parse_Network_Diagnostic_Label
     (Text : String)
      return Network_Diagnostic_Parse_Result
   is
      Item : constant String := Clean (Text);
      Prefix : constant String := "network diagnostic ";
      Colon : constant Natural := Find_Text (Item, ": ");
      Comma : constant Natural := Find_Text (Item, ", ");
      Result : Network_Diagnostic_Parse_Result;
   begin
      if not Starts_With_CI (Item, Prefix) or else Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Endpoint_First := Prefix'Length + 1;
      Result.Endpoint_Length := Colon - Result.Endpoint_First;
      Result.Kind := Diagnostic_From_Text (Item (Colon + 2 .. Item'Last));
      if Comma /= 0 then
         Result.Detail_First := Comma + 2;
         Result.Detail_Length := Item'Last - Result.Detail_First + 1;
      end if;
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Network_Diagnostic_Label;

   function Scan_Network_Diagnostic_Label
     (Text : String)
      return Network_Diagnostic_Parse_Result
   is
   begin
      return Parse_Network_Diagnostic_Label (Line_Text (Text));
   end Scan_Network_Diagnostic_Label;

   function Terminal_Column_Label
     (Name      : String;
      Width     : Positive;
      Alignment : Terminal_Alignment := Align_Left)
      return Humanize.Status.Text_Result
   is
      Label : constant String := Clean (Name);
   begin
      if Label'Length = 0 then
         return Invalid_Text ("invalid terminal column");
      end if;
      return Ok_Text ("terminal column " & Label & ": width " & Image (Width) & ", "
         & Alignment_Text (Alignment) & " aligned");
   end Terminal_Column_Label;

   function Terminal_Row_Label
     (Cells     : Natural;
      Width     : Natural;
      Truncated : Boolean := False)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("terminal row: " & Count_Text (Cells, "cell", "cells")
         & ", width " & Image (Width)
         & (if Truncated then ", truncated" else ", complete"));
   end Terminal_Row_Label;

   function Terminal_Table_Layout_Label
     (Columns        : Natural;
      Rows           : Natural;
      Width          : Natural;
      Truncated_Cells : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("terminal table: " & Count_Text (Columns, "column", "columns")
         & ", " & Count_Text (Rows, "row", "rows")
         & ", width " & Image (Width)
         & ", " & Count_Text (Truncated_Cells, "truncated cell",
                              "truncated cells"));
   end Terminal_Table_Layout_Label;

   function Terminal_Table_Render_Label
     (Spec : Terminal_Table_Spec)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("terminal render: " & Count_Text (Spec.Columns, "column", "columns")
         & ", " & Count_Text (Spec.Rows, "row", "rows")
         & ", width " & Image (Spec.Width)
         & ", header=" & Bool_Text (Spec.Header)
         & ", ansi-aware=" & Bool_Text (Spec.ANSI_Aware)
         & ", " & Count_Text (Spec.Wrapped_Cells, "wrapped cell",
                              "wrapped cells")
         & ", " & Count_Text (Spec.Truncated_Cells, "truncated cell",
                              "truncated cells"));
   end Terminal_Table_Render_Label;

   function Metadata_Profile_Label
     (Family  : String;
      Profile : Metadata_Profile)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Family);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid metadata family");
      end if;
      return Ok_Text ("metadata " & Name
         & ": log-safe=" & Bool_Text (Profile.Log_Safe)
         & " privacy-safe=" & Bool_Text (Profile.Privacy_Safe)
         & " parseable=" & Bool_Text (Profile.Parseable)
         & " bounded=" & Bool_Text (Profile.Bounded_Available)
         & " stable=" & Bool_Text (Profile.Stable)
         & " approximate=" & Bool_Text (Profile.Approximate)
         & " lossless=" & Bool_Text (Profile.Lossless));
   end Metadata_Profile_Label;

   function Label_Family_Profile
     (Family : String)
      return Metadata_Profile
   is
      Name : constant String := Clean_Lower (Family);
   begin
      if Contains_CI (Name, "secret") or else Contains_CI (Name, "contact") then
         return
           (Log_Safe => True, Privacy_Safe => True, Parseable => True,
            Bounded_Available => True, Stable => True, Approximate => True,
            Lossless => False);
      elsif Contains_CI (Name, "time zone") or else Contains_CI (Name, "network") then
         return
           (Log_Safe => True, Privacy_Safe => True, Parseable => True,
            Bounded_Available => True, Stable => True, Approximate => True,
            Lossless => False);
      else
         return
           (Log_Safe => True, Privacy_Safe => True, Parseable => True,
            Bounded_Available => True, Stable => True, Approximate => False,
            Lossless => True);
      end if;
   end Label_Family_Profile;

   function Metadata_Coverage_Label
     (Summary : Metadata_Coverage_Summary)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("metadata coverage: " & Image (Summary.Metadata_Families) & " of "
         & Image (Summary.Total_Families) & " families expose metadata, "
         & Image (Summary.Parseable_Families) & " parseable, "
         & Image (Summary.Bounded_Families) & " bounded, "
         & Image (Summary.Privacy_Safe_Families) & " privacy-safe");
   end Metadata_Coverage_Label;

   function Metadata_Coverage
     (Items : Label_Family_Capability_List)
      return Metadata_Coverage_Summary
   is
      Result : Metadata_Coverage_Summary;
   begin
      Result.Total_Families := Items'Length;
      for Item of Items loop
         if Item.Length > 0 then
            Result.Metadata_Families := Result.Metadata_Families + 1;
         end if;
         if Item.Profile.Parseable then
            Result.Parseable_Families := Result.Parseable_Families + 1;
         end if;
         if Item.Profile.Bounded_Available then
            Result.Bounded_Families := Result.Bounded_Families + 1;
         end if;
         if Item.Profile.Privacy_Safe then
            Result.Privacy_Safe_Families := Result.Privacy_Safe_Families + 1;
         end if;
      end loop;
      return Result;
   end Metadata_Coverage;

   function Domain_Metadata_Profile
     (Metadata : Humanize.Domain_Details.Domain_Label_Metadata)
      return Metadata_Profile
   is
      use type Humanize.Domain_Details.Domain_Severity;
   begin
      return
        (Log_Safe          => True,
         Privacy_Safe      =>
           Metadata.Surface /= Humanize.Domain_Details.Secrets_Surface,
         Parseable         => True,
         Bounded_Available => True,
         Stable            => True,
         Approximate       => False,
         Lossless          =>
           Metadata.Severity
             not in Humanize.Domain_Details.Warning_Severity
                  | Humanize.Domain_Details.Danger_Severity);
   end Domain_Metadata_Profile;

   function Enum_State_Metadata_Of
     (Value : String)
      return Enum_State_Metadata
   is
      Name : constant String := Humanize_Token (Value);
      use Humanize.Domain_Details;
   begin
      if Contains_CI (Name, "failed") or else Contains_CI (Name, "error")
        or else Contains_CI (Name, "denied") or else Contains_CI (Name, "locked")
      then
         return
           (Category => Failure_State, Final => True, Actionable => True,
            Severity => Danger_Severity);
      elsif Contains_CI (Name, "warning") or else Contains_CI (Name, "retry")
        or else Contains_CI (Name, "stale")
      then
         return
           (Category => Warning_State, Final => False, Actionable => True,
            Severity => Warning_Severity);
      elsif Contains_CI (Name, "pending") or else Contains_CI (Name, "waiting")
        or else Contains_CI (Name, "processing")
      then
         return
           (Category => Pending_State, Final => False, Actionable => False,
            Severity => Info_Severity);
      elsif Contains_CI (Name, "success") or else Contains_CI (Name, "complete")
        or else Contains_CI (Name, "approved") or else Contains_CI (Name, "active")
      then
         return
           (Category => Success_State, Final => True, Actionable => False,
            Severity => Success_Severity);
      else
         return
           (Category => Neutral_State, Final => False, Actionable => False,
            Severity => Neutral_Severity);
      end if;
   end Enum_State_Metadata_Of;

   function Enum_State_Metadata_Label
     (Value : String)
      return Humanize.Status.Text_Result
   is
      Metadata : constant Enum_State_Metadata := Enum_State_Metadata_Of (Value);
   begin
      return Ok_Text ("enum metadata " & Humanize_Token (Value)
         & ": category=" & Enum_Category_Text (Metadata.Category)
         & " final=" & Bool_Text (Metadata.Final)
         & " actionable=" & Bool_Text (Metadata.Actionable));
   end Enum_State_Metadata_Label;

   function Structured_Diff_Tree_Label
     (Root_Path      : String;
      Changed_Fields : Natural;
      Added_Items    : Natural := 0;
      Removed_Items  : Natural := 0;
      Redacted_Items : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Root : constant String := Clean (Root_Path);
   begin
      if Root'Length = 0 then
         return Invalid_Text ("invalid diff root");
      end if;
      return Ok_Text ("diff tree " & Root & ": "
         & Count_Text (Changed_Fields, "field changed", "fields changed")
         & ", " & Count_Text (Added_Items, "item added", "items added")
         & ", " & Count_Text (Removed_Items, "item removed", "items removed")
         & ", " & Count_Text (Redacted_Items, "redacted change",
                              "redacted changes"));
   end Structured_Diff_Tree_Label;

   function Diff_Node_Label
     (Path : String;
      Kind : Diff_Node_Kind;
      Changes : Natural)
      return Humanize.Status.Text_Result
   is
      Name : constant String := Clean (Path);
   begin
      if Name'Length = 0 then
         return Invalid_Text ("invalid diff node");
      end if;
      return Ok_Text ("diff node " & Name & ": " & Diff_Node_Kind_Text (Kind) & ", "
         & Count_Text (Changes, "change", "changes"));
   end Diff_Node_Label;

   function Diff_Tree_Metadata_Label
     (Summary : Diff_Tree_Summary)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text ("diff metadata: " & Count_Text (Summary.Nodes, "node", "nodes")
         & ", " & Count_Text (Summary.Field_Nodes, "field node", "field nodes")
         & ", " & Count_Text (Summary.Object_Nodes, "object node",
                              "object nodes")
         & ", " & Count_Text (Summary.List_Nodes, "list node", "list nodes")
         & ", " & Count_Text (Summary.Redacted, "redacted node",
                              "redacted nodes"));
   end Diff_Tree_Metadata_Label;

   function Parse_Structured_Diff_Tree_Label
     (Text : String)
      return Diff_Tree_Parse_Result
   is
      Item : constant String := Clean (Text);
      Prefix : constant String := "diff tree ";
      Colon : constant Natural := Find_Text (Item, ": ");
      Result : Diff_Tree_Parse_Result;
   begin
      if not Starts_With_CI (Item, Prefix) or else Colon = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Result.Root_First := Prefix'Length + 1;
      Result.Root_Length := Colon - Result.Root_First;
      Result.Changed := Natural_After (Item, ": ");
      Result.Added := Natural_After (Item, "changed, ");
      Result.Removed := Natural_After (Item, "added, ");
      Result.Redacted := Natural_After (Item, "removed, ");
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Structured_Diff_Tree_Label;

   function Scan_Structured_Diff_Tree_Label
     (Text : String)
      return Diff_Tree_Parse_Result
   is
   begin
      return Parse_Structured_Diff_Tree_Label (Line_Text (Text));
   end Scan_Structured_Diff_Tree_Label;

   function Contact_Field_Label
     (Fields : Contact_Field_Set;
      Missing_Only : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Present : Natural := 0;
      Missing : Natural := 0;

      procedure Count (Value : Boolean) is
      begin
         if Value then
            Present := Present + 1;
         else
            Missing := Missing + 1;
         end if;
      end Count;
   begin
      Count (Fields.Has_Name);
      Count (Fields.Has_Email);
      Count (Fields.Has_Phone);
      Count (Fields.Has_Address);
      Count (Fields.Has_City);
      Count (Fields.Has_Postal_Code);
      Count (Fields.Has_Country);

      if Missing_Only then
         return Ok_Text ("contact fields: " & Count_Text (Missing, "field missing",
                                                    "fields missing"));
      else
         return Ok_Text ("contact fields: " & Count_Text (Present, "field present",
                                             "fields present")
            & ", " & Count_Text (Missing, "field missing", "fields missing"));
      end if;
   end Contact_Field_Label;

   function Parse_Feature_Label
     (Text : String)
      return Feature_Label_Parse_Result
   is
      Item  : constant String := Clean (Text);
      Colon : constant Natural := Find_Text (Item, ": ");
      Result : Feature_Label_Parse_Result;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;

      if Colon = 0 then
         Result.Kind_First := Item'First;
         Result.Kind_Length := Item'Length;
      else
         Result.Kind_First := Item'First;
         Result.Kind_Length := Colon - Item'First;
         Result.Body_First := Colon + 2;
         Result.Body_Length := Item'Last - Result.Body_First + 1;
      end if;

      Result.First_Count := Natural_After (Item, ": ");
      Result.Second_Count := Natural_After (Item, " of ");
      Result.Percent := Natural_After (Item, "(");
      Result.Consumed := Item'Length;
      return Result;
   end Parse_Feature_Label;

   function Scan_Feature_Label
     (Text : String)
      return Feature_Label_Parse_Result
   is
   begin
      return Parse_Feature_Label (Line_Text (Text));
   end Scan_Feature_Label;

   procedure Time_Zone_Label_Into
     (Kind           : Time_Zone_Kind;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Name           : String := "";
      Offset_Minutes : Integer := 0;
      Has_DST        : Boolean := False)
   is
   begin
      Copy_Result
        (Time_Zone_Label (Kind, Name, Offset_Minutes, Has_DST),
         Target, Written, Status);
   end Time_Zone_Label_Into;

   procedure Identifier_Label_Into
     (Kind           : Identifier_Kind;
      Value          : String;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Visible_Prefix : Natural := 6;
      Visible_Suffix : Natural := 4)
   is
   begin
      Copy_Result
        (Identifier_Label (Kind, Value, Visible_Prefix, Visible_Suffix),
         Target, Written, Status);
   end Identifier_Label_Into;

   procedure Progress_Label_Into
     (Subject : String;
      Done    : Natural;
      Total   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      State   : Progress_State := Progress_Running)
   is
   begin
      Copy_Result
        (Progress_Label (Subject, Done, Total, State),
         Target, Written, Status);
   end Progress_Label_Into;

   procedure Metadata_Profile_Label_Into
     (Family  : String;
      Profile : Metadata_Profile;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result
        (Metadata_Profile_Label (Family, Profile), Target, Written, Status);
   end Metadata_Profile_Label_Into;

   procedure Product_Code_Label_Into
     (Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Kind     : Product_Code_Kind := Unknown_Product_Code;
      Checksum : Checksum_State := Checksum_Not_Checked)
   is
   begin
      Copy_Result
        (Product_Code_Label (Value, Kind, Checksum), Target, Written, Status);
   end Product_Code_Label_Into;

   procedure Network_Diagnostic_Label_Into
     (Endpoint : String;
      Kind     : Network_Diagnostic_Kind;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Detail   : String := "";
      Retry_After : String := "")
   is
   begin
      Copy_Result
        (Network_Diagnostic_Label (Endpoint, Kind, Detail, Retry_After),
         Target, Written, Status);
   end Network_Diagnostic_Label_Into;

   procedure Validation_Constraint_Label_Into
     (Field    : String;
      Relation : Validation_Relation;
      Value    : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Actual   : String := "")
   is
   begin
      Copy_Result
        (Validation_Constraint_Label (Field, Relation, Value, Actual),
         Target, Written, Status);
   end Validation_Constraint_Label_Into;

   procedure Terminal_Table_Render_Label_Into
     (Spec    : Terminal_Table_Spec;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Result (Terminal_Table_Render_Label (Spec), Target, Written, Status);
   end Terminal_Table_Render_Label_Into;
end Humanize.Cross_Domain.Support;
