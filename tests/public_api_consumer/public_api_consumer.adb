with Ada.Command_Line;
with Ada.Text_IO;

with I18N.Runtime;

with Humanize.Bounded_Text;
with Humanize.Bytes;
with Humanize.Catalogs;
with Humanize.Colors;
with Humanize.Colors.CSS;
with Humanize.Contexts;
with Humanize.Cross_Domain;
with Humanize.Durations;
with Humanize.Numbers;
with Humanize.Parsing;
with Humanize.Parsing.Numbers;
with Humanize.Phrases.Locales;
with Humanize.Status;
with Humanize.Strings.Core;

with Public_API_Consumer_Runtime;

procedure Public_API_Consumer is
   use type Humanize.Status.Status_Code;

   Loaded : I18N.Runtime.Load_Result;
   Errors : Natural := 0;

   procedure Check
     (Condition : Boolean;
      Label     : String)
   is
   begin
      if not Condition then
         Errors := Errors + 1;
         Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "error: " & Label);
      end if;
   end Check;

   function Text (Result : Humanize.Status.Text_Result) return String is
     (Humanize.Bounded_Text.Result_Text (Result));
begin
   Humanize.Catalogs.Load_Defaults
     (Public_API_Consumer_Runtime.Runtime, Loaded);

   declare
      Context : constant Humanize.Contexts.Context :=
        Humanize.Contexts.Create
          (Public_API_Consumer_Runtime.Runtime'Access, "en");
      Bytes : constant Humanize.Status.Text_Result :=
        Humanize.Bytes.Format (Context, 1_536);
      Duration : constant Humanize.Status.Text_Result :=
        Humanize.Durations.Format (Context, 90);
      Number : constant Humanize.Status.Text_Result :=
        Humanize.Numbers.Compact (Context, 1_200_000);
      Title : constant Humanize.Status.Text_Result :=
        Humanize.Strings.Core.Title_Case ("public api consumer");
      Hex : constant Humanize.Status.Text_Result :=
        Humanize.Colors.CSS.Hex_Color
          ((Red => 51, Green => 102, Blue => 153));
      Parsed_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("1.5 KiB");
      Parsed_Number : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Numbers.Parse_Cardinal ("forty two");
      Product : constant Humanize.Status.Text_Result :=
        Humanize.Cross_Domain.Product_Code_Label
          ("9783161484100", Humanize.Cross_Domain.ISBN_13_Code);
      CSS : Humanize.Colors.CSS_Color;
      Color_Status : constant Humanize.Status.Status_Code :=
        Humanize.Colors.Parse_CSS_Color ("rebeccapurple", CSS);
      Supported_Phrases : constant Boolean :=
        Humanize.Phrases.Locales.Is_Supported_Phrase_Locale ("en");
   begin
      Check (Text (Bytes)'Length > 0, "bytes facade returned empty text");
      Check (Text (Duration)'Length > 0, "duration facade returned empty text");
      Check (Text (Number)'Length > 0, "number facade returned empty text");
      Check (Text (Title) = "Public Api Consumer", "strings child facade changed");
      Check (Text (Hex) = "#336699", "colors child facade changed");
      Check (Parsed_Bytes.Status = Humanize.Status.Ok, "byte parser failed");
      Check (Parsed_Number.Status = Humanize.Status.Ok, "number parser failed");
      Check (Text (Product)'Length > 0, "cross-domain facade returned empty text");
      Check (Color_Status = Humanize.Status.Ok, "root colors facade failed");
      Check (Supported_Phrases, "phrase locale facade does not support en");
   end;

   if Errors = 0 then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   else
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
end Public_API_Consumer;
