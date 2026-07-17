with Humanize.Status;

--  Semantic labels for boolean, tri-state, and small state values.
package Humanize.Values is

   type Boolean_Label_Style is
     (True_False,
      Yes_No,
      On_Off,
      Enabled_Disabled,
      Active_Inactive,
      Available_Unavailable,
      Visible_Hidden,
      Allowed_Blocked,
      Permitted_Denied,
      Passed_Failed,
      Healthy_Unhealthy,
      Valid_Invalid,
      Complete_Incomplete,
      Open_Closed,
      Locked_Unlocked);
   --  Label families for Boolean values.

   type Ternary_Value is (False_Value, True_Value, Unknown_Value);
   --  Three-state value for caller-owned unknown, unset, or mixed states.

   type Ternary_Label_Style is
     (Yes_No_Unknown,
      True_False_Unknown,
      Enabled_Disabled_Unknown,
      On_Off_Auto,
      Set_Unset_Unknown,
      Present_Absent_Unknown,
      Available_Unavailable_Unknown,
      Passed_Failed_Skipped,
      Healthy_Unhealthy_Unknown,
      Complete_Incomplete_Pending,
      Allowed_Blocked_Unknown,
      Visible_Hidden_Mixed);
   --  Label families for three-state values.

   function Boolean_Label
     (Value : Boolean;
      Style : Boolean_Label_Style := True_False)
      return Humanize.Status.Text_Result;
   --  @param Value Boolean value to label.
   --  @param Style Semantic label family to use.
   --  @return Human-readable label for Value.

   procedure Boolean_Label_Into
     (Value   : Boolean;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Boolean_Label_Style := True_False);
   --  @param Value Boolean value to label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Semantic label family to use.

   function Ternary_Label
     (Value : Ternary_Value;
      Style : Ternary_Label_Style := Yes_No_Unknown)
      return Humanize.Status.Text_Result;
   --  @param Value Three-state value to label.
   --  @param Style Semantic label family to use.
   --  @return Human-readable label for Value.

   procedure Ternary_Label_Into
     (Value   : Ternary_Value;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Style   : Ternary_Label_Style := Yes_No_Unknown);
   --  @param Value Three-state value to label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Style Semantic label family to use.

   function Boolean_Label_Style_Label
     (Style : Boolean_Label_Style)
      return Humanize.Status.Text_Result;
   --  @param Style Boolean label style to describe.
   --  @return Stable human-readable style label.

   function Ternary_Label_Style_Label
     (Style : Ternary_Label_Style)
      return Humanize.Status.Text_Result;
   --  @param Style Ternary label style to describe.
   --  @return Stable human-readable style label.

end Humanize.Values;
