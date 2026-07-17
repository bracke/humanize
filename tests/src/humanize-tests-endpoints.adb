with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Endpoints;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Endpoints is
   use Humanize.Endpoints;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Hosts (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Endpoint_Detailed_Label : constant Text_Result :=
        Endpoint_Label
          ("api.example.com",
           Endpoint_Label_Options'
             (Mode             => Endpoint_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False),
           Port => 443,
           Scheme => "https");
      Parsed_Endpoint : constant Endpoint_Label_Parse_Result :=
        Parse_Endpoint_Label
          ("https api.example.com:443 domain host endpoint", Domain_Host);
      Scanned_Endpoint : constant Endpoint_Label_Parse_Result :=
        Scan_Endpoint_Label
          ("https api.example.com:443 domain host endpoint trailing",
           Domain_Host);
   begin
      AUnit.Assertions.Assert
        (Host_Kind_Of ("example.com") = Domain_Host
         and then Host_Kind_Of ("localhost") = Localhost_Host
         and then Host_Kind_Of ("198.51.100.10") = IPv4_Host
         and then Host_Kind_Of ("10.0.0.5") = Private_Network_Host
         and then Host_Kind_Of ("[2001:db8::1]") = IPv6_Host
         and then Host_Kind_Of ("fd00::1") = Private_Network_Host
         and then Host_Kind_Of ("bad host!") = Unknown_Host,
         "host kind classification");

      Check (Host_Kind_Label (Private_Network_Host), "private network address", "host kind label");
      Check (Host_Label ("example.com"), "example.com domain host", "domain host label");
      Check (Host_Label ("[::1]"), "::1 private network address", "ipv6 loopback label");
      Check
        (Endpoint_Label ("api.example.com", 443, "https"),
         "https api.example.com:443 domain host endpoint", "endpoint label");
      Check
        (Endpoint_Detailed_Label,
         "[endpoints info] https api.example.com:443 domain host endpoint",
         "endpoint option metadata");
      AUnit.Assertions.Assert
        (Parsed_Endpoint.Status = Ok
         and then Parsed_Endpoint.Metadata.Severity =
           Humanize.Domain_Details.Info_Severity
         and then Parsed_Endpoint.Name_Length = 25,
         "parse endpoint metadata");
      AUnit.Assertions.Assert
        (Scanned_Endpoint.Status = Ok
         and then Scanned_Endpoint.Consumed = 46,
         "scan endpoint prefix");
      Check
        (Endpoint_Label ("localhost", 3000),
         "localhost:3000 local host endpoint", "local endpoint label");
   end Test_Hosts;

   procedure Test_URLs (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Keep_Port : constant URL_Display_Options :=
        (Include_Scheme        => True,
         Include_Path          => True,
         Include_Query_Summary => True,
         Include_Fragment      => True,
         Redact_Userinfo       => False,
         Omit_Default_Port     => False);
   begin
      Check
        (URL_Label ("https://user:secret@example.com:443/a/b?token=abc&debug=1"),
         "HTTPS [redacted user]@example.com /a/b query 2 params",
         "redacted URL label");
      Check
        (URL_Label ("https://user:secret@example.com:443/a/b?token=abc#frag", Keep_Port),
         "HTTPS user:secret@example.com:443 /a/b query 1 param #frag",
         "full URL label");
      Check
        (URL_Label ("http://example.com:80/"),
         "HTTP example.com", "default port and root path elided");
      Check
        (URL_Label ("example.com/path?x=1"),
         "example.com /path query 1 param", "scheme-less URL label");
      Check (Query_Summary ("https://example.com/a?x=1&y=2"), "2 query params", "query summary");
      Check (Query_Summary ("https://example.com/a"), "no query params", "empty query summary");
      Check
        (Safe_URL_Label ("https://ada:secret@example.com/orders?id=1&token=x#private"),
         "HTTPS [redacted user]@example.com /orders query 2 params",
         "safe URL label");
      Check
        (URL_Component_Summary ("https://example.com/orders?id=1#top"),
         "URL with 5 components: scheme, host, path, query, fragment",
         "URL component summary");
   end Test_URLs;

   procedure Test_IP_And_CIDR (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (IP_Address_Label ("198.51.100.10"), "198.51.100.10 public IPv4 address", "public ipv4");
      Check (IP_Address_Label ("192.168.1.10"), "192.168.1.10 private network address", "private ipv4");
      Check (IP_Address_Label ("[2001:db8::1]"), "2001:db8::1 public IPv6 address", "public ipv6");
      Check (IP_Address_Label ("example.com"), "example.com not an IP address", "not ip");
      Check
        (CIDR_Label ("10.0.0.0/8"),
         "10.0.0.0/8 private network address network prefix 8", "private cidr");
      Check
        (CIDR_Label ("2001:db8::/32"),
         "2001:db8::/32 IPv6 address network prefix 32", "ipv6 cidr");
      Check (CIDR_Label ("10.0.0.0"), "10.0.0.0 invalid CIDR", "invalid cidr");
   end Test_IP_And_CIDR;

   procedure Test_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer : String (1 .. 23);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 20);
      Written : Natural;
      Code : Status_Code;
   begin
      Host_Label_Into ("example.com", Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 23 and then Buffer = "example.com domain host",
         "host bounded exact");

      URL_Label_Into ("https://example.com/path", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10 and then Tiny = "HTTPS exam",
         "URL bounded overflow");

      Safe_URL_Label_Into
        ("https://ada:secret@example.com/path?x=1", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10 and then Tiny = "HTTPS [red",
         "safe URL bounded overflow");

      Endpoint_Label_Into ("localhost", Offset, Written, Code, Port => 8080);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "endpoint bounded rejects non-1-based buffer");

      Endpoint_Label_Into
        ("api.example.com", Buffer, Written, Code,
         Endpoint_Label_Options'
           (Mode             => Endpoint_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False),
         Port => 443,
         Scheme => "https");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 23
         and then Buffer = "[endpoints info] https ",
         "endpoint option bounded overflow");
   end Test_Bounded;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize endpoint tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Hosts'Access, "host and endpoint labels");
      Register_Routine (T, Test_URLs'Access, "URL labels");
      Register_Routine (T, Test_IP_And_CIDR'Access, "IP and CIDR labels");
      Register_Routine (T, Test_Bounded'Access, "bounded endpoint labels");
   end Register_Tests;

end Humanize.Tests.Endpoints;
