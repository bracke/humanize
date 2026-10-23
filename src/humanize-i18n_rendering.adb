with Humanize.Locales;
with Ada.Strings.Unbounded;

with Humanize.Catalogs;
with Humanize.Bounded_Text;
with Humanize.Decimal_Images;

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
      --  The fixed offsets the locale-neutral entries name: now, yesterday,
      --  today, tomorrow.
      Messages.Arguments.Set_Integer (Args, "zero", 0);
      Messages.Arguments.Set_Integer (Args, "minus_one", -1);
      Messages.Arguments.Set_Integer (Args, "plus_one", 1);
      case Selection.Arguments is
         when Humanize.Selections.No_Arguments =>
            null;
         when Humanize.Selections.Count_Argument =>
            Messages.Arguments.Set_Integer
              (Args, "count", Long_Long_Integer (Selection.Count));
            Messages.Arguments.Set_Integer
              (Args, "past_count", -Long_Long_Integer (Selection.Count));
            Messages.Arguments.Set
              (Args, "value", Image (Long_Long_Integer (Selection.Count)));
         when Humanize.Selections.Value_Argument =>
            Messages.Arguments.Set (Args, "value", To_String (Selection.Value));
         when Humanize.Selections.Value_Suffix_Argument =>
            Messages.Arguments.Set (Args, "value", To_String (Selection.Value));
            Messages.Arguments.Set (Args, "suffix", To_String (Selection.Suffix));
         when Humanize.Selections.Count_Value_Suffix_Argument =>
            Messages.Arguments.Set_Integer
              (Args, "count", Long_Long_Integer (Selection.Count));
            Messages.Arguments.Set (Args, "value", To_String (Selection.Value));
            Messages.Arguments.Set (Args, "suffix", To_String (Selection.Suffix));
         when Humanize.Selections.Named_Arguments =>
            for Index in 1 .. Selection.Named_Count loop
               Messages.Arguments.Set
                 (Args, To_String (Selection.Named (Index).Name), To_String (Selection.Named (Index).Value));
            end loop;
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
              Key       => Humanize.Selections.Catalog_Key (Selection),
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
         Key       => Humanize.Selections.Catalog_Key (Selection),
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

   function Phrase_Or
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      English   : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result
   is
      Locale : constant String := Humanize.Contexts.Locale (Context);
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      elsif Humanize.Locales.Language_Code (Locale) in "en" | "" then
         --  A regional English (en-GB "cancelled") overrides where its
         --  catalog differs from en's; elsewhere the formatter's own English.
         if Locale'Length > 2 then
            declare
               Regional : constant Humanize.Status.Text_Result := Render (Context, Selection);
               Plain    : constant Humanize.Status.Text_Result :=
                 Render (Humanize.Contexts.Create (Humanize.Contexts.Runtime (Context), "en"), Selection);
            begin
               if Regional.Status = Humanize.Status.Ok and then Plain.Status = Humanize.Status.Ok
                 and then Regional.Text /= Plain.Text
               then
                  return Regional;
               end if;
            end;
         end if;
         return English;
      end if;
      declare
         Localized : constant Humanize.Status.Text_Result := Render (Context, Selection);
      begin
         return (if Localized.Status = Humanize.Status.Ok and then Length (Localized.Text) > 0
                 then Localized else English);
      end;
   end Phrase_Or;

   type Text_Access is access constant String;
   Plural_Forms : constant array (1 .. 4) of Text_Access :=
     [new String'("zero"), new String'("two"), new String'("few"), new String'("many")];

   function With_Nouns
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      Singular  : String;
      Plural    : String)
      return Humanize.Selections.Message_Selection
   is
      Other : constant String := (if Plural'Length > 0 then Plural else Singular);

      --  The registered form, else Default (Noun_Form answers the plural for
      --  a form not registered).
      function Form (Category, Default : String) return String is
         Registered : constant String := Humanize.Contexts.Noun_Form (Context, Other, Category);
      begin
         return (if Registered = Other then Default else Registered);
      end Form;

      use Humanize.Selections;
      Result : Message_Selection := With_Arg (With_Arg (Selection, "one", Singular), "other", Other);
   begin
      for Category of Plural_Forms loop
         Result := With_Arg (Result, Category.all, Form (Category.all, Other));
      end loop;
      Result := With_Arg (Result, "genitive_one", Form ("genitive_one", Singular));
      Result := With_Arg (Result, "genitive_other", Form ("genitive_other", Other));
      Result := With_Arg (Result, "accusative_one", Form ("accusative_one", Singular));
      Result := With_Arg (Result, "accusative_other", Form ("accusative_other", Other));
      return Result;
   end With_Nouns;

   function Noun
     (Context  : Humanize.Contexts.Context;
      Count    : Long_Float;
      Singular : String;
      Plural   : String;
      English  : String)
      return String
   is
   begin
      if Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | "" then
         return English;
      end if;
      declare
         Rendered : constant Humanize.Status.Text_Result :=
           Render
             (Context,
              With_Nouns
                (Context,
                 Humanize.Selections.With_Arg
                   (Humanize.Selections.Phrase ("noun"), "count",
                    Humanize.Decimal_Images.Decimal_Image (abs Count, 3)),
                 Singular, Plural));
      begin
         return (if Rendered.Status = Humanize.Status.Ok and then Length (Rendered.Text) > 0
                 then To_String (Rendered.Text) else English);
      end;
   end Noun;

   function Difference_Parts
     (Context        : Humanize.Contexts.Context;
      Years          : Natural;
      Months         : Natural;
      Days           : Natural;
      Max_Components : Natural;
      Include_Zero   : Boolean;
      Case_Name      : String)
      return String
   is
      use Humanize.Selections;
      Parts : Unbounded_String;
      Count : Natural := 0;

      function Part (Value : Natural; Unit : String) return Boolean is
      begin
         if Count >= Max_Components or else (Value = 0 and then not Include_Zero) then
            return True;
         end if;
         declare
            Text : constant Humanize.Status.Text_Result :=
              Render
                (Context,
                 With_Arg
                   (With_Arg (With_Arg (Phrase ("calendar_difference.part"), "unit", Unit), "case", Case_Name),
                    "value", Long_Long_Integer (Value)));
         begin
            if Text.Status /= Humanize.Status.Ok or else Length (Text.Text) = 0 then
               return False;
            end if;
            if Count > 0 then
               Append (Parts, "|");
            end if;
            Append (Parts, Text.Text);
            Count := Count + 1;
            return True;
         end;
      end Part;
   begin
      if not (Part (Years, "year") and then Part (Months, "month") and then Part (Days, "day"))
        or else Count = 0
      then
         return "";
      end if;
      declare
         Joined : constant Humanize.Status.Text_Result :=
           Render (Context, With_Arg (Phrase ("calendar_difference.join"), "value", To_String (Parts)));
      begin
         return (if Joined.Status = Humanize.Status.Ok then To_String (Joined.Text) else "");
      end;
   end Difference_Parts;

end Humanize.I18N_Rendering;
