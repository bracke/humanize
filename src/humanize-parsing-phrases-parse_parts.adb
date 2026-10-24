separate (Humanize.Parsing.Phrases)
--  A label joined from parts (the Humanize.<Family>.Localized summaries):
--  Name.none for the empty case; else, through Name.with_states, the control
--  Name.control and its states; the pieces split at the locale's label.parts
--  separator, each read by one of the Name.<part> phrases. A part's count is
--  named by the part ("added" 3), a part without one counts 1 ("selected").
function Parse_Parts
  (Context : Humanize.Contexts.Context;
   Name    : String;
   Text    : String)
   return Phrase_Parse_Result
is
   Prefix : constant String := Name & ".";

   function Has (Key : String) return Boolean is
     (for some Entry_Text of Humanize.Parsing.Phrase_Keys.Entries => Field (Entry_Text.all, 1) = Key);

   function Entry_Of (Key : String) return String is
   begin
      for Entry_Text of Humanize.Parsing.Phrase_Keys.Entries loop
         if Field (Entry_Text.all, 1) = Key then
            return Entry_Text.all;
         end if;
      end loop;
      return "";
   end Entry_Of;

   --  The locale's separator between parts: label.parts with markers.
   function Separator return String is
      Rendered : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context,
           Humanize.Selections.With_Arg
             (Humanize.Selections.With_Arg (Humanize.Selections.Phrase ("label.parts"), "first", [ASCII.SOH]),
              "second", [ASCII.STX]));
      Shown : constant String := To_String (Rendered.Text);
      First : constant Natural := Ada.Strings.Fixed.Index (Shown, [ASCII.SOH]);
      Last  : constant Natural := Ada.Strings.Fixed.Index (Shown, [ASCII.STX]);
   begin
      return (if Rendered.Status = Humanize.Status.Ok and then First > 0 and then Last > First + 1
              then Shown (First + 1 .. Last - 1) else ", ");
   end Separator;

   Result : Phrase_Parse_Result := (Status => Humanize.Status.Ok, Name => To_Unbounded_String (Name), others => <>);

   --  Piece read by a part phrase, its counts added to Result; False if none reads it.
   function Read_Piece (Piece : String) return Boolean is
   begin
      for Entry_Text of Humanize.Parsing.Phrase_Keys.Entries loop
         declare
            Key : constant String := Field (Entry_Text.all, 1);
         begin
            if Key'Length > Prefix'Length and then Key (Key'First .. Key'First + Prefix'Length - 1) = Prefix
              and then Key /= Prefix & "none" and then Key /= Prefix & "control" and then Key /= Prefix & "with_states"
            then
               declare
                  Part : constant Phrase_Parse_Result := Parse_Entry (Context, Entry_Text.all, Piece);
                  Kind : constant String := Key (Key'First + Prefix'Length .. Key'Last);
               begin
                  if Part.Status = Humanize.Status.Ok then
                     if Part.Number_Count = 0 and then Result.Number_Count < Max_Values then
                        Result.Number_Count := Result.Number_Count + 1;
                        Result.Number_Names (Result.Number_Count) := To_Unbounded_String (Kind);
                        Result.Numbers (Result.Number_Count) := 1;
                     end if;
                     for I in 1 .. Part.Number_Count loop
                        exit when Result.Number_Count = Max_Values;
                        Result.Number_Count := Result.Number_Count + 1;
                        Result.Number_Names (Result.Number_Count) :=
                          To_Unbounded_String (if To_String (Part.Number_Names (I)) = "count" then Kind
                                               else To_String (Part.Number_Names (I)));
                        Result.Numbers (Result.Number_Count) := Part.Numbers (I);
                     end loop;
                     return True;
                  end if;
               end;
            end if;
         end;
      end loop;
      return False;
   end Read_Piece;

   --  Every piece of Pieces (joined by the separator) read; False at the first that is not.
   function Read_Pieces (Pieces : String) return Boolean is
      Join  : constant String := Separator;
      Start : Positive := Pieces'First;
      Stop  : Natural;
   begin
      loop
         Stop := Ada.Strings.Fixed.Index (Pieces (Start .. Pieces'Last), Join);
         if not Read_Piece (Pieces (Start .. (if Stop = 0 then Pieces'Last else Stop - 1))) then
            return False;
         end if;
         exit when Stop = 0;
         Start := Stop + Join'Length;
      end loop;
      return True;
   end Read_Pieces;
begin
   if not (for some Entry_Text of Humanize.Parsing.Phrase_Keys.Entries =>
             Field (Entry_Text.all, 1)'Length > Prefix'Length
             and then Field (Entry_Text.all, 1) (Field (Entry_Text.all, 1)'First
                                                 .. Field (Entry_Text.all, 1)'First + Prefix'Length - 1) = Prefix)
   then
      return (Status => Humanize.Status.Missing_Message, others => <>);
   elsif Text'Length = 0 then
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end if;
   if Has (Prefix & "none") then
      declare
         None : constant Phrase_Parse_Result := Parse_Entry (Context, Entry_Of (Prefix & "none"), Text);
      begin
         if None.Status = Humanize.Status.Ok then
            return (None with delta Name => To_Unbounded_String (Name));
         end if;
      end;
   end if;
   if Has (Prefix & "with_states") then
      --  the control alone, or the control with its states
      declare
         Control : constant Phrase_Parse_Result := Parse_Entry (Context, Entry_Of (Prefix & "control"), Text);
         Split   : constant Phrase_Parse_Result := Parse_Entry (Context, Entry_Of (Prefix & "with_states"), Text);
      begin
         if Control.Status = Humanize.Status.Ok then
            return (Control with delta Name => To_Unbounded_String (Name));
         elsif Split.Status = Humanize.Status.Ok and then Split.Text_Count >= 2 then
            declare
               Head : constant Phrase_Parse_Result :=
                 Parse_Entry (Context, Entry_Of (Prefix & "control"), To_String (Split.Texts (1)));
            begin
               if Head.Status = Humanize.Status.Ok then
                  Result := (Head with delta Name => To_Unbounded_String (Name));
                  if Read_Pieces (To_String (Split.Texts (2))) then
                     return Result;
                  end if;
               end if;
            end;
         end if;
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end;
   end if;
   return (if Read_Pieces (Text) then Result else (Status => Humanize.Status.Invalid_Argument, others => <>));
end Parse_Parts;
