separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Boolean_Label_Result
     (Item     : String;
      Consumed : Natural;
      Exact    : Boolean)
      return Boolean_Label_Parse_Result
   is
      use Humanize.Values;
begin
      if Item = "true" then
         return (Humanize.Status.Ok, True, True_False, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "false" then
         return (Humanize.Status.Ok, False, True_False, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "yes" then
         return (Humanize.Status.Ok, True, Yes_No, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "no" then
         return (Humanize.Status.Ok, False, Yes_No, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "on" then
         return (Humanize.Status.Ok, True, On_Off, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "off" then
         return (Humanize.Status.Ok, False, On_Off, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "enabled" then
         return (Humanize.Status.Ok, True, Enabled_Disabled, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "disabled" then
         return (Humanize.Status.Ok, False, Enabled_Disabled, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "active" then
         return (Humanize.Status.Ok, True, Active_Inactive, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "inactive" then
         return (Humanize.Status.Ok, False, Active_Inactive, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "available" then
         return (Humanize.Status.Ok, True, Available_Unavailable, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unavailable" then
         return (Humanize.Status.Ok, False, Available_Unavailable, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "visible" then
         return (Humanize.Status.Ok, True, Visible_Hidden, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "hidden" then
         return (Humanize.Status.Ok, False, Visible_Hidden, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "allowed" then
         return (Humanize.Status.Ok, True, Allowed_Blocked, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "blocked" then
         return (Humanize.Status.Ok, False, Allowed_Blocked, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "permitted" then
         return (Humanize.Status.Ok, True, Permitted_Denied, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "denied" then
         return (Humanize.Status.Ok, False, Permitted_Denied, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "passed" then
         return (Humanize.Status.Ok, True, Passed_Failed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "failed" then
         return (Humanize.Status.Ok, False, Passed_Failed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "healthy" then
         return (Humanize.Status.Ok, True, Healthy_Unhealthy, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unhealthy" then
         return (Humanize.Status.Ok, False, Healthy_Unhealthy, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "valid" then
         return (Humanize.Status.Ok, True, Valid_Invalid, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "invalid" then
         return (Humanize.Status.Ok, False, Valid_Invalid, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "complete" then
         return (Humanize.Status.Ok, True, Complete_Incomplete, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "incomplete" then
         return (Humanize.Status.Ok, False, Complete_Incomplete, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "open" then
         return (Humanize.Status.Ok, True, Open_Closed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "closed" then
         return (Humanize.Status.Ok, False, Open_Closed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "locked" then
         return (Humanize.Status.Ok, True, Locked_Unlocked, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unlocked" then
         return (Humanize.Status.Ok, False, Locked_Unlocked, Exact, Consumed, 0, No_Parse_Error);
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
end Boolean_Label_Result;
