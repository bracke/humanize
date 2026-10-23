with Ada.Strings.Unbounded;
with Humanize.Message_Keys;

--  Semantic message selection produced by Humanize classifiers.
--
--  Classifiers return a Message_Selection (a catalog key plus the render
--  arguments needed by that key). They never return localized text
--  (HUM-INV-001).
private package Humanize.Selections is

   subtype Count_Value is Long_Long_Integer range 0 .. Long_Long_Integer'Last;

   type Argument_Kind is
     (No_Arguments,
      Count_Argument,
      Value_Argument,
      Decimal_Argument,
      Value_Suffix_Argument,
      Count_Value_Suffix_Argument,
      Named_Arguments);

   --  A phrase template's arguments by name ("shown", "total", "noun"),
   --  values as text: digits stay ASCII so a template can show them as they
   --  are or as the locale writes numbers ({total, number}).
   --  A phrase with the caller's noun takes 14 noun forms besides its own
   --  arguments. With_Arg raises past the cap rather than dropping one.
   Max_Named : constant := 32;
   type Named_Argument is record
      Name  : Ada.Strings.Unbounded.Unbounded_String;
      Value : Ada.Strings.Unbounded.Unbounded_String;
   end record;
   type Named_Argument_Array is array (1 .. Max_Named) of Named_Argument;

   type Message_Selection is record
      Key       : Humanize.Message_Keys.Message_Id := Humanize.Message_Keys.No_Message;
      Arguments : Argument_Kind := No_Arguments;
      Count     : Count_Value := 0;
      Value     : Ada.Strings.Unbounded.Unbounded_String;
      Suffix    : Ada.Strings.Unbounded.Unbounded_String;
      Named     : Named_Argument_Array;
      Phrase_Name : Ada.Strings.Unbounded.Unbounded_String;
      Named_Count : Natural range 0 .. Max_Named := 0;
   end record;

   --  Selection for the phrase template "humanize.phrase." & Name; add its
   --  arguments with With_Arg.
   function Phrase (Name : String) return Message_Selection;

   --  The catalog key Selection renders: its phrase's own for a phrase.
   function Catalog_Key (Selection : Message_Selection) return String;

   --  Selection plus one named argument.
   function With_Arg
     (Selection : Message_Selection;
      Name      : String;
      Value     : String)
      return Message_Selection;

   --  Selection plus one named whole-number argument, as ASCII digits.
   function With_Arg
     (Selection : Message_Selection;
      Name      : String;
      Value     : Long_Long_Integer)
      return Message_Selection;

   --  Selection for a key that takes no render arguments.
   function No_Arg
     (Key : Humanize.Message_Keys.Message_Id)
      return Message_Selection;

   --  Selection for a key that takes a "count" plural argument.
   function Count
     (Key   : Humanize.Message_Keys.Message_Id;
      Value : Count_Value)
      return Message_Selection;

   --  Selection for a key that takes a "value" string argument.
   function Text_Value
     (Key   : Humanize.Message_Keys.Message_Id;
      Value : String)
      return Message_Selection;

   --  Selection for a raw numeric "value" plus a literal text "suffix".
   function Value_Suffix
     (Key    : Humanize.Message_Keys.Message_Id;
      Value  : String;
      Suffix : String)
      return Message_Selection;

   --  Selection for a plural key whose quantity is a decimal. Decimal_Text is a
   --  locale-neutral ASCII decimal (e.g. "1.5"): it is the plural selector
   --  (passed as "count") and the raw numeric "value".
   --  A count with two texts, as a plural message picking between a
   --  singular and a plural noun needs: "count", "value" and "suffix".
   function Count_Value_Suffix
     (Key    : Humanize.Message_Keys.Message_Id;
      Count  : Count_Value;
      Value  : String;
      Suffix : String)
      return Message_Selection;

   function Decimal
     (Key          : Humanize.Message_Keys.Message_Id;
      Decimal_Text : String)
      return Message_Selection;

end Humanize.Selections;
