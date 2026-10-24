with AUnit.Assertions;

with Ada.Strings.Unbounded;

with Humanize.Contexts;
with Humanize.Locales;
with Humanize.Parsing.Phrases;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Domain_Labels is

   use type Humanize.Status.Status_Code;

   type Check_Mode is (Phrase, Plain, Prefix);

   --  Got is Ok, non-empty and free of template braces; in English it is
   --  English (the parent's); in German the phrase catalog reads a one-key
   --  label back (Phrase), and a decorated label keeps English's "[...] "
   --  prefix (Prefix).
   procedure Check
     (Locale  : String;
      Key     : String;
      Mode    : Check_Mode;
      Got     : Humanize.Status.Text_Result;
      English : Humanize.Status.Text_Result)
   is
      Text : constant String := Ada.Strings.Unbounded.To_String (Got.Text);
      Want : constant String := Ada.Strings.Unbounded.To_String (English.Text);
   begin
      AUnit.Assertions.Assert
        (Got.Status = Humanize.Status.Ok and then Text /= ""
         and then (for all C of Text => C /= '{' and then C /= '}'),
         Locale & " " & Key & " renders: [" & Text & "]");
      if Locale = "en" then
         AUnit.Assertions.Assert (Text = Want, Key & " is its parent in English: [" & Text & "]");
      elsif Locale = "de" and then Mode = Phrase then
         AUnit.Assertions.Assert
           (Humanize.Parsing.Phrases.Parse (Humanize.Tests.Support.Locale (Locale), Key, Text).Status
              = Humanize.Status.Ok,
            Key & " reads back in German: [" & Text & "]");
      elsif Locale = "de" and then Mode = Prefix and then Want'Length > 0 and then Want (Want'First) = '[' then
         AUnit.Assertions.Assert
           (Text'Length > 0 and then Text (Text'First) = '[', Key & " keeps its prefix in German: [" & Text & "]");
      end if;
   end Check;

   procedure Check_Group_1 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_2 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_3 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_4 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_5 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_6 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_7 (Locale : String; C : Humanize.Contexts.Context) is separate;
   procedure Check_Group_8 (Locale : String; C : Humanize.Contexts.Context) is separate;

   procedure Test_Every_Locale (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      for Name of Humanize.Locales.All_Shipped_Locales loop
         declare
            Locale : constant String := Name.all;
            C      : constant Humanize.Contexts.Context := Humanize.Tests.Support.Locale (Locale);
         begin
            Check_Group_1 (Locale, C);
            Check_Group_2 (Locale, C);
            Check_Group_3 (Locale, C);
            Check_Group_4 (Locale, C);
            Check_Group_5 (Locale, C);
            Check_Group_6 (Locale, C);
            Check_Group_7 (Locale, C);
            Check_Group_8 (Locale, C);
         end;
      end loop;
   end Test_Every_Locale;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize domain label tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Every_Locale'Access, "every domain label in every shipped locale");
   end Register_Tests;

end Humanize.Tests.Domain_Labels;
