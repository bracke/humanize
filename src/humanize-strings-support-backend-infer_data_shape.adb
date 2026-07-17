separate (Humanize.Strings.Support.Backend)
function Infer_Data_Shape
     (Text : String)
      return Data_Shape_Metadata
   is
      Result : Data_Shape_Metadata;
      Depth  : Natural := 0;
      In_String : Boolean := False;
      Escape : Boolean := False;
      Saw_Scalar : Boolean := False;
begin
      if Result_Text (Squish (Text))'Length = 0 then
         return (Kind => Empty_Shape, others => <>);
      end if;

      for C of Text loop
         if In_String then
            if Escape then
               Escape := False;
            elsif C = '\' then
               Escape := True;
            elsif C = '"' then
               In_String := False;
            end if;
         else
            case C is
               when '"' =>
                  In_String := True;
                  Saw_Scalar := True;
               when '{' =>
                  Depth := Depth + 1;
                  Result.Max_Depth := Natural'Max (Result.Max_Depth, Depth);
                  if Result.Kind = Scalar_Shape then
                     Result.Kind := Object_Shape;
                  elsif Result.Kind /= Object_Shape then
                     Result.Kind := Mixed_Shape;
                  end if;
               when '[' =>
                  Depth := Depth + 1;
                  Result.Max_Depth := Natural'Max (Result.Max_Depth, Depth);
                  Result.Items := Result.Items + 1;
                  if Result.Kind = Scalar_Shape then
                     Result.Kind := Array_Shape;
                  elsif Result.Kind /= Array_Shape then
                     Result.Kind := Mixed_Shape;
                  end if;
               when '}' | ']' =>
                  if Depth > 0 then
                     Depth := Depth - 1;
                  end if;
               when ':' =>
                  Result.Fields := Result.Fields + 1;
               when ',' =>
                  if Result.Kind = Array_Shape then
                     Result.Items := Result.Items + 1;
                  end if;
               when 'n' =>
                  Result.Nulls := Result.Nulls + 1;
                  Saw_Scalar := True;
               when '0' .. '9' | '-' | 't' | 'f' =>
                  Saw_Scalar := True;
               when others =>
                  null;
            end case;
         end if;
      end loop;

      if Result.Kind = Scalar_Shape and then not Saw_Scalar then
         Result.Kind := Empty_Shape;
      elsif Result.Kind = Mixed_Shape then
         Result.Mixed_Types := 1;
      end if;

      return Result;
end Infer_Data_Shape;
