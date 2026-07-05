with Humanize.Contexts;
with Humanize.Status;

--  Byte-size humanization (binary KiB/MiB/... or decimal kB/MB/...).
--
--  Humanize chooses the byte unit and prepares a locale-neutral numeric value;
--  i18n renders the number and unit text through the catalog.
--  This package selects keys only; it must not call I18N.Runtime directly
--  (HUM-INV-002).
package Humanize.Bytes is

   type Byte_Count is mod 2 ** 64;

   type Byte_Unit_System is
     (Binary,
      Decimal,
      Auto);

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

   Binary_Byte_Options : constant Byte_Options :=
     (Unit_System             => Binary,
      Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   Decimal_Byte_Options : constant Byte_Options :=
     (Unit_System             => Decimal,
      Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   Auto_Byte_Options : constant Byte_Options :=
     (Unit_System             => Auto,
      Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   --  Convenience API: humanize Bytes, owned result.
   function Format
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Bytes Byte count to format.
   --  @param Options Byte unit and fraction policy.
   --  @return Rendered byte-size result.

   --  Bounded API: render into caller-owned Target. Target must be 1-based.
   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options);
   --  @param Context Formatting context.
   --  @param Bytes Byte count to format.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Byte unit and fraction policy.

   function File_Size_Summary
     (Context    : Humanize.Contexts.Context;
      File_Count : Natural;
      Total      : Byte_Count;
      Options    : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param File_Count Number of files.
   --  @param Total Total byte size.
   --  @param Options Byte unit and fraction policy.
   --  @return Deterministic file-count and total-size summary.

   function Transfer_Remaining_Label
     (Context   : Humanize.Contexts.Context;
      Remaining : Byte_Count;
      Options   : Byte_Options := Auto_Byte_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Remaining Remaining byte count.
   --  @param Options Byte unit and fraction policy.
   --  @return Deterministic transfer-remaining label.

   function Transfer_Remaining_Label
     (Context          : Humanize.Contexts.Context;
      Remaining        : Byte_Count;
      Bytes_Per_Second : Byte_Count;
      Options          : Byte_Options := Auto_Byte_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Remaining Remaining byte count.
   --  @param Bytes_Per_Second Transfer rate in bytes per second.
   --  @param Options Byte unit and fraction policy.
   --  @return Deterministic transfer-remaining label with rate.

   function Disk_Usage_Label
     (Context : Humanize.Contexts.Context;
      Used    : Byte_Count;
      Total   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Used Used byte count.
   --  @param Total Total byte count.
   --  @param Options Byte unit and fraction policy.
   --  @return Deterministic disk usage label.

   procedure File_Size_Summary_Into
     (Context    : Humanize.Contexts.Context;
      File_Count : Natural;
      Total      : Byte_Count;
      Target     : in out String;
      Written    : out Natural;
      Status     : out Humanize.Status.Status_Code;
      Options    : Byte_Options := Default_Byte_Options);
   --  @param Context Formatting context.
   --  @param File_Count Number of files.
   --  @param Total Total byte size.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Byte unit and fraction policy.

   procedure Transfer_Remaining_Label_Into
     (Context   : Humanize.Contexts.Context;
      Remaining : Byte_Count;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Byte_Options := Auto_Byte_Options);
   --  @param Context Formatting context.
   --  @param Remaining Remaining byte count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Byte unit and fraction policy.

   procedure Transfer_Remaining_Label_Into
     (Context          : Humanize.Contexts.Context;
      Remaining        : Byte_Count;
      Bytes_Per_Second : Byte_Count;
      Target           : in out String;
      Written          : out Natural;
      Status           : out Humanize.Status.Status_Code;
      Options          : Byte_Options := Auto_Byte_Options);
   --  @param Context Formatting context.
   --  @param Remaining Remaining byte count.
   --  @param Bytes_Per_Second Transfer rate in bytes per second.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Byte unit and fraction policy.

   procedure Disk_Usage_Label_Into
     (Context : Humanize.Contexts.Context;
      Used    : Byte_Count;
      Total   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options);
   --  @param Context Formatting context.
   --  @param Used Used byte count.
   --  @param Total Total byte count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Byte unit and fraction policy.

end Humanize.Bytes;
