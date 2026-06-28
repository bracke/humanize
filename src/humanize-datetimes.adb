with Humanize.Datetime_Classification;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;

package body Humanize.Datetimes is

   --  Apply the spec's semantic fallback for calendar-day keys: if the special
   --  key is not present in the runtime, substitute the generic relative key.
   function Resolve_Selection
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Selections.Message_Selection
   is
      use Humanize.Messages;
   begin
      case Selection.Key is
         when Datetime_Day_Previous =>
            if not Humanize.I18N_Rendering.Available
                     (Context, Datetime_Day_Previous)
            then
               return Humanize.Selections.Count
                        (Datetime_Relative_Day_Past, 1);
            end if;

         when Datetime_Day_Current =>
            if not Humanize.I18N_Rendering.Available
                     (Context, Datetime_Day_Current)
            then
               return Humanize.Selections.No_Arg (Datetime_Now);
            end if;

         when Datetime_Day_Next =>
            if not Humanize.I18N_Rendering.Available
                     (Context, Datetime_Day_Next)
            then
               return Humanize.Selections.Count
                        (Datetime_Relative_Day_Future, 1);
            end if;

         when others =>
            null;
      end case;

      return Selection;
   end Resolve_Selection;

   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Resolve_Selection
          (Context,
           Humanize.Datetime_Classification.Classify
             (Value, Reference, Options));
   begin
      return Humanize.I18N_Rendering.Render (Context, Selection);
   end Relative;

   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options)
   is
      Selection : constant Humanize.Selections.Message_Selection :=
        Resolve_Selection
          (Context,
           Humanize.Datetime_Classification.Classify
             (Value, Reference, Options));
   begin
      Humanize.I18N_Rendering.Render_Into
        (Context, Selection, Target, Written, Status);
   end Relative_Into;

   function To_Time (Item : Civil_Date_Time) return Ada.Calendar.Time is
   begin
      return Ada.Calendar.Time_Of
               (Year    => Item.Year,
                Month   => Item.Month,
                Day     => Item.Day,
                Seconds => Ada.Calendar.Day_Duration
                             (Item.Hour * 3600 + Item.Minute * 60
                              + Item.Second));
   end To_Time;

   function Relative_Civil
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result
   is
   begin
      return Relative (Context, To_Time (Value), To_Time (Reference), Options);
   exception
      when others =>
         return (Status => Humanize.Status.Invalid_Value, others => <>);
   end Relative_Civil;

   procedure Relative_Civil_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Civil_Date_Time;
      Reference : Civil_Date_Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options)
   is
   begin
      Relative_Into
        (Context, To_Time (Value), To_Time (Reference),
         Target, Written, Status, Options);
   exception
      when others =>
         Written := 0;
         Status := Humanize.Status.Invalid_Value;
   end Relative_Civil_Into;

end Humanize.Datetimes;
