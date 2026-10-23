with Ada.Strings.Unbounded;

with Humanize.Contexts;
with Humanize.Status;

--  Reading humanize's phrases back in any shipped locale -- "Seite 3 von 5",
--  "5件中2件のファイルを選択", a translated status label -- by the phrase
--  catalog that wrote them, so a reading is exactly what the locale renders.
package Humanize.Parsing.Phrases is

   Max_Values : constant := 6;

   type Name_Array is array (1 .. Max_Values) of Ada.Strings.Unbounded.Unbounded_String;
   type Number_Array is array (1 .. Max_Values) of Long_Long_Integer;

   type Phrase_Parse_Result is record
      Status       : Humanize.Status.Status_Code := Humanize.Status.Invalid_Argument;
      Name         : Ada.Strings.Unbounded.Unbounded_String;
      --  The phrase's numeric arguments as read ("page" 3, "total" 5).
      Number_Count : Natural := 0;
      Number_Names : Name_Array;
      Numbers      : Number_Array := [others => 0];
      --  Its select arguments as read ("severity" "warning").
      Choice_Count : Natural := 0;
      Choice_Names : Name_Array;
      Choices      : Name_Array;
      --  The free text the phrase carried, in order: the caller's nouns,
      --  labels, rendered quantities ("Dateien", "5 MB").
      Text_Count   : Natural := 0;
      Texts        : Name_Array;
   end record;

   function Parse
     (Context : Humanize.Contexts.Context;
      Name    : String;
      Text    : String)
      return Phrase_Parse_Result;
   --  @param Context Context whose locale wrote Text, backed by a runtime that
   --  holds the locale's phrases (Humanize.Catalogs.Load_Defaults).
   --  @param Name A phrase name from docs/PHRASE_TEMPLATES.md ("page_count").
   --  @param Text The rendered phrase.
   --  @return Ok with the arguments that render Text; Invalid_Argument when
   --  none do, Missing_Message for an unknown phrase.

   function Parse_Any
     (Context : Humanize.Contexts.Context;
      Prefix  : String;
      Text    : String)
      return Phrase_Parse_Result;
   --  @param Context As for Parse.
   --  @param Prefix A phrase-name prefix ("backup.", "ui.", "" for all).
   --  @param Text The rendered phrase.
   --  @return The first phrase under Prefix that reads Text, as for Parse.

   function Number
     (Result : Phrase_Parse_Result;
      Name   : String)
      return Long_Long_Integer;
   --  @param Result A successful parse.
   --  @param Name A numeric argument's name.
   --  @return Its value; 0 where the phrase has no such argument.

end Humanize.Parsing.Phrases;
