with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;

package body Humanize.Strings.Markup is
   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function NL_To_BR
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Ch of Text loop
         if Ch = ASCII.LF then
            Append (Result, "<br/>");
         else
            Append (Result, Ch);
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end NL_To_BR;

   function BR_To_NL
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Index  : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if Index + 3 <= Text'Last
           and then Text (Index .. Index + 3) = "<br>"
         then
            Append (Result, ASCII.LF);
            Index := Index + 4;
         elsif Index + 4 <= Text'Last
           and then Text (Index .. Index + 4) = "<br/>"
         then
            Append (Result, ASCII.LF);
            Index := Index + 5;
         elsif Index + 5 <= Text'Last
           and then Text (Index .. Index + 5) = "<br />"
         then
            Append (Result, ASCII.LF);
            Index := Index + 6;
         else
            Append (Result, Text (Index));
            Index := Index + 1;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end BR_To_NL;

   function Escape_HTML
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
   begin
      for Ch of Text loop
         case Ch is
            when '&' => Append (Result, "&amp;");
            when '<' => Append (Result, "&lt;");
            when '>' => Append (Result, "&gt;");
            when '"' => Append (Result, "&quot;");
            when others => Append (Result, Ch);
         end case;
         if Ch = Character'Val (39) then
            Replace_Slice (Result, Length (Result), Length (Result), "&#39;");
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Escape_HTML;

   function Preserve_Separator
     (Text      : String;
      Separator : Character)
      return Humanize.Status.Text_Result
   is
      Result   : Unbounded_String;
      Last_Sep : Boolean := False;
   begin
      for Ch of Text loop
         if Ch = Separator then
            if Length (Result) > 0 and then not Last_Sep then
               Append (Result, Separator);
            end if;
            Last_Sep := True;
         else
            Append (Result, Ch);
            Last_Sep := False;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Preserve_Separator;

   function Is_ASCII_Space (Ch : Character) return Boolean is
     (Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF
      or else Ch = ASCII.CR);

   function Normalize_Whitespace
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      Need_Space : Boolean := False;
   begin
      for Ch of Text loop
         if Is_ASCII_Space (Ch) then
            Need_Space := Length (Result) > 0;
         else
            if Need_Space then
               Append (Result, " ");
            end if;
            Append (Result, Ch);
            Need_Space := False;
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Normalize_Whitespace;

   function Squish
     (Text : String)
      return Humanize.Status.Text_Result is
   begin
      return Normalize_Whitespace (Text);
   end Squish;

   function Strip_Tags
     (Text : String)
      return Humanize.Status.Text_Result
   is
      Result : Unbounded_String;
      In_Tag : Boolean := False;
   begin
      for Ch of Text loop
         if Ch = '<' then
            In_Tag := True;
         elsif Ch = '>' then
            In_Tag := False;
         elsif not In_Tag then
            Append (Result, Ch);
         end if;
      end loop;
      return Ok_Text (To_String (Result));
   end Strip_Tags;

   procedure NL_To_BR_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (NL_To_BR (Text), Target, Written, Status);
   end NL_To_BR_Into;

   procedure BR_To_NL_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (BR_To_NL (Text), Target, Written, Status);
   end BR_To_NL_Into;

   procedure Escape_HTML_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Escape_HTML (Text), Target, Written, Status);
   end Escape_HTML_Into;

   procedure Preserve_Separator_Into
     (Text      : String;
      Separator : Character;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Preserve_Separator (Text, Separator), Target, Written, Status);
   end Preserve_Separator_Into;

   procedure Normalize_Whitespace_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Normalize_Whitespace (Text), Target, Written, Status);
   end Normalize_Whitespace_Into;

   procedure Squish_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Squish (Text), Target, Written, Status);
   end Squish_Into;

   procedure Strip_Tags_Into
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Strip_Tags (Text), Target, Written, Status);
   end Strip_Tags_Into;
end Humanize.Strings.Markup;
