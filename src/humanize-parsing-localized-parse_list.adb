separate (Humanize.Parsing.Localized)
function Parse_List
  (Context : Humanize.Contexts.Context;
   Text    : String;
   Style   : Humanize.Lists.List_Style := Humanize.Lists.Conjunction)
   return List_Read_Result
is
   --  The locale's list rendered with one-character stand-ins for the items.
   function Render (Count : Positive) return String is
      Items    : Humanize.Lists.Text_List (1 .. Count);
      Rendered : Humanize.Status.Text_Result;
   begin
      for I in Items'Range loop
         Items (I) := To_Unbounded_String ([1 => Character'Val (1 + I)]);
      end loop;
      Rendered := Humanize.Lists.Format (Context, Items, (Style => Style, Oxford_Comma => False));
      return (if Rendered.Status = Humanize.Status.Ok then To_String (Rendered.Text) else "");
   end Render;

   --  The text between stand-ins From and From + 1 in Rendered.
   function Between (Rendered : String; From : Positive) return String is
      First : constant Natural := Ada.Strings.Fixed.Index (Rendered, [1 => Character'Val (1 + From)]);
      Last  : constant Natural := Ada.Strings.Fixed.Index (Rendered, [1 => Character'Val (2 + From)]);
   begin
      return (if First = 0 or else Last <= First then "" else Rendered (First + 1 .. Last - 1));
   end Between;

   Two  : constant String := Render (2);
   Four : constant String := Render (4);
   Pair : constant String := Between (Two, 1);
   Head : constant String := Between (Four, 1);
   Mid  : constant String := Between (Four, 2);
   Tail : constant String := Between (Four, 3);

   Result : List_Read_Result;

   procedure Add (Item : String) is
   begin
      if Item'Length = 0 or else Result.Count = Max_List_Items then
         Result.Status := Humanize.Status.Invalid_Argument;
      elsif Result.Status = Humanize.Status.Ok then
         Result.Count := Result.Count + 1;
         Result.Items (Result.Count) := To_Unbounded_String (Item);
      end if;
   end Add;

   --  Three or more items: the first before Head, the last after the final
   --  Tail, and the rest between them split at Mid.
   function Read_Long return Boolean is
      Last_Join  : constant Natural :=
        (if Tail = "" then 0 else Ada.Strings.Fixed.Index (Text, Tail, Going => Ada.Strings.Backward));
      First_Join : constant Natural :=
        (if Last_Join = 0 or else Head = "" then 0
         else Ada.Strings.Fixed.Index (Text (Text'First .. Last_Join - 1), Head));
   begin
      if First_Join = 0 then
         return False;
      end if;
      Result := (Status => Humanize.Status.Ok, others => <>);
      Add (Text (Text'First .. First_Join - 1));
      declare
         From : Positive := First_Join + Head'Length;
         Stop : Natural;
      begin
         loop
            Stop := (if Mid = "" or else From > Last_Join - 1 then 0
                     else Ada.Strings.Fixed.Index (Text (From .. Last_Join - 1), Mid));
            exit when Stop = 0;
            Add (Text (From .. Stop - 1));
            From := Stop + Mid'Length;
         end loop;
         Add (Text (From .. Last_Join - 1));
      end;
      Add (Text (Last_Join + Tail'Length .. Text'Last));
      return Result.Status = Humanize.Status.Ok;
   end Read_Long;

   Join : Natural;
begin
   if Text'Length = 0 or else Pair = "" then
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end if;
   if Read_Long then
      return Result;
   end if;
   Result := (Status => Humanize.Status.Ok, others => <>);
   Join := Ada.Strings.Fixed.Index (Text, Pair);
   if Join = 0 then
      Add (Text);
   else
      Add (Text (Text'First .. Join - 1));
      Add (Text (Join + Pair'Length .. Text'Last));
   end if;
   return Result;
end Parse_List;
