with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Endpoints.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function CIDR_Label
      (Context : Humanize.Contexts.Context;
       CIDR    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.CIDR_Label (CIDR => CIDR);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.cidr_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if Humanize.Label_Values.Ends (E, " invalid CIDR") then "invalid" else
           "valid");
         D_Cidr : constant String := (if D_State = "invalid" then Humanize.Label_Values.Before (E, " invalid CIDR")
           else Humanize.Label_Values.Before (E, " "));
         D_Prefix : constant String := Humanize.Label_Values.Value_After (D_Cidr, "/");
         D_Kind : constant String := (if D_State = "invalid" then "" else Humanize.Label_Values.Text_Of
           (Host_Kind_Label (Context, Host_Kind_Of (Humanize.Label_Values.Before (D_Cidr, "/")))));
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "cidr", D_Cidr);
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         Selection := Sel.With_Arg (Selection, "prefix", D_Prefix);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end CIDR_Label;

   function Endpoint_Label
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Port    : Port_Number := 0;
       Scheme  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.Endpoint_Label (Host => Host, Port => Port, Scheme => Scheme);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.endpoint_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "unknown endpoint" then "none" else "some");
         D_Scheme : constant String := (if Humanize.Bounded_Text.Clean_Lower_Text (Scheme) = "" then "" else
           Humanize.Bounded_Text.Clean_Lower_Text (Scheme) & " ");
         D_Host : constant String := Humanize.Label_Values.Unbracketed (Host);
         D_Port : constant String := (if Port = 0 then "" else ":" & Humanize.Bounded_Text.Image (Natural (Port)));
         D_Kind : constant String := Humanize.Label_Values.Text_Of (Host_Kind_Label (Context, Host_Kind_Of
           (Humanize.Label_Values.Unbracketed (Host))));
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "scheme", D_Scheme);
         Selection := Sel.With_Arg (Selection, "host", D_Host);
         Selection := Sel.With_Arg (Selection, "port", D_Port);
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Endpoint_Label;

   function Endpoint_Label
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options;
       Port    : Port_Number := 0;
       Scheme  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.Endpoint_Label (Host => Host, Options => Options, Port => Port, Scheme => Scheme);
      Plain_English : constant Humanize.Status.Text_Result :=
        Endpoints.Endpoint_Label (Host => Host, Port => Port, Scheme => Scheme);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Endpoint_Label (Context, Host => Host, Port =>
        Port, Scheme => Scheme));
   end Endpoint_Label;

   function Host_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Host_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.Host_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.host_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Host_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Host_Kind_Label;

   function Host_Label
      (Context : Humanize.Contexts.Context;
       Host    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.Host_Label (Host => Host);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.host_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "unknown host" then "none" else "some");
         D_Host : constant String := Humanize.Label_Values.Unbracketed (Host);
         D_Kind : constant String := Humanize.Label_Values.Text_Of (Host_Kind_Label (Context, Host_Kind_Of
           (Humanize.Label_Values.Unbracketed (Host))));
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "host", D_Host);
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Host_Label;

   function Host_Label
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.Host_Label (Host => Host, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Endpoints.Host_Label (Host => Host);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Host_Label (Context, Host => Host));
   end Host_Label;

   function IP_Address_Label
      (Context : Humanize.Contexts.Context;
       Address : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.IP_Address_Label (Address => Address);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.ip_address_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "address", Humanize.Label_Values.Unbracketed (Address));
      Selection := Sel.With_Arg (Selection, "kind", Lower (Host_Kind'Image (Host_Kind_Of
        (Humanize.Label_Values.Unbracketed (Address)))));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end IP_Address_Label;

   function Query_Summary
      (Context : Humanize.Contexts.Context;
       URL     : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.Query_Summary (URL => URL);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.query_summary");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Count : constant Long_Long_Integer := Humanize.Label_Values.Leading_Count (E);
      begin
         Selection := Sel.With_Arg (Selection, "count", D_Count);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Query_Summary;

   function URL_Component_Summary
      (Context : Humanize.Contexts.Context;
       URL     : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Endpoints.URL_Component_Summary (URL => URL);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.endpoints.url_component_summary");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_State : constant String := (if E = "empty URL" then "empty" elsif E = "URL with no recognized components"
           then "none" else "some");
         D_Count : constant Long_Long_Integer := Humanize.Label_Values.Leading_Count
           (Humanize.Label_Values.Value_After (E, "URL with "));
         D_Components : constant String := (if D_State = "some" then Humanize.Label_Values.Word_List (Context,
           "label.endpoints.url_component", Humanize.Label_Values.Value_After (E, ": ")) else "");
      begin
         Selection := Sel.With_Arg (Selection, "state", D_State);
         Selection := Sel.With_Arg (Selection, "count", D_Count);
         Selection := Sel.With_Arg (Selection, "components", D_Components);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end URL_Component_Summary;

   procedure CIDR_Label_Into
      (Context : Humanize.Contexts.Context;
       CIDR    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (CIDR_Label (Context, CIDR => CIDR), Target, Written, Status);
   end CIDR_Label_Into;

   procedure Endpoint_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Port    : Port_Number := 0;
       Scheme  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Endpoint_Label (Context, Host => Host, Port => Port, Scheme => Scheme),
         Target, Written, Status);
   end Endpoint_Label_Into;

   procedure Endpoint_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options;
       Port    : Port_Number := 0;
       Scheme  : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Endpoint_Label (Context, Host => Host, Options => Options, Port => Port, Scheme => Scheme),
         Target, Written, Status);
   end Endpoint_Label_Into;

   procedure Host_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Host_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Host_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Host_Kind_Label_Into;

   procedure Host_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Host_Label (Context, Host => Host), Target, Written, Status);
   end Host_Label_Into;

   procedure Host_Label_Into
      (Context : Humanize.Contexts.Context;
       Host    : String;
       Options : Endpoint_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Host_Label (Context, Host => Host, Options => Options),
         Target, Written, Status);
   end Host_Label_Into;

   procedure IP_Address_Label_Into
      (Context : Humanize.Contexts.Context;
       Address : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (IP_Address_Label (Context, Address => Address), Target, Written, Status);
   end IP_Address_Label_Into;

   procedure Query_Summary_Into
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Query_Summary (Context, URL => URL), Target, Written, Status);
   end Query_Summary_Into;

   procedure URL_Component_Summary_Into
      (Context : Humanize.Contexts.Context;
       URL     : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (URL_Component_Summary (Context, URL => URL), Target, Written, Status);
   end URL_Component_Summary_Into;

end Humanize.Endpoints.Localized;
