with Humanize.Contexts;
with Humanize.Status;

--  Byte-size humanization (binary KiB/MiB/... or decimal kB/MB/...).
--
--  Humanize formats the numeric value itself as locale-neutral ASCII and passes
--  it to i18n as the "value" argument; the unit word comes from the catalog.
--  This package selects keys only; it must not call I18N.Runtime directly
--  (HUM-INV-002).
package Humanize.Bytes is

   type Byte_Count is mod 2 ** 64;

   type Byte_Unit_System is
     (Binary,
      Decimal);

   subtype Fraction_Digit_Count is Natural range 0 .. 3;

   type Byte_Options is record
      Unit_System             : Byte_Unit_System := Binary;
      Maximum_Fraction_Digits : Fraction_Digit_Count := 1;
      Suppress_Trailing_Zero  : Boolean := True;
   end record;

   Default_Byte_Options : constant Byte_Options :=
     (Unit_System             => Binary,
      Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   --  Convenience API: humanize Bytes, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result;

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options);

end Humanize.Bytes;
