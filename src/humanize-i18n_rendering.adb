with Ada.Strings.Unbounded;

with I18N.Arguments;
with I18N.Result;
with I18N.Runtime;

with Humanize.Number_Formatting;

package body Humanize.I18N_Rendering is

   use Ada.Strings.Unbounded;
   use type I18N.Runtime.Resolve_Status;
   use type Humanize.Status.Status_Code;

   --  Map an i18n render status onto the Humanize status set.
   function To_Status
     (S : I18N.Result.Render_Status)
      return Humanize.Status.Status_Code
   is
   begin
      case S is
         when I18N.Result.Success =>
            return Humanize.Status.Ok;
         when I18N.Result.Missing_Key =>
            return Humanize.Status.Missing_Message;
         when I18N.Result.Missing_Argument =>
            return Humanize.Status.Missing_Argument;
         when I18N.Result.Invalid_Argument =>
            return Humanize.Status.Invalid_Argument;
         when I18N.Result.Formatting_Error =>
            return Humanize.Status.Render_Error;
         when I18N.Result.Execution_Error =>
            return Humanize.Status.Runtime_Error;
         when I18N.Result.Buffer_Overflow =>
            return Humanize.Status.Buffer_Overflow;
         when I18N.Result.Internal_Error =>
            return Humanize.Status.Internal_Error;
      end case;
   end To_Status;

   --  Decimal image of a non-negative value without 'Image leading space.
   function Image (Value : Long_Long_Integer) return String is
      Text : constant String := Long_Long_Integer'Image (Value);
   begin
      if Text (Text'First) = ' ' then
         return Text (Text'First + 1 .. Text'Last);
      end if;
      return Text;
   end Image;

   --  Populate the i18n argument map from a selection. Count selections set both
   --  "count" (the raw integer, for plural/ordinal selection) and "value" (the
   --  locale-grouped count, displayed by the catalog via {value}).
   procedure Apply_Arguments
     (Args      : in out I18N.Arguments.Arguments;
      Selection : Humanize.Selections.Message_Selection;
      Locale    : String)
   is
   begin
      case Selection.Arguments is
         when Humanize.Selections.No_Arguments =>
            null;
         when Humanize.Selections.Count_Argument =>
            I18N.Arguments.Set_Integer
              (Args, "count", Long_Long_Integer (Selection.Count));
            I18N.Arguments.Set
              (Args, "value",
               Humanize.Number_Formatting.Localize
                 (Image (Long_Long_Integer (Selection.Count)),
                  Humanize.Number_Formatting.Symbols_For (Locale)));
         when Humanize.Selections.Value_Argument =>
            I18N.Arguments.Set (Args, "value", To_String (Selection.Value));
      end case;
   end Apply_Arguments;

   function Available
     (Context : Humanize.Contexts.Context;
      Key     : Humanize.Messages.Message_Id)
      return Boolean
   is
      Result : constant I18N.Runtime.Resolve_Result :=
        I18N.Runtime.Resolve
          (Item   => Humanize.Contexts.Runtime (Context).all,
           Locale => Humanize.Contexts.Locale (Context),
           Key    => Humanize.Messages.Key (Key));
   begin
      return Result.Status = I18N.Runtime.Found;
   end Available;

   function Render
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result
   is
      Args   : I18N.Arguments.Arguments;
      Output : Humanize.Status.Text_Result;
   begin
      Apply_Arguments
        (Args, Selection, Humanize.Contexts.Locale (Context));

      declare
         Result : constant I18N.Result.Render_Result :=
           I18N.Runtime.Render
             (Item      => Humanize.Contexts.Runtime (Context).all,
              Locale    => Humanize.Contexts.Locale (Context),
              Key       => Humanize.Messages.Key (Selection.Key),
              Arguments => Args);
      begin
         Output.Status := To_Status (Result.Status);
         Output.Key := Selection.Key;
         if Output.Status = Humanize.Status.Ok then
            Output.Text :=
              To_Unbounded_String (I18N.Result.Output_Text (Result.Text));
         end if;
         return Output;
      end;
   end Render;

   procedure Render_Into
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Args     : I18N.Arguments.Arguments;
      Last     : Natural;
      I_Status : I18N.Result.Render_Status;
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      Apply_Arguments
        (Args, Selection, Humanize.Contexts.Locale (Context));

      I18N.Runtime.Render_Into
        (Item      => Humanize.Contexts.Runtime (Context).all,
         Locale    => Humanize.Contexts.Locale (Context),
         Key       => Humanize.Messages.Key (Selection.Key),
         Arguments => Args,
         Target    => Target,
         Last      => Last,
         Status    => I_Status);

      Status := To_Status (I_Status);

      case I_Status is
         when I18N.Result.Success =>
            Written := Last;
         when I18N.Result.Buffer_Overflow =>
            Written := Last;  --  prefix characters copied
         when others =>
            Written := 0;
      end case;
   end Render_Into;

end Humanize.I18N_Rendering;
