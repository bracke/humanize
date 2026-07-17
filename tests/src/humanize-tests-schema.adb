with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Schema;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Schema is
   use Humanize.Schema;
   use Humanize.Status;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Field_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Field_Type_Label (String_Field), "string field", "string type label");
      Check
        (Field_Label ("email", String_Field, Required_Field, Non_Nullable),
         "required non-null string field email",
         "required non-null field");
      Check
        (Field_Label ("age", Integer_Field, Optional_Field, Nullable),
         "optional nullable integer field age",
         "optional nullable field");
      Check
        (Field_Label ("status", Enum_Field, Required_Field, State => Deprecated_Field),
         "deprecated required enum field status",
         "deprecated field state in field label");
      Check
        (Field_Label ("id", String_Field, Required_Field, State => Read_Only_Field),
         "read-only required string field id",
         "read-only field label");
      Check (Field_State_Label (Computed_Field), "computed field", "computed state label");
      Check (Unknown_Field_Label ("extra"), "unknown field extra", "unknown field label");
      Check
        (Deprecated_Field_Label ("old_name", "new_name"),
         "deprecated field old_name, use new_name",
         "deprecated replacement label");

      Invalid := Field_Label (" ", String_Field);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid field name",
         "invalid field name rejected");
   end Test_Field_Labels;

   procedure Test_Shape_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Array_Shape_Label (Object_Field), "array of objects", "array element label");
      Check
        (Array_Shape_Label (Object_Field, Count => 3, Count_Known => True),
         "array of 3 objects",
         "array count label");
      Check
        (Object_Shape_Label (7, Required => 2, Optional => 5),
         "object with 7 fields, 2 required, 5 optional",
         "object shape label");
      Check (Shape_Label (Scalar_Shape), "scalar value", "scalar shape");
      Check (Shape_Label (Map_Shape, Count => 4), "map with 4 entries", "map shape");
      Check (Shape_Label (Union_Shape, Count => 2), "union of 2 types", "union shape");
      Check (Shape_Label (Empty_Shape), "empty shape", "empty shape");
   end Test_Shape_Labels;

   procedure Test_Schema_Summaries (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Mismatch_Detailed : constant Text_Result :=
        Type_Mismatch_Label
          ("age", Integer_Field, String_Field,
           Schema_Label_Options'
             (Mode             => Schema_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Mismatch : constant Schema_Label_Parse_Result :=
        Parse_Type_Mismatch_Label
          ("field age expected integer, got string", Integer_Field,
           String_Field);
      Scanned_Mismatch : constant Schema_Label_Parse_Result :=
        Scan_Type_Mismatch_Label
          ("field age expected integer, got string trailing", Integer_Field,
           String_Field);
   begin
      Check
        (Schema_Summary_Label (8, Required => 3, Optional => 5, Deprecated => 1),
         "8 fields, 3 required, 5 optional, 1 deprecated",
         "schema summary label");
      Check
        (Schema_Summary_Label (4, Unknown => 2),
         "4 fields, 2 unknown",
         "schema unknown summary");
      Check (Missing_Required_Label (0), "no missing required fields", "no missing required");
      Check (Missing_Required_Label (2), "2 missing required fields", "missing required");
      Check
        (Type_Mismatch_Label ("age", Integer_Field, String_Field),
         "field age expected integer, got string",
         "type mismatch label");
      Check
        (Mismatch_Detailed,
         "[schema danger] field age expected integer, got string",
         "type mismatch option metadata");
      AUnit.Assertions.Assert
        (Parsed_Mismatch.Status = Ok
         and then Parsed_Mismatch.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Mismatch.Name_Length = 9,
         "parse schema mismatch metadata");
      AUnit.Assertions.Assert
        (Scanned_Mismatch.Status = Ok
         and then Scanned_Mismatch.Consumed = 38,
         "scan schema mismatch prefix");
      Check (Constraint_Label ("minimum", "3"), "minimum constraint 3", "constraint value");
      Check (Constraint_Label ("format"), "format constraint", "constraint name only");
      Check (Enum_Options_Label (3), "3 enum options", "enum option count");
      Check (Default_Value_Label ("active", "true"), "field active defaults to true", "default value");
      Check (Default_Value_Label ("nickname", ""), "field nickname has no default", "no default value");
      Check
        (Example_Value_Label ("email", "user@example.com"),
         "field email example user@example.com",
         "example value");
      Check (Schema_Source_Label ("User", "v2"), "schema User version v2", "schema source version");

      Invalid := Constraint_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid constraint",
         "invalid constraint rejected");

      Invalid := Example_Value_Label ("email", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid example value",
         "invalid example rejected");

      Invalid := Type_Mismatch_Label (" ", Integer_Field, String_Field);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid field name",
         "invalid mismatch field rejected");
   end Test_Schema_Summaries;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Exact  : String (1 .. 40);
      Tiny   : String (1 .. 9);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Field_Label_Into
        ("email", String_Field, Exact, Written, Code,
         Required_Field, Non_Nullable);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Written = 36
         and then Exact (1 .. Written) = "required non-null string field email",
         "field bounded exact text");

      Schema_Summary_Label_Into (8, Tiny, Written, Code, Required => 3);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 9 and then Tiny = "8 fields,",
         "schema summary bounded overflow prefix");

      Shape_Label_Into (Map_Shape, Offset, Written, Code, Count => 4);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "shape bounded rejects non-1-based buffers");

      Field_Label_Into (" ", String_Field, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "field bounded returns validation status");

      Type_Mismatch_Label_Into
        ("age", Integer_Field, String_Field, Exact, Written, Code,
         Schema_Label_Options'
           (Mode             => Schema_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 40
         and then Exact = "[schema danger] field age expected integ",
         "type mismatch option bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize schema tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Field_Labels'Access, "field labels");
      Register_Routine (T, Test_Shape_Labels'Access, "shape labels");
      Register_Routine (T, Test_Schema_Summaries'Access, "schema summaries");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Schema;
