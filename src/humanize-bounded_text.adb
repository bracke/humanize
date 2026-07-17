with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Messages;

package body Humanize.Bounded_Text is
   use type Humanize.Status.Status_Code;

   function Clean (Text : String) return String is
     (Ada.Strings.Fixed.Trim (Text, Ada.Strings.Both));

   function Lower_Text (Text : String) return String is
      Result : String := Text;
   begin
      for Index in Result'Range loop
         if Result (Index) in 'A' .. 'Z' then
            Result (Index) := Character'Val
              (Character'Pos (Result (Index))
               + Character'Pos ('a') - Character'Pos ('A'));
         end if;
      end loop;
      return Result;
   end Lower_Text;

   function Upper_Text (Text : String) return String is
      Result : String := Text;
   begin
      for Index in Result'Range loop
         if Result (Index) in 'a' .. 'z' then
            Result (Index) := Character'Val
              (Character'Pos (Result (Index))
               - Character'Pos ('a') + Character'Pos ('A'));
         end if;
      end loop;
      return Result;
   end Upper_Text;

   function Lower_Char (Item : Character) return Character is
     (Ada.Characters.Handling.To_Lower (Item));

   function Upper_Char (Item : Character) return Character is
     (Ada.Characters.Handling.To_Upper (Item));

   function Clean_Lower_Text (Text : String) return String is
     (Lower_Text (Clean (Text)));

   function Starts_With (Text, Prefix : String) return Boolean is
     (Prefix'Length = 0
      or else (Text'Length >= Prefix'Length
               and then Text (Text'First .. Text'First + Prefix'Length - 1) =
                 Prefix));

   function Ends_With (Text, Suffix : String) return Boolean is
     (Suffix'Length = 0
      or else (Text'Length >= Suffix'Length
               and then Text (Text'Last - Suffix'Length + 1 .. Text'Last) =
                 Suffix));

   function Contains_Text (Text, Pattern : String) return Boolean is
     (Pattern'Length > 0
      and then Text'Length >= Pattern'Length
      and then Ada.Strings.Fixed.Index (Text, Pattern) /= 0);

   function Index_Text (Text, Pattern : String) return Natural is
   begin
      if Pattern'Length = 0 or else Text'Length < Pattern'Length then
         return 0;
      end if;
      return Ada.Strings.Fixed.Index (Text, Pattern);
   end Index_Text;

   function Is_Digit (Item : Character) return Boolean is
     (Item in '0' .. '9');

   function Digit_Value (Item : Character) return Natural is
     (Character'Pos (Item) - Character'Pos ('0'));

   function Is_ASCII_Letter (Item : Character) return Boolean is
     (Is_ASCII_Uppercase (Item) or else Is_ASCII_Lowercase (Item));

   function Is_ASCII_Uppercase (Item : Character) return Boolean is
     (Item in 'A' .. 'Z');

   function Is_ASCII_Lowercase (Item : Character) return Boolean is
     (Item in 'a' .. 'z');

   function Is_ASCII_Alphanumeric (Item : Character) return Boolean is
     (Is_ASCII_Letter (Item) or else Is_Digit (Item));

   function Is_Alphanumeric (Item : Character) return Boolean is
     (Ada.Characters.Handling.Is_Alphanumeric (Item));

   function Is_Hex_Digit (Item : Character) return Boolean is
     (Item in '0' .. '9' or else Item in 'a' .. 'f' or else Item in 'A' .. 'F');

   function Is_Space (Item : Character) return Boolean is
     (Item = ' ' or else Item = ASCII.HT or else Item = ASCII.LF
      or else Item = ASCII.CR);

   function No_Space (Image : String) return String is
     (if Image'Length > 0 and then Image (Image'First) = ' '
      then Image (Image'First + 1 .. Image'Last)
      else Image);

   function Zero_Padded
     (Text  : String;
      Width : Natural)
      return String
   is
   begin
      if Text'Length >= Width then
         return Text;
      end if;
      return [1 .. Width - Text'Length => '0'] & Text;
   end Zero_Padded;

   function Image (Value : Natural) return String is
      Raw : constant String := Natural'Image (Value);
   begin
      return Raw (Raw'First + 1 .. Raw'Last);
   end Image;

   function Padded_Image
     (Value : Natural;
      Width : Natural)
      return String
   is
   begin
      return Zero_Padded (Image (Value), Width);
   end Padded_Image;

   function Signed_Image (Value : Integer) return String is
   begin
      return No_Space (Integer'Image (Value));
   end Signed_Image;

   function Image (Value : Long_Long_Integer) return String is
      Raw : constant String := Long_Long_Integer'Image (Value);
   begin
      return No_Space (Raw);
   end Image;

   function Padded_Image
     (Value : Long_Long_Integer;
      Width : Natural)
      return String
   is
   begin
      return Zero_Padded (Image (Value), Width);
   end Padded_Image;

   function Float_Image (Value : Long_Float) return String is
   begin
      return No_Space (Long_Float'Image (Value));
   end Float_Image;

   function Plural_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Count = 1 then
         return Singular;
      elsif Plural'Length > 0 then
         return Plural;
      else
         return Singular & "s";
      end if;
   end Plural_Text;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      return Image (Count) & " " & Plural_Text (Count, Singular, Plural);
   end Count_Text;

   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Count = 0 then
         return "no " & Plural_Text (0, Singular, Plural);
      else
         return Count_Text (Count, Singular, Plural);
      end if;
   end Count_Or_No_Text;

   function Nonempty_Text
     (Text    : String;
      Message : String)
      return Humanize.Status.Text_Result
   is
      Value : constant String := Clean (Text);
   begin
      if Value'Length = 0 then
         return Invalid_Text (Message);
      else
         return Ok_Text (Value);
      end if;
   end Nonempty_Text;

   function Nonempty_Label_Text
     (Text    : String;
      Message : String;
      Prefix  : String := "";
      Suffix  : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty_Text (Text, Message);
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      else
         return Ok_Text
           (Result_Label_Text (Label, Prefix => Prefix, Suffix => Suffix));
      end if;
   end Nonempty_Label_Text;

   function Nonempty_Detail_Text
     (Text           : String;
      Message        : String;
      Relation       : String;
      Detail         : String;
      Detail_Message : String;
      Suffix         : String := "")
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty_Text (Text, Message);
      Detail_Label : constant Humanize.Status.Text_Result :=
        Nonempty_Text (Detail, Detail_Message);
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif Detail_Label.Status /= Humanize.Status.Ok then
         return Detail_Label;
      else
         return Ok_Text
           (Result_Detail_Text (Label, Relation, Detail_Label, Suffix));
      end if;
   end Nonempty_Detail_Text;

   function Nonempty_Two_Details_Text
     (Text                  : String;
      Message               : String;
      First_Relation        : String;
      First_Detail          : String;
      First_Detail_Message  : String;
      Second_Relation       : String;
      Second_Detail         : String;
      Second_Detail_Message : String)
      return Humanize.Status.Text_Result
   is
      Label : constant Humanize.Status.Text_Result :=
        Nonempty_Text (Text, Message);
      First_Label : constant Humanize.Status.Text_Result :=
        Nonempty_Text (First_Detail, First_Detail_Message);
      Second_Label : constant Humanize.Status.Text_Result :=
        Nonempty_Text (Second_Detail, Second_Detail_Message);
   begin
      if Label.Status /= Humanize.Status.Ok then
         return Label;
      elsif First_Label.Status /= Humanize.Status.Ok then
         return First_Label;
      elsif Second_Label.Status /= Humanize.Status.Ok then
         return Second_Label;
      else
         return Ok_Text
           (Result_Two_Details_Text
              (Label,
               First_Relation,
               First_Label,
               Second_Relation,
               Second_Label));
      end if;
   end Nonempty_Two_Details_Text;

   function Hex_Bytes (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Digit_Value (C);
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
   end Hex_Bytes;

   function UTF8_Code_Point (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end UTF8_Code_Point;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Ok,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Ok_Text;

   function Status_Text
     (Status : Humanize.Status.Status_Code;
      Text   : String)
      return Humanize.Status.Text_Result
   is
   begin
      return
        (Status => Status,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Status_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result is
   begin
      return
        (Status => Humanize.Status.Invalid_Argument,
         Text   => To_Unbounded_String (Text),
         Key    => Humanize.Messages.No_Message);
   end Invalid_Text;

   function Invalid_Value_Text return Humanize.Status.Text_Result is
   begin
      return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Invalid_Value_Text;

   function Result_Text (Result : Humanize.Status.Text_Result) return String is
   begin
      return To_String (Result.Text);
   end Result_Text;

   function Result_Label_Text
     (Result : Humanize.Status.Text_Result;
      Prefix : String := "";
      Suffix : String := "")
      return String
   is
   begin
      return Prefix & Result_Text (Result) & Suffix;
   end Result_Label_Text;

   function Result_Detail_Text
     (Result   : Humanize.Status.Text_Result;
      Relation : String;
      Detail   : Humanize.Status.Text_Result)
      return String
   is
   begin
      return Result_Detail_Text (Result, Relation, Detail, "");
   end Result_Detail_Text;

   function Result_Detail_Text
     (Result   : Humanize.Status.Text_Result;
      Relation : String;
      Detail   : Humanize.Status.Text_Result;
      Suffix   : String)
      return String
   is
   begin
      return Result_Label_Text
        (Result, Suffix => Relation & Result_Text (Detail) & Suffix);
   end Result_Detail_Text;

   function Result_Two_Details_Text
     (Result          : Humanize.Status.Text_Result;
      First_Relation  : String;
      First_Detail    : Humanize.Status.Text_Result;
      Second_Relation : String;
      Second_Detail   : Humanize.Status.Text_Result)
      return String
   is
   begin
      return Result_Detail_Text
        (Result,
         First_Relation,
         First_Detail,
         Second_Relation & Result_Text (Second_Detail));
   end Result_Two_Details_Text;

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Written := 0;
      if Target'First /= 1 then
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

   procedure Copy_Text
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      if Result.Status /= Humanize.Status.Ok then
         Written := 0;
         Status := Result.Status;
      else
         Copy_Text (To_String (Result.Text), Target, Written, Status);
      end if;
   end Copy_Text;

end Humanize.Bounded_Text;
