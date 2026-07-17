separate (Humanize.Parsing.Implementation.Domain_Label_Text_Helpers)
function Ternary_Label_Result
     (Item     : String;
      Consumed : Natural;
      Exact    : Boolean)
      return Ternary_Label_Parse_Result
   is
      use Humanize.Values;
begin
      if Item = "yes" then
         return (Humanize.Status.Ok, True_Value, Yes_No_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "no" then
         return (Humanize.Status.Ok, False_Value, Yes_No_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "true" then
         return (Humanize.Status.Ok, True_Value, True_False_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "false" then
         return (Humanize.Status.Ok, False_Value, True_False_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "enabled" then
         return (Humanize.Status.Ok, True_Value, Enabled_Disabled_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "disabled" then
         return (Humanize.Status.Ok, False_Value, Enabled_Disabled_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "on" then
         return (Humanize.Status.Ok, True_Value, On_Off_Auto, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "off" then
         return (Humanize.Status.Ok, False_Value, On_Off_Auto, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "auto" then
         return (Humanize.Status.Ok, Unknown_Value, On_Off_Auto, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "set" then
         return (Humanize.Status.Ok, True_Value, Set_Unset_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unset" then
         return (Humanize.Status.Ok, False_Value, Set_Unset_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "present" then
         return (Humanize.Status.Ok, True_Value, Present_Absent_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "absent" then
         return (Humanize.Status.Ok, False_Value, Present_Absent_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "available" then
         return (Humanize.Status.Ok, True_Value, Available_Unavailable_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unavailable" then
         return (Humanize.Status.Ok, False_Value, Available_Unavailable_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "passed" then
         return (Humanize.Status.Ok, True_Value, Passed_Failed_Skipped, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "failed" then
         return (Humanize.Status.Ok, False_Value, Passed_Failed_Skipped, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "skipped" then
         return (Humanize.Status.Ok, Unknown_Value, Passed_Failed_Skipped, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "healthy" then
         return (Humanize.Status.Ok, True_Value, Healthy_Unhealthy_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unhealthy" then
         return (Humanize.Status.Ok, False_Value, Healthy_Unhealthy_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "complete" then
         return (Humanize.Status.Ok, True_Value, Complete_Incomplete_Pending, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "incomplete" then
         return (Humanize.Status.Ok, False_Value, Complete_Incomplete_Pending, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "pending" then
         return (Humanize.Status.Ok, Unknown_Value, Complete_Incomplete_Pending, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "allowed" then
         return (Humanize.Status.Ok, True_Value, Allowed_Blocked_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "blocked" then
         return (Humanize.Status.Ok, False_Value, Allowed_Blocked_Unknown, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "visible" then
         return (Humanize.Status.Ok, True_Value, Visible_Hidden_Mixed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "hidden" then
         return (Humanize.Status.Ok, False_Value, Visible_Hidden_Mixed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "mixed" then
         return (Humanize.Status.Ok, Unknown_Value, Visible_Hidden_Mixed, Exact, Consumed, 0, No_Parse_Error);
      elsif Item = "unknown" then
         return (Humanize.Status.Ok, Unknown_Value, Yes_No_Unknown, Exact, Consumed, 0, No_Parse_Error);
      else
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
end Ternary_Label_Result;
