with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Schema.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Array_Shape_Label
      (Context      : Humanize.Contexts.Context;
       Element_Type : Field_Type;
       Count        : Natural := 0;
       Count_Known  : Boolean := False)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Array_Shape_Label (Element_Type => Element_Type, Count => Count, Count_Known => Count_Known);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.array_shape_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "element_type", Lower (Field_Type'Image (Element_Type)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "count_known", Lower (Boolean'Image (Count_Known)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Array_Shape_Label;

   function Constraint_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Constraint_Label (Name => Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.constraint_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Bounded_Text.Clean (Value));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Constraint_Label;

   function Default_Value_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Default_Value_Label (Field_Name => Field_Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.default_value_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Bounded_Text.Clean (Value));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Default_Value_Label;

   function Deprecated_Field_Label
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Replacement : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Deprecated_Field_Label (Name => Name, Replacement => Replacement);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.deprecated_field_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "replacement", Humanize.Bounded_Text.Clean (Replacement));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Deprecated_Field_Label;

   function Enum_Options_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Enum_Options_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.enum_options_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Enum_Options_Label;

   function Example_Value_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Example_Value_Label (Field_Name => Field_Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.example_value_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "value", Humanize.Bounded_Text.Clean (Value));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Example_Value_Label;

   function Field_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Field_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Field_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.field_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Field_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Field_State_Label;

   function Field_Type_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Field_Type)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Field_Type_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.field_type_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Field_Type'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Field_Type_Label;

   function Missing_Required_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Missing_Required_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.missing_required_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Missing_Required_Label;

   function Object_Shape_Label
      (Context  : Humanize.Contexts.Context;
       Fields   : Natural;
       Required : Natural := 0;
       Optional : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Object_Shape_Label (Fields => Fields, Required => Required, Optional => Optional);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.object_shape_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "fields", Long_Long_Integer (Fields));
      Selection := Sel.With_Arg (Selection, "required", Long_Long_Integer (Required));
      Selection := Sel.With_Arg (Selection, "optional", Long_Long_Integer (Optional));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Object_Shape_Label;

   function Schema_Source_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Version : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Schema_Source_Label (Name => Name, Version => Version);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.schema_source_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "version", Humanize.Bounded_Text.Clean (Version));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Schema_Source_Label;

   function Shape_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Shape_Kind;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Shape_Label (Kind => Kind, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.shape_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Shape_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Shape_Label;

   function Unknown_Field_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Schema.Unknown_Field_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.schema.unknown_field_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Unknown_Field_Label;

   procedure Array_Shape_Label_Into
      (Context      : Humanize.Contexts.Context;
       Element_Type : Field_Type;
       Count        : Natural := 0;
       Count_Known  : Boolean := False;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Array_Shape_Label (Context, Element_Type, Count, Count_Known),
         Target, Written, Status);
   end Array_Shape_Label_Into;

   procedure Constraint_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Constraint_Label (Context, Name, Value), Target, Written, Status);
   end Constraint_Label_Into;

   procedure Default_Value_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Default_Value_Label (Context, Field_Name, Value), Target, Written, Status);
   end Default_Value_Label_Into;

   procedure Deprecated_Field_Label_Into
      (Context     : Humanize.Contexts.Context;
       Name        : String;
       Replacement : String := "";
       Target      : in out String;
       Written     : out Natural;
       Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Deprecated_Field_Label (Context, Name, Replacement), Target, Written, Status);
   end Deprecated_Field_Label_Into;

   procedure Enum_Options_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Enum_Options_Label (Context, Count), Target, Written, Status);
   end Enum_Options_Label_Into;

   procedure Example_Value_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Value      : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Example_Value_Label (Context, Field_Name, Value), Target, Written, Status);
   end Example_Value_Label_Into;

   procedure Field_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Field_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Field_State_Label (Context, State), Target, Written, Status);
   end Field_State_Label_Into;

   procedure Field_Type_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Field_Type;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Field_Type_Label (Context, Kind), Target, Written, Status);
   end Field_Type_Label_Into;

   procedure Missing_Required_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Missing_Required_Label (Context, Count), Target, Written, Status);
   end Missing_Required_Label_Into;

   procedure Object_Shape_Label_Into
      (Context  : Humanize.Contexts.Context;
       Fields   : Natural;
       Required : Natural := 0;
       Optional : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Object_Shape_Label (Context, Fields, Required, Optional),
         Target, Written, Status);
   end Object_Shape_Label_Into;

   procedure Schema_Source_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Version : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Schema_Source_Label (Context, Name, Version), Target, Written, Status);
   end Schema_Source_Label_Into;

   procedure Shape_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Shape_Kind;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Shape_Label (Context, Kind, Count), Target, Written, Status);
   end Shape_Label_Into;

   procedure Unknown_Field_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Unknown_Field_Label (Context, Name), Target, Written, Status);
   end Unknown_Field_Label_Into;

end Humanize.Schema.Localized;
