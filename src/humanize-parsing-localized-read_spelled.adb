with Humanize.Parsing.Implementation.CLDR_Vocabulary;
with Humanize.Numbers.Spellout;

separate (Humanize.Parsing.Localized)
function Read_Spelled (Context : Humanize.Contexts.Context; Text : String; Ordinal : Boolean)
   return Float_Parse_Result
is
   package Vocabulary renames Humanize.Parsing.Implementation.CLDR_Vocabulary;
   Item : constant String := Trimmed (Text);

   function Read (Locale : String) return Float_Parse_Result is
      Value    : Long_Long_Integer;
      Consumed : Natural;
   begin
      if Item'Length = 0 then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      Vocabulary.Spelled_Number_In (Locale, Item, Ordinal, Value, Consumed);
      if Consumed /= Item'Length then
         return (Status => Humanize.Status.Invalid_Argument, Error_Position => Consumed + 1, others => <>);
      end if;
      return (Status => Humanize.Status.Ok, Value => Long_Float (Value), Exact => True, Consumed => Text'Length,
              others => <>);
   end Read;

   function Ordinal_Text (Value : Natural) return String is
      Rendered : constant Humanize.Status.Text_Result := Humanize.Numbers.Spellout.Ordinal_Words (Context, Value);
   begin
      return (if Rendered.Status = Humanize.Status.Ok then To_String (Rendered.Text) else "");
   end Ordinal_Text;

   --  The ordinal below 1000, or the thousand, million or billion, that
   --  Part is; -1 if none.
   function Small_Ordinal (Part : String) return Integer is
      type Scale_List is array (Positive range <>) of Natural;
      Scales : constant Scale_List := [1_000, 1_000_000, 1_000_000_000];
   begin
      for Value in 0 .. 999 loop
         if Ordinal_Text (Value) = Part then
            return Value;
         end if;
      end loop;
      for Value of Scales loop
         if Ordinal_Text (Value) = Part then
            return Value;
         end if;
      end loop;
      return -1;
   end Small_Ordinal;

   --  Part as cardinal words; -1 if they do not read all of it.
   function Cardinal (Part : String) return Long_Long_Integer is
      Value    : Long_Long_Integer;
      Consumed : Natural;
   begin
      Vocabulary.Spelled_Number_In (Humanize.Contexts.Locale (Context), Part, False, Value, Consumed);
      return (if Consumed = Part'Length then Value else -1);
   end Cardinal;

   --  A locale without CLDR ordinal rules writes ordinals from humanize's
   --  own table ("první"), larger ones as the cardinal words of the rest
   --  before it ("tisíc dvě stě" "třicet čtvrtý"): the value that renders
   --  Item.
   function Read_Table return Float_Parse_Result is
      type Step_List is array (Positive range <>) of Natural;
      Steps : constant Step_List := [10, 100, 1_000];
      Small : constant Integer := Small_Ordinal (Item);
   begin
      if Small >= 0 then
         return (Status => Humanize.Status.Ok, Value => Long_Float (Small), Exact => True,
                 Consumed => Text'Length, others => <>);
      end if;
      for Space in reverse Item'Range loop
         if Item (Space) = ' ' and then Space > Item'First and then Space < Item'Last then
            declare
               Rest : constant Integer := Small_Ordinal (Item (Space + 1 .. Item'Last));
               Head : constant Long_Long_Integer :=
                 (if Rest < 0 then -1 else Cardinal (Item (Item'First .. Space - 1)));
               type Candidate_List is array (1 .. 2) of Long_Long_Integer;
               --  The rest added ("tisíc" "dvě stě" "čtvrtý") or, for a
               --  scale, multiplied ("dvacet" "tisící").
               Candidates : constant Candidate_List :=
                 (if Head < 0 then [-1, -1] else [Head + Long_Long_Integer (Rest), Head * Long_Long_Integer (Rest)]);
            begin
               for Value of Candidates loop
                  if Value in 0 .. Long_Long_Integer (Natural'Last) and then Ordinal_Text (Natural (Value)) = Item
                  then
                     return (Status => Humanize.Status.Ok, Value => Long_Float (Value), Exact => True,
                             Consumed => Text'Length, others => <>);
                  end if;
               end loop;
               --  humanize's own words for a round head ("tisíc" before
               --  "dvě stě třicet čtvrtý"): each multiple of ten, a hundred
               --  or a thousand in turn.
               if Rest in 0 .. 999 then
                  for Step of Steps loop
                     for K in 1 .. (if Step = 1_000 then 999 else 9) loop
                        if Ordinal_Text (K * Step + Rest) = Item then
                           return (Status => Humanize.Status.Ok, Value => Long_Float (K * Step + Rest),
                                   Exact => True, Consumed => Text'Length, others => <>);
                        end if;
                     end loop;
                  end loop;
               end if;
            end;
         end if;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Read_Table;

   --  One word for a round hundred, thousand or million, its multiplier glued
   --  on (Ukrainian "двадцятитисячний", German "zwei­millionste"), in any locale.
   function Read_Round return Float_Parse_Result is
      type Scale_List is array (Positive range <>) of Natural;
      Scales : constant Scale_List := [100, 1_000, 1_000_000];
   begin
      if (for some C of Item => C = ' ') then
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end if;
      for Scale of Scales loop
         for K in 1 .. (if Scale = 100 then 9 else 999) loop
            if Ordinal_Text (K * Scale) = Item then
               return (Status => Humanize.Status.Ok, Value => Long_Float (K * Scale), Exact => True,
                       Consumed => Text'Length, others => <>);
            end if;
         end loop;
      end loop;
      return (Status => Humanize.Status.Invalid_Argument, others => <>);
   end Read_Round;

   Own : constant Float_Parse_Result := Read (Humanize.Contexts.Locale (Context));
begin
   if Own.Status = Humanize.Status.Ok then
      return Own;
   elsif Ordinal and then Read_Round.Status = Humanize.Status.Ok then
      return Read_Round;
   elsif Ordinal and then not Vocabulary.Has_Ordinal_Rules (Humanize.Contexts.Locale (Context)) then
      declare
         Table : constant Float_Parse_Result := Read_Table;
      begin
         if Table.Status = Humanize.Status.Ok then
            return Table;
         end if;
      end;
   end if;
   declare
      English : constant Float_Parse_Result := Read ("en");
      --  Past the words the formatter has, it writes the number itself.
      Numeral : constant Float_Parse_Result :=
        (if Ordinal then Parse_Ordinal (Context, Text) else Parse_Number (Context, Text));

      --  The number before a suffix ("99 999-й"), where the formatter writes
      --  that very text for it.
      function Suffixed return Float_Parse_Result is
         Last : Natural := 0;
      begin
         for I in Item'Range loop
            if Item (I) in '0' .. '9' then
               Last := I;
            end if;
         end loop;
         if Ordinal and then Last in Item'First .. Item'Last - 1 then
            declare
               Head : constant Float_Parse_Result := Parse_Number (Context, Item (Item'First .. Last));
            begin
               if Head.Status = Humanize.Status.Ok and then Head.Value in 0.0 .. 999_999_999.0
                 and then Long_Float'Floor (Head.Value) = Head.Value
                 and then Ordinal_Text (Natural (Head.Value)) = Item
               then
                  return (Head with delta Consumed => Text'Length);
               end if;
            end;
         end if;
         return (Status => Humanize.Status.Invalid_Argument, others => <>);
      end Suffixed;
   begin
      if English.Status = Humanize.Status.Ok then
         return English;
      elsif Numeral.Status = Humanize.Status.Ok then
         return Numeral;
      end if;
      declare
         With_Suffix : constant Float_Parse_Result := Suffixed;
      begin
         return (if With_Suffix.Status = Humanize.Status.Ok then With_Suffix else Parse_Number (Context, Text));
      end;
   end;
end Read_Spelled;
