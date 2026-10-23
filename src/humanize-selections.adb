package body Humanize.Selections is
   use type Humanize.Message_Keys.Message_Id;

   use Ada.Strings.Unbounded;

   function No_Arg
     (Key : Humanize.Message_Keys.Message_Id)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => No_Arguments,
         Count     => 0,
         Value     => Null_Unbounded_String,
         Suffix    => Null_Unbounded_String,
         others    => <>);
   end No_Arg;

   function Count
     (Key   : Humanize.Message_Keys.Message_Id;
      Value : Count_Value)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Count_Argument,
         Count     => Value,
         Value     => Null_Unbounded_String,
         Suffix    => Null_Unbounded_String,
         others    => <>);
   end Count;

   function Text_Value
     (Key   : Humanize.Message_Keys.Message_Id;
      Value : String)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Value_Argument,
         Count     => 0,
         Value     => To_Unbounded_String (Value),
         Suffix    => Null_Unbounded_String,
         others    => <>);
   end Text_Value;

   function Count_Value_Suffix
     (Key    : Humanize.Message_Keys.Message_Id;
      Count  : Count_Value;
      Value  : String;
      Suffix : String)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Count_Value_Suffix_Argument,
         Count     => Count,
         Value     => To_Unbounded_String (Value),
         Suffix    => To_Unbounded_String (Suffix),
         others    => <>);
   end Count_Value_Suffix;

   function Value_Suffix
     (Key    : Humanize.Message_Keys.Message_Id;
      Value  : String;
      Suffix : String)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Value_Suffix_Argument,
         Count     => 0,
         Value     => To_Unbounded_String (Value),
         Suffix    => To_Unbounded_String (Suffix),
         others    => <>);
   end Value_Suffix;

   function Decimal
     (Key          : Humanize.Message_Keys.Message_Id;
      Decimal_Text : String)
      return Message_Selection
   is
   begin
      return
        (Key       => Key,
         Arguments => Decimal_Argument,
         Count     => 0,
         Value     => To_Unbounded_String (Decimal_Text),
         Suffix    => Null_Unbounded_String,
         others    => <>);
   end Decimal;

   function Phrase (Name : String) return Message_Selection is
      Result : Message_Selection;
   begin
      Result.Key := Humanize.Message_Keys.Phrase;
      Result.Arguments := Named_Arguments;
      Result.Phrase_Name := To_Unbounded_String (Name);
      return Result;
   end Phrase;

   function Catalog_Key (Selection : Message_Selection) return String is
     (if Selection.Key = Humanize.Message_Keys.Phrase
      then "humanize.phrase." & To_String (Selection.Phrase_Name)
      else Humanize.Message_Keys.Key (Selection.Key));

   function With_Arg
     (Selection : Message_Selection;
      Name      : String;
      Value     : String)
      return Message_Selection
   is
      Result : Message_Selection := Selection;
   begin
      --  A name given again takes the new value.
      for I in 1 .. Result.Named_Count loop
         if To_String (Result.Named (I).Name) = Name then
            Result.Named (I).Value := To_Unbounded_String (Value);
            return Result;
         end if;
      end loop;
      if Result.Named_Count = Max_Named then
         raise Program_Error with "phrase " & To_String (Result.Phrase_Name) & " has more than"
           & Max_Named'Image & " arguments";
      end if;
      Result.Named_Count := Result.Named_Count + 1;
      Result.Named (Result.Named_Count) :=
        (Name => To_Unbounded_String (Name), Value => To_Unbounded_String (Value));
      return Result;
   end With_Arg;

   function With_Arg
     (Selection : Message_Selection;
      Name      : String;
      Value     : Long_Long_Integer)
      return Message_Selection
   is
      Image : constant String := Long_Long_Integer'Image (Value);
   begin
      return With_Arg
        (Selection, Name,
         (if Image (Image'First) = ' ' then Image (Image'First + 1 .. Image'Last) else Image));
   end With_Arg;

end Humanize.Selections;
