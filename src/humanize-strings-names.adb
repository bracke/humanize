with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;
with Humanize.Strings.Markup;

package body Humanize.Strings.Names is
   function Is_Alnum (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Alphanumeric;

   function Lower (C : Character) return Character
      renames Humanize.Bounded_Text.Lower_Char;

   function Upper (C : Character) return Character
      renames Humanize.Bounded_Text.Upper_Char;

   function Natural_Text (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Initials
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      New_Word : Boolean := True;
   begin
      for Ch of Text loop
         if Is_Alnum (Ch) then
            if New_Word then
               Append (Result, Upper (Ch));
               New_Word := False;
            end if;
         else
            New_Word := True;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Initials;

   function Possessive
     (Text : String)
      return Humanize.Status.Text_Result is
   begin
      if Text'Length > 0 and then Lower (Text (Text'Last)) = 's' then
         return Ok_Text (Text & "'");
      else
         return Ok_Text (Text & "'s");
      end if;
   end Possessive;

   function Clean_Name
     (Text : String)
      return Humanize.Status.Text_Result
   is
   begin
      return Humanize.Strings.Markup.Normalize_Whitespace (Text);
   end Clean_Name;

   function Person_Initials
     (Text         : String;
      Max_Initials : Initial_Count_Limit := 3)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Result_Text (Clean_Name (Text));
      Result : Unbounded_String;
      New_Word : Boolean := True;
      Count    : Natural := 0;
   begin
      for Ch of Clean loop
         if Is_Alnum (Ch) then
            if New_Word and then (Max_Initials = 0 or else Count < Max_Initials)
            then
               Append (Result, Upper (Ch));
               Count := Count + 1;
            end if;
            New_Word := False;
         else
            New_Word := True;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Person_Initials;

   function Comma_Index (Text : String) return Natural is
   begin
      for Index in Text'Range loop
         if Text (Index) = ',' then
            return Index;
         end if;
      end loop;
      return 0;
   end Comma_Index;

   function First_Token (Text : String) return String is
   begin
      for Index in Text'Range loop
         if Text (Index) = ' ' then
            return Text (Text'First .. Index - 1);
         end if;
      end loop;
      return Text;
   end First_Token;

   function Last_Token (Text : String) return String is
   begin
      for Index in reverse Text'Range loop
         if Text (Index) = ' ' then
            return Text (Index + 1 .. Text'Last);
         end if;
      end loop;
      return Text;
   end Last_Token;

   function Reordered_Name
     (Text  : String;
      Order : Name_Order)
      return String
   is
      Comma : constant Natural := Comma_Index (Text);
   begin
      if Order = Family_Given_Order and then Comma > Text'First then
         declare
            Family : constant String := Text (Text'First .. Comma - 1);
            Given  : constant String :=
              (if Comma < Text'Last then Text (Comma + 1 .. Text'Last) else "");
         begin
            return Result_Text (Clean_Name (Given & " " & Family));
         end;
      else
         return Text;
      end if;
   end Reordered_Name;

   function Name_Part
     (Text    : String;
      Style   : Name_Display_Style;
      Options : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Result_Text (Clean_Name (Text));
      Comma : constant Natural := Comma_Index (Clean);
      Full  : constant String := Reordered_Name (Clean, Options.Order);
   begin
      if Clean'Length = 0 then
         return Ok_Text ("");
      end if;

      case Style is
         when Display_Full_Name =>
            return Ok_Text (Full);
         when Display_Given_Name =>
            if Options.Order = Family_Given_Order and then Comma > 0 then
               return Ok_Text (First_Token
                    (Result_Text
                       (Clean_Name (Clean (Comma + 1 .. Clean'Last)))));
            else
               return Ok_Text (First_Token (Full));
            end if;
         when Display_Family_Name =>
            if Options.Order = Family_Given_Order and then Comma > 0 then
               return Ok_Text (Result_Text
                    (Clean_Name (Clean (Clean'First .. Comma - 1))));
            else
               return Ok_Text (Last_Token (Full));
            end if;
         when Display_Initials =>
            return Person_Initials (Full, Options.Max_Initials);
         when Display_Handle =>
            return Handle_Label (Clean, Options.Preserve_Handle_At);
      end case;
   end Name_Part;

   function Handle_Label
     (Handle      : String;
      Preserve_At : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Result_Text (Clean_Name (Handle));
   begin
      if Clean'Length = 0 then
         return Ok_Text ("");
      elsif Preserve_At then
         if Clean (Clean'First) = '@' then
            return Ok_Text (Clean);
         else
            return Ok_Text ("@" & Clean);
         end if;
      elsif Clean (Clean'First) = '@' then
         if Clean'Length = 1 then
            return Ok_Text ("");
         else
            return Ok_Text (Clean (Clean'First + 1 .. Clean'Last));
         end if;
      else
         return Ok_Text (Clean);
      end if;
   end Handle_Label;

   function Email_Local_Part
     (Email : String)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Result_Text (Clean_Name (Email));
   begin
      for Index in Clean'Range loop
         if Clean (Index) = '@' then
            if Index = Clean'First then
               return Ok_Text ("");
            else
               return Ok_Text (Clean (Clean'First .. Index - 1));
            end if;
         end if;
      end loop;
      return Ok_Text (Clean);
   end Email_Local_Part;

   function Display_Name
     (Name     : String;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
      return Humanize.Status.Text_Result
   is
      Preferred : constant String :=
        (if Options.Style = Display_Handle then ""
         else Result_Text (Name_Part (Name, Options.Style, Options)));
      Handle_Text : constant String :=
        Result_Text (Handle_Label (Handle, Options.Preserve_Handle_At));
      Email_Text : constant String := Result_Text (Email_Local_Part (Email));
      Clean_Fallback : constant String :=
        Result_Text (Clean_Name (Fallback));
   begin
      if Options.Style = Display_Handle and then Handle_Text'Length > 0 then
         return Ok_Text (Handle_Text);
      elsif Preferred'Length > 0 then
         return Ok_Text (Preferred);
      elsif Handle_Text'Length > 0 then
         return Ok_Text (Handle_Text);
      elsif Email_Text'Length > 0 then
         return Ok_Text (Email_Text);
      else
         return Ok_Text (Clean_Fallback);
      end if;
   end Display_Name;

   function Possessive_Name
     (Name     : String;
      Fallback : String := "someone")
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Result_Text (Clean_Name (Name));
   begin
      if Clean'Length = 0 then
         return Possessive (Result_Text (Clean_Name (Fallback)));
      else
         return Possessive (Clean);
      end if;
   end Possessive_Name;

   procedure Append_Person_Separator
     (Result : in out Unbounded_String;
      Index  : Positive;
      Total  : Positive)
   is
   begin
      if Index = 1 then
         null;
      elsif Index = Total then
         Append (Result, " and ");
      else
         Append (Result, ", ");
      end if;
   end Append_Person_Separator;

   function Person_List
     (Names    : Name_List;
      Limit    : Positive := 2;
      Fallback : String := "no one")
      return Humanize.Status.Text_Result
   is
      Clean_Count : Natural := 0;
      Visible     : Natural;
      Hidden      : Natural;
      Written     : Natural := 0;
      Result      : Unbounded_String;
   begin
      for Name of Names loop
         if Result_Text (Clean_Name (To_String (Name)))'Length > 0 then
            Clean_Count := Clean_Count + 1;
         end if;
      end loop;

      if Clean_Count = 0 then
         return Ok_Text (Result_Text (Clean_Name (Fallback)));
      end if;

      Visible := Natural'Min (Clean_Count, Limit);
      Hidden := Clean_Count - Visible;

      for Name of Names loop
         declare
            Clean : constant String :=
              Result_Text (Clean_Name (To_String (Name)));
         begin
            if Clean'Length > 0 and then Written < Visible then
               Written := Written + 1;
               if Hidden > 0 then
                  if Written > 1 then
                     Append (Result, ", ");
                  end if;
               else
                  Append_Person_Separator (Result, Written, Visible);
               end if;
               Append (Result, Clean);
            end if;
         end;
      end loop;

      if Hidden > 0 then
         Append
           (Result,
            " and " & Natural_Text (Hidden)
            & (if Hidden = 1 then " other" else " others"));
      end if;

      return Ok_Text (To_String (Result));
   end Person_List;

   procedure Initials_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Initials (Text), Target, Written, Status);
   end Initials_Into;

   procedure Possessive_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Possessive (Text), Target, Written, Status);
   end Possessive_Into;

   procedure Clean_Name_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Clean_Name (Text), Target, Written, Status);
   end Clean_Name_Into;

   procedure Person_Initials_Into
     (Text         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Max_Initials : Initial_Count_Limit := 3)
   is
   begin
      Copy_Into (Person_Initials (Text, Max_Initials), Target, Written, Status);
   end Person_Initials_Into;

   procedure Name_Part_Into
     (Text    : String;
      Style   : Name_Display_Style;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Person_Name_Options := Default_Person_Name_Options)
   is
   begin
      Copy_Into (Name_Part (Text, Style, Options), Target, Written, Status);
   end Name_Part_Into;

   procedure Handle_Label_Into
     (Handle      : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code;
      Preserve_At : Boolean := True)
   is
   begin
      Copy_Into (Handle_Label (Handle, Preserve_At), Target, Written, Status);
   end Handle_Label_Into;

   procedure Email_Local_Part_Into
     (Email   : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Email_Local_Part (Email), Target, Written, Status);
   end Email_Local_Part_Into;

   procedure Display_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Handle   : String := "";
      Email    : String := "";
      Fallback : String := "Anonymous";
      Options  : Person_Name_Options := Default_Person_Name_Options)
   is
   begin
      Copy_Into
        (Display_Name (Name, Handle, Email, Fallback, Options),
         Target, Written, Status);
   end Display_Name_Into;

   procedure Possessive_Name_Into
     (Name     : String;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Fallback : String := "someone")
   is
   begin
      Copy_Into (Possessive_Name (Name, Fallback), Target, Written, Status);
   end Possessive_Name_Into;

   procedure Person_List_Into
     (Names    : Name_List;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code;
      Limit    : Positive := 2;
      Fallback : String := "no one")
   is
   begin
      Copy_Into (Person_List (Names, Limit, Fallback), Target, Written, Status);
   end Person_List_Into;
end Humanize.Strings.Names;
