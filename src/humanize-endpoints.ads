with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for URLs, hosts, IP addresses, and endpoints.
package Humanize.Endpoints is
   type Endpoint_Output_Mode is
     (Endpoint_Detailed,
      Endpoint_Compact,
      Endpoint_Accessible,
      Endpoint_Log);

   type Endpoint_Label_Options is record
      Mode             : Endpoint_Output_Mode := Endpoint_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Endpoint_Label_Options : constant Endpoint_Label_Options :=
     (Mode             => Endpoint_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Endpoint_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   subtype Port_Number is Natural range 0 .. 65_535;
   --  Port 0 means no explicit port in endpoint display helpers.

   type Host_Kind is
     (Domain_Host,
      IPv4_Host,
      IPv6_Host,
      Localhost_Host,
      Private_Network_Host,
      Unknown_Host);
   --  Host categories used by endpoint labels.

   type URL_Display_Options is record
      Include_Scheme        : Boolean := True;
      Include_Path          : Boolean := True;
      Include_Query_Summary : Boolean := True;
      Include_Fragment      : Boolean := False;
      Redact_Userinfo       : Boolean := True;
      Omit_Default_Port     : Boolean := True;
   end record;
   --  URL display policy for deterministic URL labels.

   Default_URL_Display_Options : constant URL_Display_Options :=
     (Include_Scheme        => True,
      Include_Path          => True,
      Include_Query_Summary => True,
      Include_Fragment      => False,
      Redact_Userinfo       => True,
      Omit_Default_Port     => True);

   function Host_Kind_Of
     (Host : String)
      return Host_Kind;
   --  @param Host Hostname, IPv4 address, bracketed IPv6 address, or IPv6 literal.
   --  @return Best-effort host category.

   function Host_Kind_Label
     (Kind : Host_Kind)
      return Humanize.Status.Text_Result;
   --  @param Kind Host category.
   --  @return Stable human-readable host category label.

   function Host_Label
     (Host : String)
      return Humanize.Status.Text_Result;
   --  @param Host Hostname, IPv4 address, bracketed IPv6 address, or IPv6 literal.
   --  @return Host plus a category label such as "domain host".

   function Host_Label
     (Host    : String;
      Options : Endpoint_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Host Hostname, IPv4 address, bracketed IPv6 address, or IPv6 literal.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Host plus category label with optional metadata.

   procedure Host_Label_Into
     (Host    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Host Hostname, IPv4 address, bracketed IPv6 address, or IPv6 literal.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Endpoint_Label
     (Host   : String;
      Port   : Port_Number := 0;
      Scheme : String := "")
      return Humanize.Status.Text_Result;
   --  @param Host Endpoint host.
   --  @param Port Optional endpoint port; 0 omits the port.
   --  @param Scheme Optional endpoint scheme such as "https".
   --  @return Compact endpoint label with host category.

   function Endpoint_Label
     (Host    : String;
      Options : Endpoint_Label_Options;
      Port    : Port_Number := 0;
      Scheme  : String := "")
      return Humanize.Status.Text_Result;
   --  @param Host Endpoint host.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Port Optional endpoint port; 0 omits the port.
   --  @param Scheme Optional endpoint scheme such as "https".
   --  @return Compact endpoint label with optional metadata.

   function Host_Kind_Metadata
     (Kind : Host_Kind)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param Kind Host category.
   --  @return Severity, tone, and final/actionable metadata for Kind.

   function Parse_Endpoint_Label
     (Text : String;
      Kind : Host_Kind)
      return Endpoint_Label_Parse_Result;
   --  @param Text Label in rendered endpoint-label form.
   --  @param Kind Expected host category.
   --  @return Parsed endpoint span, kind span, metadata, and consumed length.

   function Scan_Endpoint_Label
     (Text : String;
      Kind : Host_Kind)
      return Endpoint_Label_Parse_Result;
   --  @param Text Text beginning with an endpoint label.
   --  @param Kind Expected host category.
   --  @return Parsed endpoint-label prefix and consumed length.

   procedure Endpoint_Label_Into
     (Host    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Port    : Port_Number := 0;
      Scheme  : String := "");
   --  @param Host Endpoint host.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Port Optional endpoint port; 0 omits the port.
   --  @param Scheme Optional endpoint scheme such as "https".

   procedure Endpoint_Label_Into
     (Host    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Endpoint_Label_Options;
      Port    : Port_Number := 0;
      Scheme  : String := "");
   --  @param Host Endpoint host.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.
   --  @param Port Optional endpoint port; 0 omits the port.
   --  @param Scheme Optional endpoint scheme such as "https".

   function URL_Label
     (URL     : String;
      Options : URL_Display_Options := Default_URL_Display_Options)
      return Humanize.Status.Text_Result;
   --  @param URL URL-like text.
   --  @param Options URL display policy.
   --  @return Redacted readable URL label with optional query summary.

   function Safe_URL_Label
     (URL : String)
      return Humanize.Status.Text_Result;
   --  @param URL URL-like text.
   --  @return Safe URL label with credentials redacted and query summarized.

   function URL_Component_Summary
     (URL : String)
      return Humanize.Status.Text_Result;
   --  @param URL URL-like text.
   --  @return Structural URL summary for scheme, host, path, query, and fragment.

   procedure URL_Label_Into
     (URL     : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : URL_Display_Options := Default_URL_Display_Options);
   --  @param URL URL-like text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options URL display policy.

   procedure Safe_URL_Label_Into
     (URL     : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param URL URL-like text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Query_Summary
     (URL : String)
      return Humanize.Status.Text_Result;
   --  @param URL URL-like text.
   --  @return Query-parameter count summary such as "2 query params".

   function IP_Address_Label
     (Address : String)
      return Humanize.Status.Text_Result;
   --  @param Address IPv4, bracketed IPv6, or IPv6 literal text.
   --  @return IP address label with public/private/local category.

   function CIDR_Label
     (CIDR : String)
      return Humanize.Status.Text_Result;
   --  @param CIDR CIDR-like network text such as "10.0.0.0/8".
   --  @return CIDR label with address category and prefix length.

end Humanize.Endpoints;
