with Ada.Strings.Unbounded;

with Humanize.Catalogs;
with Humanize.Bounded_Text;

with Messages.Arguments;
with Messages.Result;
with Messages.Runtime;

package body Humanize.I18N_Rendering is

   use Ada.Strings.Unbounded;
   use type Messages.Runtime.Resolve_Status;
   use type Messages.Runtime.Load_Status;
   use type Humanize.Status.Status_Code;

   Default_Runtime : aliased Messages.Runtime.Instance;
   Default_Runtime_Loaded : Boolean := False;
   Default_Runtime_Failed : Boolean := False;

   --  Map an i18n render status onto the Humanize status set.
   function To_Status
     (S : Messages.Result.Render_Status)
      return Humanize.Status.Status_Code
   is
   begin
      case S is
         when Messages.Result.Success =>
            return Humanize.Status.Ok;
         when Messages.Result.Missing_Key =>
            return Humanize.Status.Missing_Message;
         when Messages.Result.Missing_Argument =>
            return Humanize.Status.Missing_Argument;
         when Messages.Result.Invalid_Argument =>
            return Humanize.Status.Invalid_Argument;
         when Messages.Result.Formatting_Error =>
            return Humanize.Status.Render_Error;
         when Messages.Result.Execution_Error =>
            return Humanize.Status.Runtime_Error;
         when Messages.Result.Buffer_Overflow =>
            return Humanize.Status.Buffer_Overflow;
         when Messages.Result.Internal_Error =>
            return Humanize.Status.Internal_Error;
      end case;
   end To_Status;

   function Image (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   --  Populate the i18n argument map from a selection. Numeric values are kept
   --  as strict locale-neutral decimals; catalog messages choose any display
   --  formatting through public i18n number placeholders.
   procedure Apply_Arguments
     (Args      : in out Messages.Arguments.Arguments;
      Selection : Humanize.Selections.Message_Selection;
      Locale    : String)
   is
      pragma Unreferenced (Locale);
   begin
      case Selection.Arguments is
         when Humanize.Selections.No_Arguments =>
            null;
         when Humanize.Selections.Count_Argument =>
            Messages.Arguments.Set_Integer
              (Args, "count", Long_Long_Integer (Selection.Count));
            Messages.Arguments.Set
              (Args, "value", Image (Long_Long_Integer (Selection.Count)));
         when Humanize.Selections.Value_Argument =>
            Messages.Arguments.Set (Args, "value", To_String (Selection.Value));
         when Humanize.Selections.Value_Suffix_Argument =>
            Messages.Arguments.Set (Args, "value", To_String (Selection.Value));
            Messages.Arguments.Set (Args, "suffix", To_String (Selection.Suffix));
         when Humanize.Selections.Decimal_Argument =>
            --  ASCII decimal selects the plural category ("count") and is also
            --  passed to catalog-side number formatting as "value".
            declare
               Ascii : constant String := To_String (Selection.Value);
            begin
               Messages.Arguments.Set (Args, "count", Ascii);
               Messages.Arguments.Set (Args, "value", Ascii);
            end;
      end case;
   end Apply_Arguments;

   function Available
     (Context : Humanize.Contexts.Context;
      Key     : Humanize.Message_Keys.Message_Id)
      return Boolean
   is
      Result : constant Messages.Runtime.Resolve_Result :=
        Messages.Runtime.Resolve
          (Item   => Humanize.Contexts.Runtime (Context).all,
           Locale => Humanize.Contexts.Locale (Context),
           Key    => Humanize.Message_Keys.Key (Key));
   begin
      return Result.Status = Messages.Runtime.Found;
   end Available;

   function Default_Context
     (Locale : String;
      Loaded : out Boolean)
      return Humanize.Contexts.Context
   is
      Load_Result : Messages.Runtime.Load_Result;
   begin
      if not Default_Runtime_Loaded and then not Default_Runtime_Failed then
         Humanize.Catalogs.Load_Defaults (Default_Runtime, Load_Result);
         if Load_Result.Status = Messages.Runtime.Loaded then
            Default_Runtime_Loaded := True;
         else
            Default_Runtime_Failed := True;
         end if;
      end if;

      Loaded := Default_Runtime_Loaded;
      return Humanize.Contexts.Create (Default_Runtime'Access, Locale);
   end Default_Context;

   function Render
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result
   is
      Args   : Messages.Arguments.Arguments;
      Output : Humanize.Status.Text_Result;
   begin
      Apply_Arguments
        (Args, Selection, Humanize.Contexts.Locale (Context));

      declare
         Result : constant Messages.Result.Render_Result :=
           Messages.Runtime.Render
             (Item      => Humanize.Contexts.Runtime (Context).all,
              Locale    => Humanize.Contexts.Locale (Context),
              Key       => Humanize.Message_Keys.Key (Selection.Key),
              Arguments => Args);
      begin
         Output.Status := To_Status (Result.Status);
         Output.Key := Selection.Key;
         if Output.Status = Humanize.Status.Ok then
            Output.Text :=
              To_Unbounded_String (Messages.Result.Output_Text (Result.Text));
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
      Args     : Messages.Arguments.Arguments;
      Last     : Natural;
      I_Status : Messages.Result.Render_Status;
   begin
      Written := 0;

      if Target'First /= 1 then
         Status := Humanize.Status.Invalid_Options;
         return;
      end if;

      Apply_Arguments
        (Args, Selection, Humanize.Contexts.Locale (Context));

      Messages.Runtime.Render_Into
        (Item      => Humanize.Contexts.Runtime (Context).all,
         Locale    => Humanize.Contexts.Locale (Context),
         Key       => Humanize.Message_Keys.Key (Selection.Key),
         Arguments => Args,
         Target    => Target,
         Last      => Last,
         Status    => I_Status);

      Status := To_Status (I_Status);

      case I_Status is
         when Messages.Result.Success =>
            Written := Last;
         when Messages.Result.Buffer_Overflow =>
            Written := Last;  --  prefix characters copied
         when others =>
            Written := 0;
      end case;
   end Render_Into;

end Humanize.I18N_Rendering;
