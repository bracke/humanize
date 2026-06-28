package body Humanize.Selections is

   use Ada.Strings.Unbounded;

   function No_Arg
     (Key : Humanize.Messages.Message_Id)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => No_Arguments,
         Count     => 0,
         Value     => Null_Unbounded_String);
   end No_Arg;

   function Count
     (Key   : Humanize.Messages.Message_Id;
      Value : Count_Value)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Count_Argument,
         Count     => Value,
         Value     => Null_Unbounded_String);
   end Count;

   function Text_Value
     (Key   : Humanize.Messages.Message_Id;
      Value : String)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Value_Argument,
         Count     => 0,
         Value     => To_Unbounded_String (Value));
   end Text_Value;

end Humanize.Selections;
