separate (Humanize.Parsing.Implementation.Number_Text_Helpers)
function Parse_Change
     (Text : String)
      return Change_Parse_Result
   is
      Item : constant String := Trim (Text);
      Low  : constant String := Lower (Item);
      Since_At : constant Natural := Find_Substring (Low, " since ");
      Core : constant String :=
        (if Since_At = 0 then Item else Trim (Item (Item'First .. Since_At - 1)));
      Since_Text : constant String :=
        (if Since_At = 0 then ""
         else Trim (Item (Since_At + 7 .. Item'Last)));
      Value : Long_Float := 0.0;
      Tail  : Unbounded_String;
      Unit_Text : String (1 .. 32);
      Unit_Length : Natural := 0;
      Since_Buffer : String (1 .. 64);
      Since_Length : Natural := 0;
      Percent : Boolean := False;
      Points  : Boolean := False;
      Sign    : Long_Float := 1.0;

      procedure Classify_Tail (Raw : String) is
         T : Unbounded_String := To_Unbounded_String (Trim (Raw));
      begin
         if To_String (T) = "%" then
            Percent := True;
            T := Null_Unbounded_String;
         elsif To_String (T) = "point" or else To_String (T) = "points" then
            Points := True;
            T := Null_Unbounded_String;
         elsif Ends_With (To_String (T), "%") then
            Percent := True;
            declare
               S : constant String := To_String (T);
            begin
               T := To_Unbounded_String (Trim (S (S'First .. S'Last - 1)));
            end;
         elsif Ends_With (To_String (T), " points") then
            Points := True;
            declare
               S : constant String := To_String (T);
            begin
               T := To_Unbounded_String (Trim (S (S'First .. S'Last - 7)));
            end;
         elsif Ends_With (To_String (T), " point") then
            Points := True;
            declare
               S : constant String := To_String (T);
            begin
               T := To_Unbounded_String (Trim (S (S'First .. S'Last - 6)));
            end;
         end if;
         Store (To_String (T), Unit_Text, Unit_Length);
      end Classify_Tail;
begin
      if Low = "unchanged" then
         return
           (Status => Humanize.Status.Ok,
            Value => 0.0,
            Exact => True,
            Consumed => Item'Length,
            Error_Position => 0,
            Error => No_Parse_Error,
            others => <>);
      elsif Starts_With (Low, "up ") then
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core (Core'First + 3 .. Core'Last), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Starts_With (Low, "down ") then
         Sign := -1.0;
         if not Parse_Number_And_Tail (Core (Core'First + 5 .. Core'Last), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Core'Length > 0 and then Core (Core'First) = '+' then
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core, Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Core'Length > 0 and then Core (Core'First) = '-' then
         Sign := -1.0;
         if not Parse_Number_And_Tail (Core, Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
         Value := abs Value;
      elsif Ends_With (Low, " more") then
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core (Core'First .. Core'Last - 5), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Find_Substring (Low, " more ") /= 0 then
         declare
            Marker : constant Natural := Find_Substring (Low, " more ");
         begin
            Sign := 1.0;
            if not Parse_Number_And_Tail
              (Core (Core'First .. Marker - 1), Value, Tail)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Tail := To_Unbounded_String
              (Trim (To_String (Tail) & " " & Core (Marker + 6 .. Core'Last)));
         end;
      elsif Ends_With (Low, " fewer") then
         Sign := -1.0;
         if not Parse_Number_And_Tail (Core (Core'First .. Core'Last - 6), Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      elsif Find_Substring (Low, " fewer ") /= 0 then
         declare
            Marker : constant Natural := Find_Substring (Low, " fewer ");
         begin
            Sign := -1.0;
            if not Parse_Number_And_Tail
              (Core (Core'First .. Marker - 1), Value, Tail)
            then
               return (Status => Humanize.Status.Invalid_Argument, others => <>);
            end if;
            Tail := To_Unbounded_String
              (Trim (To_String (Tail) & " " & Core (Marker + 7 .. Core'Last)));
         end;
      else
         Sign := 1.0;
         if not Parse_Number_And_Tail (Core, Value, Tail) then
            return (Status => Humanize.Status.Invalid_Argument, others => <>);
         end if;
      end if;

      Classify_Tail (To_String (Tail));
      Store (Since_Text, Since_Buffer, Since_Length);
      return
        (Status => Humanize.Status.Ok,
         Value => Sign * abs Value,
         Unit => Unit_Text,
         Unit_Length => Unit_Length,
         Since => Since_Buffer,
         Since_Length => Since_Length,
         Percent => Percent,
         Points => Points,
         Exact => True,
         Consumed => Item'Length,
         Error_Position => 0,
         Error => No_Parse_Error);
exception
      when others =>
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
end Parse_Change;
