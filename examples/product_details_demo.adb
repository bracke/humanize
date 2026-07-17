with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Humanize.Accounts;
with Humanize.Domain_Details;
with Humanize.Endpoints;
with Humanize.Events;
with Humanize.Geo;
with Humanize.Moderation;
with Humanize.Notification_Preferences;
with Humanize.Payments;
with Humanize.Resources;
with Humanize.Status;
with Humanize.Versions;

procedure Product_Details_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;
begin
   Put_Result
     ("account",
      Humanize.Accounts.Account_Label
        ("admin", Humanize.Accounts.Active_Account));
   Put_Result
     ("payment",
      Humanize.Payments.Invoice_Label
        ("INV-42", Humanize.Payments.Open_Invoice));
   Put_Result
     ("event",
      Humanize.Events.Event_Label
        ("release review", Humanize.Events.Scheduled_Event));
   Put_Result
     ("endpoint",
      Humanize.Endpoints.Endpoint_Label
        ("api.example.test", Port => 443, Scheme => "https"));
   Put_Result ("geo", Humanize.Geo.Coordinate_Label (55.6761, 12.5683));
   Put_Result
     ("version",
      Humanize.Versions.Version_Delta_Label
        ("1.2.0", "1.3.0"));
   Put_Result
     ("resource",
      Humanize.Resources.Utilization_Label (Used => 82, Total => 100,
                                            Unit => "CPU units"));
   Put_Result
     ("moderation",
      Humanize.Moderation.Review_Label
        ("comment 42", Humanize.Moderation.Approved));
   Put_Result
     ("notifications",
      Humanize.Notification_Preferences.Channel_Preference_Label
        ("email", Humanize.Notification_Preferences.Preference_Enabled));
   Put_Result
     ("details",
      Humanize.Domain_Details.Domain_Label
        ("release",
         Humanize.Domain_Details.State_Metadata
           (Humanize.Domain_Details.Operations_Surface, "running")));
end Product_Details_Demo;
