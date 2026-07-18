with AUnit.Assertions;

with Ada.Strings.Unbounded;

with Humanize.Status;
with Humanize.Strings;
with Humanize.Tests.Support;

package body Humanize.Tests.Strings is
   use Humanize.Status;
   use Ada.Strings.Unbounded;
   use type Humanize.Strings.File_Mode_Kind;
   use type Humanize.Strings.Inflection_Source;
   use type Humanize.Strings.Text_Change_Kind;

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

   procedure Test_String_Helpers (T : in out AUnit.Test_Cases.Test_Case'Class) is separate;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize string tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_String_Helpers'Access, "string helpers");
   end Register_Tests;
end Humanize.Tests.Strings;
