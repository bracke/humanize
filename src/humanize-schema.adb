with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.Schema is
   use type Humanize.Status.Status_Code;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Digits_Image (Value : Natural) return String
      renames Humanize.Bounded_Text.Image;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : Schema_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when Schema_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when Schema_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when Schema_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when Schema_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Clean_Name (Name : String) return String is
   begin
      return Clean (Name);
   end Clean_Name;

   function Type_Text (Kind : Field_Type) return String is
   begin
      case Kind is
         when String_Field => return "string";
         when Integer_Field => return "integer";
         when Decimal_Field => return "decimal";
         when Boolean_Field => return "boolean";
         when Date_Field => return "date";
         when Date_Time_Field => return "date-time";
         when Object_Field => return "object";
         when Array_Field => return "array";
         when Enum_Field => return "enum";
         when Binary_Field => return "binary";
         when Null_Field => return "null";
         when Any_Field => return "any";
         when Unknown_Field_Type => return "unknown";
      end case;
   end Type_Text;

   function Presence_Text (Presence : Field_Presence) return String is
   begin
      case Presence is
         when Required_Field => return "required";
         when Optional_Field => return "optional";
         when Conditional_Field => return "conditional";
         when Unknown_Presence => return "presence unknown";
      end case;
   end Presence_Text;

   function Nullability_Text (Mode : Nullability) return String is
   begin
      case Mode is
         when Non_Nullable => return "non-null";
         when Nullable => return "nullable";
         when Nullability_Unknown => return "";
      end case;
   end Nullability_Text;

   function State_Prefix (State : Field_State) return String is
   begin
      case State is
         when Normal_Field => return "";
         when Deprecated_Field => return "deprecated ";
         when Unknown_Field => return "unknown ";
         when Read_Only_Field => return "read-only ";
         when Write_Only_Field => return "write-only ";
         when Computed_Field => return "computed ";
      end case;
   end State_Prefix;

   function State_Text (State : Field_State) return String is
   begin
      return
        (case State is
            when Normal_Field     => "normal field",
            when Deprecated_Field => "deprecated field",
            when Unknown_Field    => "unknown field",
            when Read_Only_Field  => "read-only field",
            when Write_Only_Field => "write-only field",
            when Computed_Field   => "computed field");
   end State_Text;

   function Field_State_Suffix (State : Field_State) return String is
   begin
      return State_Text (State);
   end Field_State_Suffix;

   function Field_State_Metadata
     (State : Field_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Schema_Surface, Field_State_Suffix (State));
   end Field_State_Metadata;

   function Type_Mismatch_Metadata
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.Schema_Surface, "type mismatch");
   end Type_Mismatch_Metadata;

   function Field_Type_Label
     (Kind : Field_Type)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Type_Text (Kind) & " field");
   end Field_Type_Label;

   function Field_Label
     (Name       : String;
      Kind       : Field_Type;
      Presence   : Field_Presence := Optional_Field;
      Nullable   : Nullability := Nullability_Unknown;
      State      : Field_State := Normal_Field)
      return Humanize.Status.Text_Result
   is
      Field_Name : constant String := Clean_Name (Name);
      Null_Text  : constant String := Nullability_Text (Nullable);
      Details    : constant String :=
        (if Null_Text'Length = 0 then
            Presence_Text (Presence) & " " & Type_Text (Kind)
         else
            Presence_Text (Presence) & " " & Null_Text & " " & Type_Text (Kind));
   begin
      if Field_Name'Length = 0 then
         return Invalid_Text ("invalid field name");
      end if;

      return Ok_Text (State_Prefix (State) & Details & " field " & Field_Name);
   end Field_Label;

   function Field_State_Label
     (State : Field_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Field_State_Suffix (State));
   end Field_State_Label;

   function Unknown_Field_Label
     (Name : String)
      return Humanize.Status.Text_Result
   is
      Field_Name : constant String := Clean_Name (Name);
   begin
      if Field_Name'Length = 0 then
         return Invalid_Text ("invalid field name");
      end if;
      return Ok_Text ("unknown field " & Field_Name);
   end Unknown_Field_Label;

   function Deprecated_Field_Label
     (Name        : String;
      Replacement : String := "")
      return Humanize.Status.Text_Result
   is
      Field_Name : constant String := Clean_Name (Name);
      Repl       : constant String := Clean_Name (Replacement);
   begin
      if Field_Name'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Repl'Length = 0 then
         return Ok_Text ("deprecated field " & Field_Name);
      else
         return Ok_Text ("deprecated field " & Field_Name & ", use " & Repl);
      end if;
   end Deprecated_Field_Label;

   function Array_Shape_Label
     (Element_Type : Field_Type;
      Count        : Natural := 0;
      Count_Known  : Boolean := False)
      return Humanize.Status.Text_Result
   is
      Element : constant String := Type_Text (Element_Type);
   begin
      if Count_Known then
         return Ok_Text ("array of " & Count_Text (Count, Element, Element & "s"));
      else
         return Ok_Text ("array of " & Element & "s");
      end if;
   end Array_Shape_Label;

   function Object_Shape_Label
     (Fields   : Natural;
      Required : Natural := 0;
      Optional : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String ("object with " & Count_Text (Fields, "field", "fields"));
   begin
      if Required > 0 then
         Append (Text, ", " & Count_Text (Required, "required", "required"));
      end if;
      if Optional > 0 then
         Append (Text, ", " & Count_Text (Optional, "optional", "optional"));
      end if;
      return Ok_Text (To_String (Text));
   end Object_Shape_Label;

   function Shape_Label
     (Kind  : Shape_Kind;
      Count : Natural := 0)
      return Humanize.Status.Text_Result
   is
   begin
      case Kind is
         when Scalar_Shape =>
            return Ok_Text ("scalar value");
         when Object_Shape =>
            return Ok_Text
              ((if Count = 0 then "object" else "object with " & Count_Text (Count, "field", "fields")));
         when Array_Shape =>
            return Ok_Text
              ((if Count = 0 then "array" else "array with " & Count_Text (Count, "item", "items")));
         when Map_Shape =>
            return Ok_Text
              ((if Count = 0 then "map" else "map with " & Count_Text (Count, "entry", "entries")));
         when Tuple_Shape =>
            return Ok_Text
              ((if Count = 0 then "tuple" else "tuple with " & Count_Text (Count, "item", "items")));
         when Union_Shape =>
            return Ok_Text
              ((if Count = 0 then "union" else "union of " & Count_Text (Count, "type", "types")));
         when Empty_Shape =>
            return Ok_Text ("empty shape");
         when Unknown_Shape =>
            return Ok_Text ("unknown shape");
      end case;
   end Shape_Label;

   function Schema_Summary_Label
     (Fields     : Natural;
      Required   : Natural := 0;
      Optional   : Natural := 0;
      Deprecated : Natural := 0;
      Unknown    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      Text : Unbounded_String :=
        To_Unbounded_String (Count_Text (Fields, "field", "fields"));
   begin
      if Required > 0 then
         Append (Text, ", " & Count_Text (Required, "required", "required"));
      end if;
      if Optional > 0 then
         Append (Text, ", " & Count_Text (Optional, "optional", "optional"));
      end if;
      if Deprecated > 0 then
         Append (Text, ", " & Count_Text (Deprecated, "deprecated", "deprecated"));
      end if;
      if Unknown > 0 then
         Append (Text, ", " & Count_Text (Unknown, "unknown", "unknown"));
      end if;
      return Ok_Text (To_String (Text));
   end Schema_Summary_Label;

   function Constraint_Label
     (Name  : String;
      Value : String := "")
      return Humanize.Status.Text_Result
   is
      Constraint_Name : constant String := Clean_Name (Name);
      Constraint_Value : constant String := Clean_Name (Value);
   begin
      if Constraint_Name'Length = 0 then
         return Invalid_Text ("invalid constraint");
      elsif Constraint_Value'Length = 0 then
         return Ok_Text (Constraint_Name & " constraint");
      else
         return Ok_Text (Constraint_Name & " constraint " & Constraint_Value);
      end if;
   end Constraint_Label;

   function Enum_Options_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Text (Count, "enum option", "enum options"));
   end Enum_Options_Label;

   function Default_Value_Label
     (Field_Name : String;
      Value      : String)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean_Name (Field_Name);
      Default : constant String := Clean_Name (Value);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Default'Length = 0 then
         return Ok_Text ("field " & Field & " has no default");
      else
         return Ok_Text ("field " & Field & " defaults to " & Default);
      end if;
   end Default_Value_Label;

   function Example_Value_Label
     (Field_Name : String;
      Value      : String)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean_Name (Field_Name);
      Example : constant String := Clean_Name (Value);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      elsif Example'Length = 0 then
         return Invalid_Text ("invalid example value");
      else
         return Ok_Text ("field " & Field & " example " & Example);
      end if;
   end Example_Value_Label;

   function Schema_Source_Label
     (Name    : String;
      Version : String := "")
      return Humanize.Status.Text_Result
   is
      Source : constant String := Clean_Name (Name);
      Version_Text : constant String := Clean_Name (Version);
   begin
      if Source'Length = 0 then
         return Invalid_Text ("invalid schema source");
      elsif Version_Text'Length = 0 then
         return Ok_Text ("schema " & Source);
      else
         return Ok_Text ("schema " & Source & " version " & Version_Text);
      end if;
   end Schema_Source_Label;

   function Missing_Required_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      if Count = 0 then
         return Ok_Text ("no missing required fields");
      else
         return Ok_Text (Count_Text (Count, "missing required field", "missing required fields"));
      end if;
   end Missing_Required_Label;

   function Type_Mismatch_Label
     (Field_Name : String;
      Expected   : Field_Type;
      Actual     : Field_Type)
      return Humanize.Status.Text_Result
   is
      Field : constant String := Clean_Name (Field_Name);
   begin
      if Field'Length = 0 then
         return Invalid_Text ("invalid field name");
      end if;

      return Ok_Text
        ("field " & Field & " expected " & Type_Text (Expected)
         & ", got " & Type_Text (Actual));
   end Type_Mismatch_Label;

   function Type_Mismatch_Label
     (Field_Name : String;
      Expected   : Field_Type;
      Actual     : Field_Type;
      Options    : Schema_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Type_Mismatch_Label (Field_Name, Expected, Actual);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Type_Mismatch_Metadata, Domain_Options (Options));
   end Type_Mismatch_Label;

   function Mismatch_Suffix
     (Expected : Field_Type;
      Actual   : Field_Type)
      return String
   is
   begin
      return "expected " & Type_Text (Expected) & ", got " & Type_Text (Actual);
   end Mismatch_Suffix;

   function Parse_Type_Mismatch_Label
     (Text     : String;
      Expected : Field_Type;
      Actual   : Field_Type)
      return Schema_Label_Parse_Result
   is
      Result : Schema_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.Schema_Surface,
         Mismatch_Suffix (Expected, Actual));
      Result.Metadata := Type_Mismatch_Metadata;
      return Result;
   end Parse_Type_Mismatch_Label;

   function Scan_Type_Mismatch_Label
     (Text     : String;
      Expected : Field_Type;
      Actual   : Field_Type)
      return Schema_Label_Parse_Result
   is
      Result : Schema_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.Schema_Surface,
         Mismatch_Suffix (Expected, Actual));
      Result.Metadata := Type_Mismatch_Metadata;
      return Result;
   end Scan_Type_Mismatch_Label;

   procedure Field_Label_Into
     (Name       : String;
      Kind       : Field_Type;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Presence   : Field_Presence := Optional_Field;
      Nullable   : Nullability := Nullability_Unknown;
      State      : Field_State := Normal_Field)
   is
      Result : constant Humanize.Status.Text_Result :=
        Field_Label (Name, Kind, Presence, Nullable, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Field_Label_Into;

   procedure Schema_Summary_Label_Into
     (Fields     : Natural;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Required   : Natural := 0;
      Optional   : Natural := 0;
      Deprecated : Natural := 0;
      Unknown    : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result :=
        Schema_Summary_Label (Fields, Required, Optional, Deprecated, Unknown);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Schema_Summary_Label_Into;

   procedure Shape_Label_Into
     (Kind    : Shape_Kind;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Count   : Natural := 0)
   is
      Result : constant Humanize.Status.Text_Result := Shape_Label (Kind, Count);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Shape_Label_Into;

   procedure Type_Mismatch_Label_Into
     (Field_Name : String;
      Expected   : Field_Type;
      Actual     : Field_Type;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Schema_Label_Options)
   is
   begin
      Copy_Result
        (Type_Mismatch_Label (Field_Name, Expected, Actual, Options), Target,
         Written, Status);
   end Type_Mismatch_Label_Into;

end Humanize.Schema;
