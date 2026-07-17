with Humanize.Domain_Details;
with Humanize.Status;

--  Human-readable labels for schema fields and data-shape metadata.
package Humanize.Schema is
   type Schema_Output_Mode is
     (Schema_Detailed,
      Schema_Compact,
      Schema_Accessible,
      Schema_Log);

   type Schema_Label_Options is record
      Mode             : Schema_Output_Mode := Schema_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_Schema_Label_Options : constant Schema_Label_Options :=
     (Mode             => Schema_Detailed,
      Include_Surface  => False,
      Include_Severity => False,
      Include_Tone     => False);

   subtype Schema_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   type Field_Type is
     (String_Field,
      Integer_Field,
      Decimal_Field,
      Boolean_Field,
      Date_Field,
      Date_Time_Field,
      Object_Field,
      Array_Field,
      Enum_Field,
      Binary_Field,
      Null_Field,
      Any_Field,
      Unknown_Field_Type);
   --  Broad schema field/data types supplied by the caller.

   type Field_Presence is
     (Required_Field,
      Optional_Field,
      Conditional_Field,
      Unknown_Presence);
   --  Presence requirement supplied by the caller.

   type Nullability is
     (Non_Nullable,
      Nullable,
      Nullability_Unknown);
   --  Whether a field accepts null.

   type Field_State is
     (Normal_Field,
      Deprecated_Field,
      Unknown_Field,
      Read_Only_Field,
      Write_Only_Field,
      Computed_Field);
   --  Presentation state for schema fields.

   type Shape_Kind is
     (Scalar_Shape,
      Object_Shape,
      Array_Shape,
      Map_Shape,
      Tuple_Shape,
      Union_Shape,
      Empty_Shape,
      Unknown_Shape);
   --  Broad data-shape categories.

   function Field_Type_Label
     (Kind : Field_Type)
      return Humanize.Status.Text_Result;
   --  @param Kind Field/data type.
   --  @return Human-readable field type label.

   function Field_Label
     (Name       : String;
      Kind       : Field_Type;
      Presence   : Field_Presence := Optional_Field;
      Nullable   : Nullability := Nullability_Unknown;
      State      : Field_State := Normal_Field)
      return Humanize.Status.Text_Result;
   --  @param Name Field name.
   --  @param Kind Field/data type.
   --  @param Presence Required/optional/conditional status.
   --  @param Nullable Nullability status.
   --  @param State Field presentation state.
   --  @return Human-readable field label.

   function Field_State_Label
     (State : Field_State)
      return Humanize.Status.Text_Result;
   --  @param State Field presentation state.
   --  @return Human-readable state label.

   function Unknown_Field_Label
     (Name : String)
      return Humanize.Status.Text_Result;
   --  @param Name Unknown field name.
   --  @return Human-readable unknown-field label.

   function Deprecated_Field_Label
     (Name        : String;
      Replacement : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Deprecated field name.
   --  @param Replacement Optional replacement field name.
   --  @return Human-readable deprecation label.

   function Array_Shape_Label
     (Element_Type : Field_Type;
      Count        : Natural := 0;
      Count_Known  : Boolean := False)
      return Humanize.Status.Text_Result;
   --  @param Element_Type Array element type.
   --  @param Count Element count when known.
   --  @param Count_Known Whether Count should be rendered.
   --  @return Human-readable array shape label.

   function Object_Shape_Label
     (Fields   : Natural;
      Required : Natural := 0;
      Optional : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Fields Total field count.
   --  @param Required Required field count.
   --  @param Optional Optional field count.
   --  @return Human-readable object shape label.

   function Shape_Label
     (Kind  : Shape_Kind;
      Count : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Kind Data-shape category.
   --  @param Count Optional item/field/member count.
   --  @return Human-readable shape label.

   function Schema_Summary_Label
     (Fields     : Natural;
      Required   : Natural := 0;
      Optional   : Natural := 0;
      Deprecated : Natural := 0;
      Unknown    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Fields Total field count.
   --  @param Required Required field count.
   --  @param Optional Optional field count.
   --  @param Deprecated Deprecated field count.
   --  @param Unknown Unknown field count.
   --  @return Compact schema inventory summary.

   function Constraint_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Caller-provided constraint name.
   --  @param Value Optional caller-provided constraint value.
   --  @return Human-readable constraint label.

   function Enum_Options_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Number of enum options.
   --  @return Human-readable enum option count label.

   function Default_Value_Label
     (Field_Name : String;
      Value      : String)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Field name.
   --  @param Value Caller-provided default value display.
   --  @return Human-readable default-value label.

   function Example_Value_Label
     (Field_Name : String;
      Value      : String)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Field name.
   --  @param Value Caller-provided example value display.
   --  @return Human-readable example-value label.

   function Schema_Source_Label
     (Name    : String;
      Version : String := "")
      return Humanize.Status.Text_Result;
   --  @param Name Schema name or source label.
   --  @param Version Optional caller-provided schema version.
   --  @return Human-readable schema source label.

   function Missing_Required_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Missing required field count.
   --  @return Human-readable missing-required-fields label.

   function Type_Mismatch_Label
     (Field_Name : String;
      Expected   : Field_Type;
      Actual     : Field_Type)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Field name.
   --  @param Expected Expected field type supplied by caller.
   --  @param Actual Actual field type supplied by caller.
   --  @return Human-readable type-mismatch label.

   function Type_Mismatch_Label
     (Field_Name : String;
      Expected   : Field_Type;
      Actual     : Field_Type;
      Options    : Schema_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Field_Name Field name.
   --  @param Expected Expected field type supplied by caller.
   --  @param Actual Actual field type supplied by caller.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable type-mismatch label with optional metadata.

   function Field_State_Metadata
     (State : Field_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Field presentation state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Type_Mismatch_Metadata
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @return Severity, tone, and final/actionable metadata for type mismatches.

   function Parse_Type_Mismatch_Label
     (Text     : String;
      Expected : Field_Type;
      Actual   : Field_Type)
      return Schema_Label_Parse_Result;
   --  @param Text Label in rendered type-mismatch form.
   --  @param Expected Expected field type supplied by caller.
   --  @param Actual Actual field type supplied by caller.
   --  @return Parsed field span, mismatch span, metadata, and consumed length.

   function Scan_Type_Mismatch_Label
     (Text     : String;
      Expected : Field_Type;
      Actual   : Field_Type)
      return Schema_Label_Parse_Result;
   --  @param Text Text beginning with a type-mismatch label.
   --  @param Expected Expected field type supplied by caller.
   --  @param Actual Actual field type supplied by caller.
   --  @return Parsed type-mismatch prefix and consumed length.

   procedure Field_Label_Into
     (Name       : String;
      Kind       : Field_Type;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Presence   : Field_Presence := Optional_Field;
      Nullable   : Nullability := Nullability_Unknown;
      State      : Field_State := Normal_Field);
   --  @param Name Field name.
   --  @param Kind Field/data type.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Presence Required/optional/conditional status.
   --  @param Nullable Nullability status.
   --  @param State Field presentation state.

   procedure Schema_Summary_Label_Into
     (Fields     : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Required   : Natural := 0;
      Optional   : Natural := 0;
      Deprecated : Natural := 0;
      Unknown    : Natural := 0);
   --  @param Fields Total field count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Required Required field count.
   --  @param Optional Optional field count.
   --  @param Deprecated Deprecated field count.
   --  @param Unknown Unknown field count.

   procedure Shape_Label_Into
     (Kind    : Shape_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0);
   --  @param Kind Data-shape category.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Count Optional item/field/member count.

   procedure Type_Mismatch_Label_Into
     (Field_Name : String;
      Expected   : Field_Type;
      Actual     : Field_Type;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Schema_Label_Options);
   --  @param Field_Name Field name.
   --  @param Expected Expected field type supplied by caller.
   --  @param Actual Actual field type supplied by caller.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

end Humanize.Schema;
