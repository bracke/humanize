with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Parsing.Support;
with Humanize.Status;

package body Humanize.Parsing.Normalization is
   use Ada.Strings.Unbounded;

   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Text
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Normalize_Native_Digits (Text : String) return String
      renames Humanize.Parsing.Support.Normalize_Native_Digits;

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

   procedure Normalize_Number_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Normalize_Number_Text (Text), Target, Written, Status);
   end Normalize_Number_Text_Into;

   function Normalize_Unit_Text
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Pending_Space : Boolean := False;
   begin
      for Ch of Clean_Lower (Text) loop
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

   procedure Normalize_Unit_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Normalize_Unit_Text (Text), Target, Written, Status);
   end Normalize_Unit_Text_Into;

   function Normalize_List_Text
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Clean_Lower (Text);
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

   procedure Normalize_List_Text_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Text (Normalize_List_Text (Text), Target, Written, Status);
   end Normalize_List_Text_Into;
end Humanize.Parsing.Normalization;
