with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Endpoints is
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Is_Digit (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;

   function Digit_Value (Char : Character) return Natural
      renames Humanize.Bounded_Text.Digit_Value;

   function Is_ASCII_Letter (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Letter;

   function Lower (Text : String) return String
      renames Humanize.Bounded_Text.Lower_Text;

   function Upper (Text : String) return String
      renames Humanize.Bounded_Text.Upper_Text;

   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   function Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text (Count : Natural; Singular, Plural : String) return String
      renames Humanize.Bounded_Text.Count_Text;

   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Endpoint_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Endpoint_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Endpoint_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Endpoint_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Endpoint_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Is_Hex (Char : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Hex_Digit;

   function Strip_Brackets (Host : String) return String is
      Item : constant String := Trim (Host);
   begin
      if Item'Length >= 2
        and then Item (Item'First) = '['
        and then Item (Item'Last) = ']'
      then
         return Item (Item'First + 1 .. Item'Last - 1);
      else
         return Item;
      end if;
   end Strip_Brackets;

   function IPv4_Octet_Value
     (Text  : String;
      Value : out Natural)
      return Boolean
   is
      Accum : Natural := 0;
   begin
      if Text'Length = 0 or else Text'Length > 3 then
         return False;
      end if;

      for Char of Text loop
         if not Is_Digit (Char) then
            return False;
         end if;
         Accum := Accum * 10 + Digit_Value (Char);
      end loop;

      if Accum > 255 then
         return False;
      end if;

      Value := Accum;
      return True;
   end IPv4_Octet_Value;

   function Is_IPv4 (Host : String) return Boolean is
      Item  : constant String := Strip_Brackets (Host);
      First : Natural := Item'First;
      Last  : Natural;
      Count : Natural := 0;
      Value : Natural;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      while First <= Item'Last loop
         Last := First;
         while Last <= Item'Last and then Item (Last) /= '.' loop
            Last := Last + 1;
         end loop;
         if not IPv4_Octet_Value (Item (First .. Last - 1), Value) then
            return False;
         end if;
         Count := Count + 1;
         First := Last + 1;
      end loop;

      return Count = 4;
   end Is_IPv4;

   function Is_Private_IPv4 (Host : String) return Boolean is
      Item : constant String := Strip_Brackets (Host);
      First_Dot : Natural := 0;
      Second_Dot : Natural := 0;
      First : Natural;
      Second : Natural;
   begin
      if not Is_IPv4 (Item) then
         return False;
      end if;

      for Index in Item'Range loop
         if Item (Index) = '.' then
            if First_Dot = 0 then
               First_Dot := Index;
            else
               Second_Dot := Index;
               exit;
            end if;
         end if;
      end loop;

      if First_Dot = 0 or else Second_Dot = 0 then
         return False;
      end if;

      First := Natural'Value (Item (Item'First .. First_Dot - 1));
      Second := Natural'Value (Item (First_Dot + 1 .. Second_Dot - 1));

      return First = 10
        or else First = 127
        or else (First = 172 and then Second in 16 .. 31)
        or else (First = 192 and then Second = 168)
        or else (First = 169 and then Second = 254);
   exception
      when Constraint_Error => --  defensive recovery
         return False;
   end Is_Private_IPv4;

   function Is_IPv6 (Host : String) return Boolean is
      Item : constant String := Strip_Brackets (Host);
      Has_Colon : Boolean := False;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      for Char of Item loop
         if Char = ':' then
            Has_Colon := True;
         elsif not Is_Hex (Char) then
            return False;
         end if;
      end loop;

      return Has_Colon;
   end Is_IPv6;

   function Is_Private_IPv6 (Host : String) return Boolean is
      Item : constant String := Lower (Strip_Brackets (Host));
   begin
      return Item = "::1"
        or else (Item'Length >= 2 and then Item (Item'First .. Item'First + 1) = "fc")
        or else (Item'Length >= 2 and then Item (Item'First .. Item'First + 1) = "fd")
        or else (Item'Length >= 4 and then Item (Item'First .. Item'First + 3) = "fe80");
   end Is_Private_IPv6;

   function Is_Domain (Host : String) return Boolean is
      Item : constant String := Strip_Brackets (Host);
      Has_Letter : Boolean := False;
   begin
      if Item'Length = 0 then
         return False;
      end if;

      for Char of Item loop
         if Is_ASCII_Letter (Char) then
            Has_Letter := True;
         elsif Is_Digit (Char) or else Char = '-' or else Char = '.' then
            null;
         else
            return False;
         end if;
      end loop;

      return Has_Letter;
   end Is_Domain;

   function Host_Kind_Of
     (Host : String)
      return Host_Kind
   is
      Item : constant String := Lower (Strip_Brackets (Host));
   begin
      if Item = "" then
         return Unknown_Host;
      elsif Item = "localhost" then
         return Localhost_Host;
      elsif Is_IPv4 (Item) then
         if Is_Private_IPv4 (Item) then
            return Private_Network_Host;
         else
            return IPv4_Host;
         end if;
      elsif Is_IPv6 (Item) then
         if Is_Private_IPv6 (Item) then
            return Private_Network_Host;
         else
            return IPv6_Host;
         end if;
      elsif Is_Domain (Item) then
         return Domain_Host;
      else
         return Unknown_Host;
      end if;
   end Host_Kind_Of;

   function Host_Kind_Label
     (Kind : Host_Kind)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Kind is
            when Domain_Host          => "domain host",
            when IPv4_Host            => "IPv4 address",
            when IPv6_Host            => "IPv6 address",
            when Localhost_Host       => "local host",
            when Private_Network_Host => "private network address",
            when Unknown_Host         => "unknown host");
   end Host_Kind_Label;

   function Kind_Text (Kind : Host_Kind) return String is
   begin
      return Result_Text (Host_Kind_Label (Kind));
   end Kind_Text;

   function Host_Kind_Suffix (Kind : Host_Kind) return String is
   begin
      return Kind_Text (Kind);
   end Host_Kind_Suffix;

   function Endpoint_Suffix (Kind : Host_Kind) return String is
   begin
      return Host_Kind_Suffix (Kind) & " endpoint";
   end Endpoint_Suffix;

   function Host_Kind_Metadata
     (Kind : Host_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Endpoints_Surface, Host_Kind_Suffix (Kind));
   end Host_Kind_Metadata;

   function Host_Label
     (Host : String)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Strip_Brackets (Host);
      Kind  : constant Humanize.Status.Text_Result :=
        Host_Kind_Label (Host_Kind_Of (Clean));
   begin
      if Clean = "" then
         return Ok_Text ("unknown host");
      else
         return Ok_Text (Clean & " " & Result_Text (Kind));
      end if;
   end Host_Label;

   function Host_Label
     (Host    : String;
      Options : Endpoint_Label_Options)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Strip_Brackets (Host);
      Kind  : constant Host_Kind := Host_Kind_Of (Clean);
      Base  : constant Humanize.Status.Text_Result := Host_Label (Host);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Host_Kind_Metadata (Kind), Domain_Options (Options));
   end Host_Label;

   procedure Host_Label_Into
     (Host    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Host_Label (Host);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Host_Label_Into;

   function Endpoint_Label
     (Host   : String;
      Port   : Port_Number := 0;
      Scheme : String := "")
      return Humanize.Status.Text_Result
   is
      Clean_Host : constant String := Strip_Brackets (Host);
      Prefix : constant String :=
        (if Trim (Scheme) = "" then "" else Clean_Lower (Scheme) & " ");
      Port_Text : constant String :=
        (if Port = 0 then "" else ":" & Image (Port));
      Kind : constant Host_Kind := Host_Kind_Of (Clean_Host);
   begin
      if Clean_Host = "" then
         return Ok_Text ("unknown endpoint");
      else
         return Ok_Text
           (Prefix & Clean_Host & Port_Text & " " & Endpoint_Suffix (Kind));
      end if;
   end Endpoint_Label;

   function Endpoint_Label
     (Host    : String;
      Options : Endpoint_Label_Options;
      Port    : Port_Number := 0;
      Scheme  : String := "")
      return Humanize.Status.Text_Result
   is
      Clean_Host : constant String := Strip_Brackets (Host);
      Kind       : constant Host_Kind := Host_Kind_Of (Clean_Host);
      Base       : constant Humanize.Status.Text_Result :=
        Endpoint_Label (Host, Port, Scheme);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Host_Kind_Metadata (Kind), Domain_Options (Options));
   end Endpoint_Label;

   function Parse_Endpoint_Label
     (Text : String;
      Kind : Host_Kind)
      return Endpoint_Label_Parse_Result
   is
      Result : Endpoint_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Endpoints_Surface,
         Endpoint_Suffix (Kind));
      Result.Metadata := Host_Kind_Metadata (Kind);
      return Result;
   end Parse_Endpoint_Label;

   function Scan_Endpoint_Label
     (Text : String;
      Kind : Host_Kind)
      return Endpoint_Label_Parse_Result
   is
      Result : Endpoint_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Endpoints_Surface,
         Endpoint_Suffix (Kind));
      Result.Metadata := Host_Kind_Metadata (Kind);
      return Result;
   end Scan_Endpoint_Label;

   procedure Endpoint_Label_Into
     (Host    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Port    : Port_Number := 0;
      Scheme  : String := "")
   is
      Result : constant Humanize.Status.Text_Result :=
        Endpoint_Label (Host, Port, Scheme);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Endpoint_Label_Into;

   procedure Endpoint_Label_Into
     (Host    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Endpoint_Label_Options;
      Port    : Port_Number := 0;
      Scheme  : String := "")
   is
   begin
      Copy_Result
        (Endpoint_Label (Host, Options, Port, Scheme), Target, Written,
         Status);
   end Endpoint_Label_Into;

   type URL_Parts is record
      Scheme : Unbounded_String;
      Userinfo : Unbounded_String;
      Host : Unbounded_String;
      Port : Unbounded_String;
      Path : Unbounded_String;
      Query : Unbounded_String;
      Fragment : Unbounded_String;
   end record;

   function Parse_URL (URL : String) return URL_Parts is
      Item : constant String := Trim (URL);
      Result : URL_Parts;
      Pos : Natural := Item'First;
      Authority_First : Natural;
      Authority_Last : Natural;
      Path_First : Natural;
   begin
      if Item'Length = 0 then
         return Result;
      end if;

      for Index in Item'Range loop
         if Item (Index) = ':' then
            if Index + 2 <= Item'Last
              and then Item (Index + 1) = '/'
              and then Item (Index + 2) = '/'
            then
               Result.Scheme := To_Unbounded_String (Lower (Item (Item'First .. Index - 1)));
               Pos := Index + 3;
            end if;
            exit;
         elsif Item (Index) = '/' or else Item (Index) = '?' or else Item (Index) = '#' then
            exit;
         end if;
      end loop;

      Authority_First := Pos;
      Authority_Last := Item'Last;
      for Index in Pos .. Item'Last loop
         if Item (Index) = '/' or else Item (Index) = '?' or else Item (Index) = '#' then
            Authority_Last := Index - 1;
            exit;
         end if;
      end loop;

      Path_First := Authority_Last + 1;
      if Authority_First <= Authority_Last then
         declare
            Authority : constant String := Item (Authority_First .. Authority_Last);
            At_Pos : Natural := 0;
            Host_First : Natural;
            Host_Last : Natural;
            Port_Pos : Natural := 0;
         begin
            for Index in Authority'Range loop
               if Authority (Index) = '@' then
                  At_Pos := Index;
               end if;
            end loop;

            if At_Pos /= 0 then
               Result.Userinfo :=
                 To_Unbounded_String (Authority (Authority'First .. At_Pos - 1));
               Host_First := At_Pos + 1;
            else
               Host_First := Authority'First;
            end if;

            Host_Last := Authority'Last;
            if Host_First <= Authority'Last and then Authority (Host_First) = '[' then
               for Index in Host_First .. Authority'Last loop
                  if Authority (Index) = ']' then
                     Host_Last := Index;
                     if Index + 1 <= Authority'Last and then Authority (Index + 1) = ':' then
                        Port_Pos := Index + 1;
                     end if;
                     exit;
                  end if;
               end loop;
            else
               for Index in reverse Host_First .. Authority'Last loop
                  if Authority (Index) = ':' then
                     Port_Pos := Index;
                     Host_Last := Index - 1;
                     exit;
                  end if;
               end loop;
            end if;

            if Host_First <= Host_Last then
               Result.Host := To_Unbounded_String (Authority (Host_First .. Host_Last));
            end if;
            if Port_Pos /= 0 and then Port_Pos + 1 <= Authority'Last then
               Result.Port := To_Unbounded_String (Authority (Port_Pos + 1 .. Authority'Last));
            end if;
         end;
      else
         Path_First := Item'First;
      end if;

      if Path_First <= Item'Last then
         declare
            Path_End : Natural := Item'Last;
            Query_First : Natural := 0;
            Fragment_First : Natural := 0;
         begin
            for Index in Path_First .. Item'Last loop
               if Item (Index) = '?' and then Query_First = 0 and then Fragment_First = 0 then
                  Query_First := Index + 1;
                  Path_End := Index - 1;
               elsif Item (Index) = '#' and then Fragment_First = 0 then
                  Fragment_First := Index + 1;
                  if Query_First = 0 then
                     Path_End := Index - 1;
                  end if;
               end if;
            end loop;

            if Path_First <= Path_End then
               Result.Path := To_Unbounded_String (Item (Path_First .. Path_End));
            end if;
            if Query_First /= 0 then
               declare
                  Query_End : constant Natural :=
                    (if Fragment_First = 0 then Item'Last else Fragment_First - 2);
               begin
                  if Query_First <= Query_End then
                     Result.Query := To_Unbounded_String (Item (Query_First .. Query_End));
                  end if;
               end;
            end if;
            if Fragment_First /= 0 and then Fragment_First <= Item'Last then
               Result.Fragment := To_Unbounded_String (Item (Fragment_First .. Item'Last));
            end if;
         end;
      end if;

      return Result;
   end Parse_URL;

   function Query_Count (Query : String) return Natural is
      Count : Natural := 1;
   begin
      if Query'Length = 0 then
         return 0;
      end if;

      for Char of Query loop
         if Char = '&' or else Char = ';' then
            Count := Count + 1;
         end if;
      end loop;

      return Count;
   end Query_Count;

   function Default_Port
     (Scheme : String;
      Port   : String)
      return Boolean
   is
      Lower_Scheme : constant String := Lower (Scheme);
   begin
      return (Lower_Scheme = "http" and then Port = "80")
        or else (Lower_Scheme = "https" and then Port = "443")
        or else (Lower_Scheme = "ssh" and then Port = "22")
        or else (Lower_Scheme = "postgres" and then Port = "5432")
        or else (Lower_Scheme = "postgresql" and then Port = "5432");
   end Default_Port;

   function URL_Label
     (URL     : String;
      Options : URL_Display_Options := Default_URL_Display_Options)
      return Humanize.Status.Text_Result
   is
      Parts : constant URL_Parts := Parse_URL (URL);
      Scheme : constant String := To_String (Parts.Scheme);
      Userinfo : constant String := To_String (Parts.Userinfo);
      Host : constant String := Strip_Brackets (To_String (Parts.Host));
      Port : constant String := To_String (Parts.Port);
      Path : constant String := To_String (Parts.Path);
      Query : constant String := To_String (Parts.Query);
      Fragment : constant String := To_String (Parts.Fragment);
      Label : Unbounded_String;
   begin
      if Trim (URL) = "" then
         return Ok_Text ("empty URL");
      end if;

      if Options.Include_Scheme and then Scheme /= "" then
         Append (Label, Upper (Scheme) & " ");
      end if;

      if Userinfo /= "" then
         if Options.Redact_Userinfo then
            Append (Label, "[redacted user]@");
         else
            Append (Label, Userinfo & "@");
         end if;
      end if;

      if Host /= "" then
         Append (Label, Host);
      else
         Append (Label, Trim (URL));
      end if;

      if Port /= ""
        and then not (Options.Omit_Default_Port and then Default_Port (Scheme, Port))
      then
         Append (Label, ":" & Port);
      end if;

      if Options.Include_Path and then Path /= "" and then Path /= "/" then
         Append (Label, " " & Path);
      end if;

      if Options.Include_Query_Summary and then Query /= "" then
         declare
            Count : constant Natural := Query_Count (Query);
         begin
            Append
              (Label,
               " query " & Count_Text (Count, "param", "params"));
         end;
      end if;

      if Options.Include_Fragment and then Fragment /= "" then
         Append (Label, " #" & Fragment);
      end if;

      return Ok_Text (To_String (Label));
   end URL_Label;

   procedure URL_Label_Into
     (URL     : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : URL_Display_Options := Default_URL_Display_Options)
   is
      Result : constant Humanize.Status.Text_Result := URL_Label (URL, Options);
   begin
      Copy_Result (Result, Target, Written, Status);
   end URL_Label_Into;

   function Safe_URL_Label
     (URL : String)
      return Humanize.Status.Text_Result
   is
   begin
      return URL_Label
        (URL,
         (Include_Scheme        => True,
          Include_Path          => True,
          Include_Query_Summary => True,
          Include_Fragment      => False,
          Redact_Userinfo       => True,
          Omit_Default_Port     => True));
   end Safe_URL_Label;

   function URL_Component_Summary
     (URL : String)
      return Humanize.Status.Text_Result
   is
      Parts : constant URL_Parts := Parse_URL (URL);
      Scheme : constant String := To_String (Parts.Scheme);
      Host : constant String := To_String (Parts.Host);
      Path : constant String := To_String (Parts.Path);
      Query : constant String := To_String (Parts.Query);
      Fragment : constant String := To_String (Parts.Fragment);
      Count : Natural := 0;
      Summary : Unbounded_String;

      procedure Add (Text : String) is
      begin
         if Length (Summary) > 0 then
            Append (Summary, ", ");
         end if;
         Append (Summary, Text);
      end Add;
   begin
      if Trim (URL) = "" then
         return Ok_Text ("empty URL");
      end if;

      if Scheme /= "" then
         Count := Count + 1;
         Add ("scheme");
      end if;
      if Host /= "" then
         Count := Count + 1;
         Add ("host");
      end if;
      if Path /= "" and then Path /= "/" then
         Count := Count + 1;
         Add ("path");
      end if;
      if Query /= "" then
         Count := Count + 1;
         Add ("query");
      end if;
      if Fragment /= "" then
         Count := Count + 1;
         Add ("fragment");
      end if;

      if Count = 0 then
         return Ok_Text ("URL with no recognized components");
      else
         return Ok_Text
           ("URL with " & Count_Text (Count, "component", "components") & ": "
            & To_String (Summary));
      end if;
   end URL_Component_Summary;

   procedure Safe_URL_Label_Into
     (URL     : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Safe_URL_Label (URL);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Safe_URL_Label_Into;

   function Query_Summary
     (URL : String)
      return Humanize.Status.Text_Result
   is
      Parts : constant URL_Parts := Parse_URL (URL);
      Query : constant String := To_String (Parts.Query);
      Count : constant Natural := Query_Count (Query);
   begin
      return Ok_Text (Count_Or_No_Text (Count, "query param", "query params"));
   end Query_Summary;

   function IP_Address_Label
     (Address : String)
      return Humanize.Status.Text_Result
   is
      Clean : constant String := Strip_Brackets (Address);
      Kind  : constant Host_Kind := Host_Kind_Of (Clean);
   begin
      case Kind is
         when IPv4_Host =>
            return Ok_Text (Clean & " public IPv4 address");
         when IPv6_Host =>
            return Ok_Text (Clean & " public IPv6 address");
         when Private_Network_Host =>
            return Ok_Text (Clean & " private network address");
         when Localhost_Host =>
            return Ok_Text (Clean & " local host");
         when others =>
            return Ok_Text (Clean & " not an IP address");
      end case;
   end IP_Address_Label;

   function CIDR_Label
     (CIDR : String)
      return Humanize.Status.Text_Result
   is
      Item : constant String := Trim (CIDR);
      Slash : Natural := 0;
   begin
      for Index in Item'Range loop
         if Item (Index) = '/' then
            Slash := Index;
            exit;
         end if;
      end loop;

      if Slash = 0 or else Slash = Item'First or else Slash = Item'Last then
         return Ok_Text (Item & " invalid CIDR");
      end if;

      declare
         Address : constant String := Item (Item'First .. Slash - 1);
         Prefix  : constant String := Item (Slash + 1 .. Item'Last);
         Kind    : constant Humanize.Status.Text_Result :=
           Host_Kind_Label (Host_Kind_Of (Address));
      begin
         return Ok_Text
           (Address & "/" & Prefix & " " & Result_Text (Kind)
            & " network prefix " & Prefix);
      end;
   end CIDR_Label;

end Humanize.Endpoints;
