with Ada.Strings.Unbounded;
with Humanize.Messages;

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
      Decimal_Argument);

   type Message_Selection is record
      Key       : Humanize.Messages.Message_Id := Humanize.Messages.No_Message;
      Arguments : Argument_Kind := No_Arguments;
      Count     : Count_Value := 0;
      Value     : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   --  Selection for a key that takes no render arguments.
   function No_Arg
     (Key : Humanize.Messages.Message_Id)
      return Message_Selection;

   --  Selection for a key that takes a "count" plural argument.
   function Count
     (Key   : Humanize.Messages.Message_Id;
      Value : Count_Value)
      return Message_Selection;

   --  Selection for a key that takes a "value" string argument.
   function Text_Value
     (Key   : Humanize.Messages.Message_Id;
      Value : String)
      return Message_Selection;

   --  Selection for a plural key whose quantity is a decimal. Decimal_Text is a
   --  locale-neutral ASCII decimal (e.g. "1.5"): it is the plural selector
   --  (passed as "count") and, once localized, the displayed "value".
   function Decimal
     (Key          : Humanize.Messages.Message_Id;
      Decimal_Text : String)
      return Message_Selection;

end Humanize.Selections;
