with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Contexts;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Parsing.Support;
with Humanize.Parsing.Unit_Aliases;
with Humanize.Status;

package body Humanize.Parsing.Implementation.Unit_Text_Helpers is
   use type Humanize.Status.Status_Code;
   use Ada.Strings.Unbounded;

   Rendered_Unit_Alias_Cache_Loaded : Boolean := False;
   Max_Rendered_Unit_Aliases : constant Positive := 6_000;

   type Rendered_Unit_Alias_Entry is record
      Label : Unbounded_String;
      Unit  : Humanize.Units.Unit_Kind := Humanize.Units.Meter;
   end record;

   type Rendered_Unit_Alias_Array is
     array (Positive range <>) of Rendered_Unit_Alias_Entry;

   Rendered_Unit_Alias_Cache :
     Rendered_Unit_Alias_Array (1 .. Max_Rendered_Unit_Aliases);
   Rendered_Unit_Alias_Count : Natural := 0;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;
   function Trim (Text : String) return String
      renames Humanize.Bounded_Text.Clean;
   function Is_Digit (Item : Character) return Boolean
      renames Humanize.Bounded_Text.Is_Digit;
   function Normalize_Native_Digits (Text : String) return String
      renames Humanize.Parsing.Support.Normalize_Native_Digits;
   function Numeric_Value
     (Text  : String;
      Value : out Long_Float)
      return Boolean
      renames Humanize.Parsing.Support.Numeric_Value;
   function Split_Number_Unit
     (Text        : String;
      Number_Text : out Natural;
      Unit_Start  : out Natural)
      return Boolean
      renames Humanize.Parsing.Support.Split_Number_Unit;
   function Scan_End (Text : String) return Natural
      renames Humanize.Parsing.Support.Scan_End;

   function Rendered_Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
     return Boolean
   is
      Item : constant String := Clean_Lower (Text);

      procedure Add_Alias
        (Label : String;
         Kind  : Humanize.Units.Unit_Kind)
      is
         Alias : constant String := Clean_Lower (Label);
      begin
         if Alias'Length = 0 then
            return;
         end if;

         for Index in 1 .. Rendered_Unit_Alias_Count loop
            if To_String (Rendered_Unit_Alias_Cache (Index).Label) = Alias then
               return;
            end if;
         end loop;

         if Rendered_Unit_Alias_Count < Max_Rendered_Unit_Aliases then
            Rendered_Unit_Alias_Count := Rendered_Unit_Alias_Count + 1;
            Rendered_Unit_Alias_Cache (Rendered_Unit_Alias_Count) :=
              (Label => To_Unbounded_String (Alias),
               Unit  => Kind);
         end if;
      end Add_Alias;

      procedure Add_Rendered
        (Locale : String;
         Count  : Long_Float;
         Kind   : Humanize.Units.Unit_Kind)
      is
         Runtime_Loaded : Boolean;
         Context : constant Humanize.Contexts.Context :=
           Humanize.I18N_Rendering.Default_Context (Locale, Runtime_Loaded);
      begin
         if not Runtime_Loaded then
            return;
         end if;

         declare
            Rendered : constant Humanize.Status.Text_Result :=
              Humanize.Units.Format (Context, Count, Kind);
            Full : constant String := Result_Text (Rendered);
            Last_Number : Natural;
            Unit_Start : Natural;
         begin
            if Rendered.Status /= Humanize.Status.Ok
              or else not Split_Number_Unit (Full, Last_Number, Unit_Start)
            then
               return;
            end if;

            Add_Alias (Full (Unit_Start .. Full'Last), Kind);
         end;
      end Add_Rendered;

      procedure Add_Rendered
        (Locale : String;
         Count  : Natural;
         Kind   : Humanize.Units.Unit_Kind)
      is
         Runtime_Loaded : Boolean;
         Context : constant Humanize.Contexts.Context :=
           Humanize.I18N_Rendering.Default_Context (Locale, Runtime_Loaded);
      begin
         if not Runtime_Loaded then
            return;
         end if;

         declare
            Rendered : constant Humanize.Status.Text_Result :=
              Humanize.Units.Format (Context, Count, Kind);
            Full : constant String := Result_Text (Rendered);
            Last_Number : Natural;
            Unit_Start : Natural;
         begin
            if Rendered.Status /= Humanize.Status.Ok
              or else not Split_Number_Unit (Full, Last_Number, Unit_Start)
            then
               return;
            end if;

            Add_Alias (Full (Unit_Start .. Full'Last), Kind);
         end;
      end Add_Rendered;
   begin
      Unit := Humanize.Units.Meter;
      if Item'Length = 0 then
         return False;
      end if;

      if not Rendered_Unit_Alias_Cache_Loaded then
         for Locale of Humanize.Locales.Shipped_Locales loop
            for Kind in Humanize.Units.Unit_Kind loop
               Add_Rendered (Locale.all, 1, Kind);
               Add_Rendered (Locale.all, 5, Kind);
               Add_Rendered (Locale.all, 1.0, Kind);
               Add_Rendered (Locale.all, 5.0, Kind);
            end loop;
         end loop;

         Rendered_Unit_Alias_Cache_Loaded := True;
      end if;

      for Index in 1 .. Rendered_Unit_Alias_Count loop
         if To_String (Rendered_Unit_Alias_Cache (Index).Label) = Item then
            Unit := Rendered_Unit_Alias_Cache (Index).Unit;
            return True;
         end if;
      end loop;

      return False;
   exception
      when others => --  parse failure normalization
         Unit := Humanize.Units.Meter;
         return False;
   end Rendered_Unit_Value;

   function Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      if Humanize.Parsing.Unit_Aliases.Static_Unit_Value (Item, Unit) then
         return True;
      end if;

      return Humanize.Parsing.Unit_Aliases.Generated_Unit_Value (Item, Unit)
        or else Rendered_Unit_Value (Item, Unit);
   end Unit_Value;

   function Parse_Unit
     (Text : String)
      return Unit_Parse_Result
      is separate;

   function Scan_Unit
     (Text : String)
      return Unit_Parse_Result
   is
      Last : constant Natural := Scan_End (Text);
   begin
      if Text'Length = 0 or else Last < Text'First then
         return
           (Status => Humanize.Status.Invalid_Argument,
            Error_Position => Text'First,
            others => <>);
      end if;

      for Stop in reverse Text'First .. Last loop
         declare
            Result : constant Unit_Parse_Result :=
              Parse_Unit (Text (Text'First .. Stop));
         begin
            if Result.Status = Humanize.Status.Ok then
               return Result;
            end if;
         end;
      end loop;

      return
        (Status => Humanize.Status.Invalid_Argument,
         Error_Position => Text'First,
         others => <>);
   end Scan_Unit;

   function Known_Compound_Unit (Unit : String) return Boolean is
      U : constant String := Clean_Lower (Unit);
   begin
      return U = "ms" or else U = "us" or else U = "s"
        or else U = "db" or else U = "dbm" or else U = "tbw"
        or else U = "hz" or else U = "hz refresh"
        or else U = "nits" or else U = "dpi" or else U = "iops"
        or else U = "k iops" or else U = "m iops"
        or else U = "bit" or else U = "kbit" or else U = "mbit"
        or else U = "gbit"
        or else U = "kg/m3" or else U = "m/s2" or else U = "n m"
        or else U = "l/100 km" or else U = "ml/s"
        or else U = "l/s" or else U = "ma" or else U = "a"
        or else U = "kv" or else U = "v" or else U = "ppi"
        or else U = "mohm" or else U = "kohm"
        or else U = "ohm" or else U = "nf" or else U = "uf"
        or else U = "f" or else U = "mh" or else U = "h"
        or else U = "mol/l" or else U = "mpg"
        or else U = "gb/s" or else U = "mb/s" or else U = "kb/s"
        or else U = "m ops/s" or else U = "k ops/s"
        or else U = "ops/s"
        or else U = "gbit/s" or else U = "mbit/s"
        or else U = "kbit/s" or else U = "bit/s"
        or else U = "gib/s" or else U = "mib/s" or else U = "kib/s"
        or else U = "b/s" or else U = "% cpu" or else U = "% battery"
        or else U = "in screen" or else U = "pt";
   end Known_Compound_Unit;
end Humanize.Parsing.Implementation.Unit_Text_Helpers;
