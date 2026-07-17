with Humanize.Bounded_Text;

package body Humanize.Values is

   procedure Copy_Text
     (Text    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Boolean_Text
     (Value : Boolean;
      Style : Boolean_Label_Style)
      return String
   is
   begin
      case Style is
         when True_False =>
            return (if Value then "true" else "false");
         when Yes_No =>
            return (if Value then "yes" else "no");
         when On_Off =>
            return (if Value then "on" else "off");
         when Enabled_Disabled =>
            return (if Value then "enabled" else "disabled");
         when Active_Inactive =>
            return (if Value then "active" else "inactive");
         when Available_Unavailable =>
            return (if Value then "available" else "unavailable");
         when Visible_Hidden =>
            return (if Value then "visible" else "hidden");
         when Allowed_Blocked =>
            return (if Value then "allowed" else "blocked");
         when Permitted_Denied =>
            return (if Value then "permitted" else "denied");
         when Passed_Failed =>
            return (if Value then "passed" else "failed");
         when Healthy_Unhealthy =>
            return (if Value then "healthy" else "unhealthy");
         when Valid_Invalid =>
            return (if Value then "valid" else "invalid");
         when Complete_Incomplete =>
            return (if Value then "complete" else "incomplete");
         when Open_Closed =>
            return (if Value then "open" else "closed");
         when Locked_Unlocked =>
            return (if Value then "locked" else "unlocked");
      end case;
   end Boolean_Text;

   function Ternary_Text
     (Value : Ternary_Value;
      Style : Ternary_Label_Style)
      return String
   is
   begin
      case Style is
         when Yes_No_Unknown =>
            case Value is
               when True_Value => return "yes";
               when False_Value => return "no";
               when Unknown_Value => return "unknown";
            end case;
         when True_False_Unknown =>
            case Value is
               when True_Value => return "true";
               when False_Value => return "false";
               when Unknown_Value => return "unknown";
            end case;
         when Enabled_Disabled_Unknown =>
            case Value is
               when True_Value => return "enabled";
               when False_Value => return "disabled";
               when Unknown_Value => return "unknown";
            end case;
         when On_Off_Auto =>
            case Value is
               when True_Value => return "on";
               when False_Value => return "off";
               when Unknown_Value => return "auto";
            end case;
         when Set_Unset_Unknown =>
            case Value is
               when True_Value => return "set";
               when False_Value => return "unset";
               when Unknown_Value => return "unknown";
            end case;
         when Present_Absent_Unknown =>
            case Value is
               when True_Value => return "present";
               when False_Value => return "absent";
               when Unknown_Value => return "unknown";
            end case;
         when Available_Unavailable_Unknown =>
            case Value is
               when True_Value => return "available";
               when False_Value => return "unavailable";
               when Unknown_Value => return "unknown";
            end case;
         when Passed_Failed_Skipped =>
            case Value is
               when True_Value => return "passed";
               when False_Value => return "failed";
               when Unknown_Value => return "skipped";
            end case;
         when Healthy_Unhealthy_Unknown =>
            case Value is
               when True_Value => return "healthy";
               when False_Value => return "unhealthy";
               when Unknown_Value => return "unknown";
            end case;
         when Complete_Incomplete_Pending =>
            case Value is
               when True_Value => return "complete";
               when False_Value => return "incomplete";
               when Unknown_Value => return "pending";
            end case;
         when Allowed_Blocked_Unknown =>
            case Value is
               when True_Value => return "allowed";
               when False_Value => return "blocked";
               when Unknown_Value => return "unknown";
            end case;
         when Visible_Hidden_Mixed =>
            case Value is
               when True_Value => return "visible";
               when False_Value => return "hidden";
               when Unknown_Value => return "mixed";
            end case;
      end case;
   end Ternary_Text;

   function Boolean_Label
     (Value : Boolean;
      Style : Boolean_Label_Style := True_False)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Boolean_Text (Value, Style));
   end Boolean_Label;

   procedure Boolean_Label_Into
     (Value   : Boolean;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Boolean_Label_Style := True_False)
   is
   begin
      Copy_Text (Boolean_Text (Value, Style), Target, Written, Status);
   end Boolean_Label_Into;

   function Ternary_Label
     (Value : Ternary_Value;
      Style : Ternary_Label_Style := Yes_No_Unknown)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Ternary_Text (Value, Style));
   end Ternary_Label;

   procedure Ternary_Label_Into
     (Value   : Ternary_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Ternary_Label_Style := Yes_No_Unknown)
   is
   begin
      Copy_Text (Ternary_Text (Value, Style), Target, Written, Status);
   end Ternary_Label_Into;

   function Boolean_Label_Style_Label
     (Style : Boolean_Label_Style)
      return Humanize.Status.Text_Result
   is
   begin
      case Style is
         when True_False => return Ok_Text ("true/false");
         when Yes_No => return Ok_Text ("yes/no");
         when On_Off => return Ok_Text ("on/off");
         when Enabled_Disabled => return Ok_Text ("enabled/disabled");
         when Active_Inactive => return Ok_Text ("active/inactive");
         when Available_Unavailable => return Ok_Text ("available/unavailable");
         when Visible_Hidden => return Ok_Text ("visible/hidden");
         when Allowed_Blocked => return Ok_Text ("allowed/blocked");
         when Permitted_Denied => return Ok_Text ("permitted/denied");
         when Passed_Failed => return Ok_Text ("passed/failed");
         when Healthy_Unhealthy => return Ok_Text ("healthy/unhealthy");
         when Valid_Invalid => return Ok_Text ("valid/invalid");
         when Complete_Incomplete => return Ok_Text ("complete/incomplete");
         when Open_Closed => return Ok_Text ("open/closed");
         when Locked_Unlocked => return Ok_Text ("locked/unlocked");
      end case;
   end Boolean_Label_Style_Label;

   function Ternary_Label_Style_Label
     (Style : Ternary_Label_Style)
      return Humanize.Status.Text_Result
   is
   begin
      case Style is
         when Yes_No_Unknown => return Ok_Text ("yes/no/unknown");
         when True_False_Unknown => return Ok_Text ("true/false/unknown");
         when Enabled_Disabled_Unknown => return Ok_Text ("enabled/disabled/unknown");
         when On_Off_Auto => return Ok_Text ("on/off/auto");
         when Set_Unset_Unknown => return Ok_Text ("set/unset/unknown");
         when Present_Absent_Unknown => return Ok_Text ("present/absent/unknown");
         when Available_Unavailable_Unknown => return Ok_Text ("available/unavailable/unknown");
         when Passed_Failed_Skipped => return Ok_Text ("passed/failed/skipped");
         when Healthy_Unhealthy_Unknown => return Ok_Text ("healthy/unhealthy/unknown");
         when Complete_Incomplete_Pending => return Ok_Text ("complete/incomplete/pending");
         when Allowed_Blocked_Unknown => return Ok_Text ("allowed/blocked/unknown");
         when Visible_Hidden_Mixed => return Ok_Text ("visible/hidden/mixed");
      end case;
   end Ternary_Label_Style_Label;

end Humanize.Values;
