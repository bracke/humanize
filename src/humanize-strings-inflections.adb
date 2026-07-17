with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Status;
with Humanize.Strings.Identifiers;

package body Humanize.Strings.Inflections is
   use type Humanize.Status.Status_Code;

   function Is_Upper (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Uppercase;

   function Is_Lower (C : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Lowercase;

   function Lower (C : Character) return Character
      renames Humanize.Bounded_Text.Lower_Char;

   function Ends_With (Text, Suffix : String) return Boolean
      renames Humanize.Bounded_Text.Ends_With;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text (Result : Humanize.Status.Text_Result) return String
      renames Humanize.Bounded_Text.Result_Text;

   procedure Copy_Into
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Lower_ASCII (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         Result (Index) := Lower (Text (Index));
      end loop;
      return Result;
   end Lower_ASCII;

   function Upper_ASCII (Text : String) return String is
      Result : String (Text'Range);
   begin
      for Index in Text'Range loop
         if Is_Lower (Text (Index)) then
            Result (Index) :=
              Character'Val
                (Character'Pos (Text (Index)) - Character'Pos ('a')
                 + Character'Pos ('A'));
         else
            Result (Index) := Text (Index);
         end if;
      end loop;
      return Result;
   end Upper_ASCII;

   function Is_ASCII_Letter (Ch : Character) return Boolean
      renames Humanize.Bounded_Text.Is_ASCII_Letter;

   function Is_All_Upper_Word (Word : String) return Boolean is
      Has_Letter : Boolean := False;
   begin
      for Ch of Word loop
         if Is_Lower (Ch) then
            return False;
         elsif Is_Upper (Ch) then
            Has_Letter := True;
         end if;
      end loop;
      return Has_Letter;
   end Is_All_Upper_Word;

   function Is_Title_Word (Word : String) return Boolean is
      Seen_First : Boolean := False;
   begin
      for Ch of Word loop
         if Is_ASCII_Letter (Ch) then
            if not Seen_First then
               if not Is_Upper (Ch) then
                  return False;
               end if;
               Seen_First := True;
            elsif Is_Upper (Ch) then
               return False;
            end if;
         end if;
      end loop;
      return Seen_First;
   end Is_Title_Word;

   function Match_Case
     (Original : String;
      Lowered  : String)
      return String
   is
   begin
      if Is_All_Upper_Word (Original) then
         return Upper_ASCII (Lowered);
      elsif Is_Title_Word (Original) and then Lowered'Length > 0 then
         if Lowered'Length = 1 then
            return Upper_ASCII (Lowered);
         else
            return Upper_ASCII (Lowered (Lowered'First .. Lowered'First))
              & Lowered (Lowered'First + 1 .. Lowered'Last);
         end if;
      else
         return Lowered;
      end if;
   end Match_Case;

   function Inflection_Key (Word : String) return String is
     (Lower_ASCII (Result_Text (Humanize.Strings.Identifiers.Parameterize (Word, '_'))));

   function Is_Uncountable_Noun (Word : String) return Boolean is
      Low : constant String := Inflection_Key (Word);
   begin
      return Low = "advice" or else Low = "aircraft" or else Low = "bison"
        or else Low = "bread" or else Low = "deer" or else Low = "equipment"
        or else Low = "fish" or else Low = "furniture"
        or else Low = "gold" or else Low = "information"
        or else Low = "jewelry" or else Low = "knowledge"
        or else Low = "luggage" or else Low = "metadata"
        or else Low = "money"
        or else Low = "moose" or else Low = "news"
        or else Low = "rice" or else Low = "series"
        or else Low = "sheep" or else Low = "species"
        or else Low = "software" or else Low = "swine"
        or else Low = "traffic";
   end Is_Uncountable_Noun;

   function Irregular_Plural (Word : String) return String is
      Low : constant String := Inflection_Key (Word);
   begin
      if Low = "person" then
         return Match_Case (Word, "people");
      elsif Low = "man" then
         return Match_Case (Word, "men");
      elsif Low = "woman" then
         return Match_Case (Word, "women");
      elsif Low = "child" then
         return Match_Case (Word, "children");
      elsif Low = "mouse" then
         return Match_Case (Word, "mice");
      elsif Low = "goose" then
         return Match_Case (Word, "geese");
      elsif Low = "tooth" then
         return Match_Case (Word, "teeth");
      elsif Low = "foot" then
         return Match_Case (Word, "feet");
      elsif Low = "ox" then
         return Match_Case (Word, "oxen");
      elsif Low = "louse" then
         return Match_Case (Word, "lice");
      elsif Low = "die" then
         return Match_Case (Word, "dice");
      elsif Low = "brother" then
         return Match_Case (Word, "brethren");
      elsif Low = "cow" then
         return Match_Case (Word, "kine");
      elsif Low = "salesman" then
         return Match_Case (Word, "salesmen");
      elsif Low = "policeman" then
         return Match_Case (Word, "policemen");
      elsif Low = "policewoman" then
         return Match_Case (Word, "policewomen");
      elsif Low = "fireman" then
         return Match_Case (Word, "firemen");
      elsif Low = "firewoman" then
         return Match_Case (Word, "firewomen");
      elsif Low = "corpus" then
         return Match_Case (Word, "corpora");
      elsif Low = "genus" then
         return Match_Case (Word, "genera");
      elsif Low = "opus" then
         return Match_Case (Word, "opera");
      elsif Low = "viscus" then
         return Match_Case (Word, "viscera");
      elsif Low = "schema" then
         return Match_Case (Word, "schemata");
      elsif Low = "stigma" then
         return Match_Case (Word, "stigmata");
      elsif Low = "lemma" then
         return Match_Case (Word, "lemmata");
      elsif Low = "nebula" then
         return Match_Case (Word, "nebulae");
      elsif Low = "vertebra" then
         return Match_Case (Word, "vertebrae");
      else
         return "";
      end if;
   end Irregular_Plural;

   function Irregular_Singular (Word : String) return String is
      Low : constant String := Inflection_Key (Word);
   begin
      if Low = "people" then
         return Match_Case (Word, "person");
      elsif Low = "men" then
         return Match_Case (Word, "man");
      elsif Low = "women" then
         return Match_Case (Word, "woman");
      elsif Low = "children" then
         return Match_Case (Word, "child");
      elsif Low = "mice" then
         return Match_Case (Word, "mouse");
      elsif Low = "geese" then
         return Match_Case (Word, "goose");
      elsif Low = "teeth" then
         return Match_Case (Word, "tooth");
      elsif Low = "feet" then
         return Match_Case (Word, "foot");
      elsif Low = "oxen" then
         return Match_Case (Word, "ox");
      elsif Low = "lice" then
         return Match_Case (Word, "louse");
      elsif Low = "dice" then
         return Match_Case (Word, "die");
      elsif Low = "brethren" then
         return Match_Case (Word, "brother");
      elsif Low = "kine" then
         return Match_Case (Word, "cow");
      elsif Low = "salesmen" then
         return Match_Case (Word, "salesman");
      elsif Low = "policemen" then
         return Match_Case (Word, "policeman");
      elsif Low = "policewomen" then
         return Match_Case (Word, "policewoman");
      elsif Low = "firemen" then
         return Match_Case (Word, "fireman");
      elsif Low = "firewomen" then
         return Match_Case (Word, "firewoman");
      elsif Low = "corpora" then
         return Match_Case (Word, "corpus");
      elsif Low = "genera" then
         return Match_Case (Word, "genus");
      elsif Low = "opera" then
         return Match_Case (Word, "opus");
      elsif Low = "viscera" then
         return Match_Case (Word, "viscus");
      elsif Low = "schemata" then
         return Match_Case (Word, "schema");
      elsif Low = "stigmata" then
         return Match_Case (Word, "stigma");
      elsif Low = "lemmata" then
         return Match_Case (Word, "lemma");
      elsif Low = "nebulae" then
         return Match_Case (Word, "nebula");
      elsif Low = "vertebrae" then
         return Match_Case (Word, "vertebra");
      else
         return "";
      end if;
   end Irregular_Singular;

   function Needs_Oes_Plural (Low : String) return Boolean is
     (Low = "echo" or else Low = "embargo" or else Low = "hero"
      or else Low = "potato" or else Low = "tomato" or else Low = "torpedo"
      or else Low = "veto");

   function Last_Character (Text : String) return Character is
   begin
      if Text'Length = 0 then
         return ASCII.NUL;
      else
         return Text (Text'Last);
      end if;
   end Last_Character;

   function Is_ASCII_Vowel (Ch : Character) return Boolean is
      Low : constant Character := Lower (Ch);
   begin
      return Low = 'a' or else Low = 'e' or else Low = 'i'
        or else Low = 'o' or else Low = 'u';
   end Is_ASCII_Vowel;

   function Remove_Last
     (Word  : String;
      Count : Natural)
      return String
   is
   begin
      if Count = 0 then
         return Word;
      elsif Count >= Word'Length then
         return "";
      else
         return Word (Word'First .. Word'Last - Count);
      end if;
   end Remove_Last;

   function Language_Irregular_Plural
     (Word     : String;
      Language : Inflection_Language)
      return String
   is
      Low : constant String := Inflection_Key (Word);
   begin
      case Language is
         when English_Inflection =>
            return Irregular_Plural (Word);
         when Danish_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "born");
            elsif Low = "mand" then
               return Match_Case (Word, "maend");
            end if;
         when German_Inflection =>
            if Low = "kind" then
               return Match_Case (Word, "kinder");
            elsif Low = "mann" then
               return Match_Case (Word, "maenner");
            elsif Low = "frau" then
               return Match_Case (Word, "frauen");
            elsif Low = "datum" then
               return Match_Case (Word, "daten");
            end if;
         when French_Inflection =>
            if Low = "cheval" then
               return Match_Case (Word, "chevaux");
            elsif Low = "travail" then
               return Match_Case (Word, "travaux");
            elsif Low = "oeil" then
               return Match_Case (Word, "yeux");
            end if;
         when Spanish_Inflection =>
            if Low = "luz" then
               return Match_Case (Word, "luces");
            elsif Low = "juez" then
               return Match_Case (Word, "jueces");
            end if;
         when Italian_Inflection =>
            if Low = "uomo" then
               return Match_Case (Word, "uomini");
            elsif Low = "uovo" then
               return Match_Case (Word, "uova");
            end if;
         when Portuguese_Inflection =>
            if Low = "mao" then
               return Match_Case (Word, "maos");
            elsif Low = "homem" then
               return Match_Case (Word, "homens");
            end if;
         when Dutch_Inflection =>
            if Low = "kind" then
               return Match_Case (Word, "kinderen");
            elsif Low = "stad" then
               return Match_Case (Word, "steden");
            end if;
         when Swedish_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "man" then
               return Match_Case (Word, "maen");
            end if;
         when Norwegian_Inflection | Norwegian_Bokmal_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "mann" then
               return Match_Case (Word, "menn");
            end if;
         when Finnish_Inflection | Turkish_Inflection =>
            null;
      end case;
      return "";
   end Language_Irregular_Plural;

   function Language_Irregular_Singular
     (Word     : String;
      Language : Inflection_Language)
      return String
   is
      Low : constant String := Inflection_Key (Word);
   begin
      case Language is
         when English_Inflection =>
            return Irregular_Singular (Word);
         when Danish_Inflection =>
            if Low = "born" then
               return Match_Case (Word, "barn");
            elsif Low = "maend" then
               return Match_Case (Word, "mand");
            end if;
         when German_Inflection =>
            if Low = "kinder" then
               return Match_Case (Word, "kind");
            elsif Low = "maenner" then
               return Match_Case (Word, "mann");
            elsif Low = "frauen" then
               return Match_Case (Word, "frau");
            elsif Low = "daten" then
               return Match_Case (Word, "datum");
            end if;
         when French_Inflection =>
            if Low = "chevaux" then
               return Match_Case (Word, "cheval");
            elsif Low = "travaux" then
               return Match_Case (Word, "travail");
            elsif Low = "yeux" then
               return Match_Case (Word, "oeil");
            end if;
         when Spanish_Inflection =>
            if Low = "luces" then
               return Match_Case (Word, "luz");
            elsif Low = "jueces" then
               return Match_Case (Word, "juez");
            end if;
         when Italian_Inflection =>
            if Low = "uomini" then
               return Match_Case (Word, "uomo");
            elsif Low = "uova" then
               return Match_Case (Word, "uovo");
            end if;
         when Portuguese_Inflection =>
            if Low = "maos" then
               return Match_Case (Word, "mao");
            elsif Low = "homens" then
               return Match_Case (Word, "homem");
            end if;
         when Dutch_Inflection =>
            if Low = "kinderen" then
               return Match_Case (Word, "kind");
            elsif Low = "steden" then
               return Match_Case (Word, "stad");
            end if;
         when Swedish_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "maen" then
               return Match_Case (Word, "man");
            end if;
         when Norwegian_Inflection | Norwegian_Bokmal_Inflection =>
            if Low = "barn" then
               return Match_Case (Word, "barn");
            elsif Low = "menn" then
               return Match_Case (Word, "mann");
            end if;
         when Finnish_Inflection | Turkish_Inflection =>
            null;
      end case;
      return "";
   end Language_Irregular_Singular;

   function Pluralize
     (Word : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Irregular_Plural (Word);
   begin
      if Hit'Length > 0 then
         return Ok_Text (Hit);
      elsif Is_Uncountable_Noun (Word) then
         return Ok_Text (Word);
      end if;

      if Ends_With (Low, "quiz") then
         return Ok_Text (Word & "zes");
      elsif Ends_With (Low, "is") and then Word'Length > 2 then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "es");
      elsif Ends_With (Low, "on") and then Word'Length > 2
        and then
          (Low = "criterion" or else Low = "phenomenon"
           or else Low = "automaton")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "a");
      elsif Ends_With (Low, "um") and then Word'Length > 2
        and then
          (Low = "bacterium" or else Low = "curriculum"
           or else Low = "datum" or else Low = "medium"
           or else Low = "memorandum" or else Low = "stratum")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "a");
      elsif Ends_With (Low, "us") and then Word'Length > 2
        and then
          (Low = "alumnus" or else Low = "cactus"
           or else Low = "focus" or else Low = "fungus"
           or else Low = "nucleus" or else Low = "radius"
           or else Low = "stimulus" or else Low = "syllabus")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "i");
      elsif (Ends_With (Low, "ex") or else Ends_With (Low, "ix"))
        and then Word'Length > 2
        and then
          (Low = "appendix" or else Low = "index"
           or else Low = "matrix" or else Low = "vertex")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "ices");
      elsif Ends_With (Low, "a") and then Low = "formula" then
         return Ok_Text (Word & "e");
      end if;

      if Ends_With (Low, "y") and then Word'Length > 1 then
         declare
            Prev : constant Character := Low (Low'Last - 1);
         begin
            if Prev /= 'a' and then Prev /= 'e' and then Prev /= 'i'
              and then Prev /= 'o' and then Prev /= 'u'
            then
               return Ok_Text (Word (Word'First .. Word'Last - 1) & "ies");
            end if;
         end;
      end if;

      if Ends_With (Low, "fe") and then Word'Length > 2
        and then
          (Low = "knife" or else Low = "life" or else Low = "wife")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "ves");
      elsif Ends_With (Low, "f") and then Word'Length > 1
        and then
          (Low = "calf" or else Low = "elf" or else Low = "half"
           or else Low = "leaf" or else Low = "loaf" or else Low = "self"
           or else Low = "shelf" or else Low = "thief" or else Low = "wolf")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 1) & "ves");
      elsif Needs_Oes_Plural (Low) then
         return Ok_Text (Word & "es");
      elsif Ends_With (Low, "s") or else Ends_With (Low, "x")
        or else Ends_With (Low, "z") or else Ends_With (Low, "ch")
        or else Ends_With (Low, "sh")
      then
         return Ok_Text (Word & "es");
      else
         return Ok_Text (Word & "s");
      end if;
   end Pluralize;

   function Word_Position
     (List : String;
      Word : String)
      return Natural
   is
      Item : Unbounded_String;
      Pos  : Natural := 0;

      procedure Flush (Found : in out Natural) is
         Raw : constant String := To_String (Item);
         Low : Unbounded_String;
      begin
         if Raw'Length > 0 then
            Pos := Pos + 1;
            for Ch of Raw loop
               Append (Low, Lower (Ch));
            end loop;
            if To_String (Low) = Word then
               Found := Pos;
            end if;
         end if;
         Item := Null_Unbounded_String;
      end Flush;

      Found : Natural := 0;
   begin
      for Ch of List loop
         if Ch = ',' or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            Flush (Found);
            exit when Found /= 0;
         else
            Append (Item, Ch);
         end if;
      end loop;
      if Found = 0 then
         Flush (Found);
      end if;
      return Found;
   end Word_Position;

   function Word_At
     (List     : String;
      Position : Natural)
      return String
   is
      Item : Unbounded_String;
      Pos  : Natural := 0;

      procedure Flush (Result : in out Unbounded_String) is
      begin
         if Length (Item) > 0 then
            Pos := Pos + 1;
            if Pos = Position then
               Result := Item;
            end if;
         end if;
         Item := Null_Unbounded_String;
      end Flush;

      Result : Unbounded_String;
   begin
      if Position = 0 then
         return "";
      end if;

      for Ch of List loop
         if Ch = ',' or else Ch = ' ' or else Ch = ASCII.HT or else Ch = ASCII.LF then
            Flush (Result);
            exit when Length (Result) > 0;
         else
            Append (Item, Ch);
         end if;
      end loop;
      if Length (Result) = 0 then
         Flush (Result);
      end if;
      return To_String (Result);
   end Word_At;

   function Pluralize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Result_Text (Humanize.Strings.Identifiers.Parameterize (Word, '_'));
      Pos : constant Natural := Word_Position (Singulars, Low);
      Hit : constant String := Word_At (Plurals, Pos);
   begin
      if Hit'Length > 0 then
         return Ok_Text (Hit);
      else
         return Pluralize (Word);
      end if;
   end Pluralize_With_Dictionary;

   function Singularize
     (Word : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Irregular_Singular (Word);
   begin
      if Hit'Length > 0 then
         return Ok_Text (Hit);
      elsif Is_Uncountable_Noun (Word) then
         return Ok_Text (Word);
      end if;

      if Ends_With (Low, "quizzes") and then Word'Length > 6 then
         return Ok_Text (Word (Word'First .. Word'Last - 3));
      elsif Ends_With (Low, "yses") and then Word'Length > 4 then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "is");
      elsif Ends_With (Low, "ses") and then Word'Length > 3
        and then
          (Low = "analyses" or else Low = "axes" or else Low = "bases"
           or else Low = "crises" or else Low = "diagnoses"
           or else Low = "emphases" or else Low = "oases"
           or else Low = "parentheses" or else Low = "synopses"
           or else Low = "theses")
      then
         return Ok_Text (Word (Word'First .. Word'Last - 2) & "is");
      elsif Ends_With (Low, "a") and then Word'Length > 1
        and then
          (Low = "automata" or else Low = "bacteria"
           or else Low = "criteria" or else Low = "curricula"
           or else Low = "data" or else Low = "media"
           or else Low = "memoranda" or else Low = "phenomena"
           or else Low = "strata")
      then
         if Low = "criteria" then
            return Ok_Text (Match_Case (Word, "criterion"));
         elsif Low = "phenomena" then
            return Ok_Text (Match_Case (Word, "phenomenon"));
         elsif Low = "automata" then
            return Ok_Text (Match_Case (Word, "automaton"));
         elsif Low = "media" then
            return Ok_Text (Match_Case (Word, "medium"));
         else
            return Ok_Text (Word (Word'First .. Word'Last - 1) & "um");
         end if;
      elsif Ends_With (Low, "i") and then Word'Length > 1
        and then
          (Low = "alumni" or else Low = "cacti"
           or else Low = "foci" or else Low = "fungi"
           or else Low = "nuclei" or else Low = "radii"
           or else Low = "stimuli" or else Low = "syllabi")
      then
         if Low = "alumni" then
            return Ok_Text (Match_Case (Word, "alumnus"));
         elsif Low = "cacti" then
            return Ok_Text (Match_Case (Word, "cactus"));
         elsif Low = "foci" then
            return Ok_Text (Match_Case (Word, "focus"));
         elsif Low = "fungi" then
            return Ok_Text (Match_Case (Word, "fungus"));
         elsif Low = "nuclei" then
            return Ok_Text (Match_Case (Word, "nucleus"));
         elsif Low = "radii" then
            return Ok_Text (Match_Case (Word, "radius"));
         elsif Low = "stimuli" then
            return Ok_Text (Match_Case (Word, "stimulus"));
         else
            return Ok_Text (Match_Case (Word, "syllabus"));
         end if;
      elsif Ends_With (Low, "ices") and then Word'Length > 4
        and then
          (Low = "appendices" or else Low = "indices"
           or else Low = "matrices" or else Low = "vertices")
      then
         if Low = "appendices" then
            return Ok_Text (Match_Case (Word, "appendix"));
         elsif Low = "indices" then
            return Ok_Text (Match_Case (Word, "index"));
         elsif Low = "matrices" then
            return Ok_Text (Match_Case (Word, "matrix"));
         else
            return Ok_Text (Match_Case (Word, "vertex"));
         end if;
      elsif Ends_With (Low, "formulae") and then Word'Length > 7 then
         return Ok_Text (Word (Word'First .. Word'Last - 1));
      elsif Ends_With (Low, "ies") and then Word'Length > 3 then
         return Ok_Text (Word (Word'First .. Word'Last - 3) & "y");
      elsif Ends_With (Low, "ves") and then Word'Length > 3 then
         declare
            Stem : constant String := Low (Low'First .. Low'Last - 3);
            Original_Stem : constant String := Word (Word'First .. Word'Last - 3);
         begin
            if Stem = "kni" then
               return Ok_Text (Match_Case (Word, "knife"));
            elsif Stem = "li" then
               return Ok_Text (Match_Case (Word, "life"));
            elsif Stem = "wi" then
               return Ok_Text (Match_Case (Word, "wife"));
            elsif Stem = "cal" or else Stem = "el" or else Stem = "hal"
              or else Stem = "lea" or else Stem = "loa" or else Stem = "sel"
              or else Stem = "shel" or else Stem = "thie" or else Stem = "wol"
            then
               return Ok_Text (Original_Stem & "f");
            end if;
         end;
      elsif Ends_With (Low, "oes") and then Word'Length > 3 then
         declare
            Stem : constant String := Low (Low'First .. Low'Last - 2);
         begin
            if Needs_Oes_Plural (Stem) then
               return Ok_Text (Word (Word'First .. Word'Last - 2));
            end if;
         end;
      elsif Ends_With (Low, "es") and then Word'Length > 2 then
         declare
            Stem : constant String := Word (Word'First .. Word'Last - 2);
            Low_Stem : constant String := Low (Low'First .. Low'Last - 2);
         begin
            if Ends_With (Low_Stem, "s") or else Ends_With (Low_Stem, "x")
              or else Ends_With (Low_Stem, "z") or else Ends_With (Low_Stem, "ch")
              or else Ends_With (Low_Stem, "sh")
            then
               return Ok_Text (Stem);
            end if;
         end;
      end if;

      if Ends_With (Low, "s") and then Word'Length > 1 then
         return Ok_Text (Word (Word'First .. Word'Last - 1));
      else
         return Ok_Text (Word);
      end if;
   end Singularize;

   function Pluralize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Language_Irregular_Plural (Word, Language);
   begin
      if Hit'Length > 0 then
         return Ok_Text (Hit);
      end if;

      case Language is
         when English_Inflection =>
            return Pluralize (Word);
         when Danish_Inflection | Norwegian_Inflection
            | Norwegian_Bokmal_Inflection =>
            if Ends_With (Low, "e") then
               return Ok_Text (Word & "r");
            else
               return Ok_Text (Word & "er");
            end if;
         when German_Inflection =>
            if Ends_With (Low, "e") then
               return Ok_Text (Word & "n");
            elsif Ends_With (Low, "er") or else Ends_With (Low, "el")
              or else Ends_With (Low, "en") or else Ends_With (Low, "chen")
              or else Ends_With (Low, "lein")
            then
               return Ok_Text (Word);
            elsif Ends_With (Low, "a") or else Ends_With (Low, "i")
              or else Ends_With (Low, "o") or else Ends_With (Low, "u")
              or else Ends_With (Low, "y")
            then
               return Ok_Text (Word & "s");
            else
               return Ok_Text (Word & "e");
            end if;
         when French_Inflection =>
            if Ends_With (Low, "s") or else Ends_With (Low, "x")
              or else Ends_With (Low, "z")
            then
               return Ok_Text (Word);
            elsif Ends_With (Low, "al") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "aux");
            elsif Ends_With (Low, "au") or else Ends_With (Low, "eau")
              or else Ends_With (Low, "eu")
            then
               return Ok_Text (Word & "x");
            else
               return Ok_Text (Word & "s");
            end if;
         when Spanish_Inflection =>
            if Ends_With (Low, "z") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "ces");
            elsif Is_ASCII_Vowel (Last_Character (Low)) then
               return Ok_Text (Word & "s");
            else
               return Ok_Text (Word & "es");
            end if;
         when Italian_Inflection =>
            if Ends_With (Low, "ca") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "che");
            elsif Ends_With (Low, "ga") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "ghe");
            elsif Ends_With (Low, "co") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "chi");
            elsif Ends_With (Low, "go") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "ghi");
            elsif Ends_With (Low, "o") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "i");
            elsif Ends_With (Low, "a") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "e");
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "i");
            else
               return Ok_Text (Word);
            end if;
         when Portuguese_Inflection =>
            if Ends_With (Low, "cao") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "coes");
            elsif Ends_With (Low, "al") or else Ends_With (Low, "el")
              or else Ends_With (Low, "ol") or else Ends_With (Low, "ul")
            then
               return Ok_Text (Remove_Last (Word, 1) & "is");
            elsif Ends_With (Low, "m") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "ns");
            elsif Ends_With (Low, "r") or else Ends_With (Low, "z") then
               return Ok_Text (Word & "es");
            elsif Is_ASCII_Vowel (Last_Character (Low)) then
               return Ok_Text (Word & "s");
            else
               return Ok_Text (Word & "es");
            end if;
         when Dutch_Inflection =>
            if Ends_With (Low, "s") or else Ends_With (Low, "x") then
               return Ok_Text (Word);
            elsif Ends_With (Low, "e") then
               return Ok_Text (Word & "n");
            else
               return Ok_Text (Word & "en");
            end if;
         when Swedish_Inflection =>
            if Ends_With (Low, "a") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "or");
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok_Text (Word & "r");
            else
               return Ok_Text (Word & "ar");
            end if;
         when Finnish_Inflection =>
            if Ends_With (Low, "t") then
               return Ok_Text (Word);
            else
               return Ok_Text (Word & "t");
            end if;
         when Turkish_Inflection =>
            declare
               Last_Vowel : Character := ASCII.NUL;
            begin
               for Ch of Low loop
                  if Ch = 'a' or else Ch = 'e' or else Ch = 'i'
                    or else Ch = 'o' or else Ch = 'u'
                  then
                     Last_Vowel := Ch;
                  end if;
               end loop;

               if Last_Vowel = 'e' or else Last_Vowel = 'i' then
                  return Ok_Text (Word & "ler");
               else
                  return Ok_Text (Word & "lar");
               end if;
            end;
      end case;
   end Pluralize_In_Language;

   function Singularize_In_Language
     (Word     : String;
      Language : Inflection_Language)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Inflection_Key (Word);
      Hit : constant String := Language_Irregular_Singular (Word, Language);
   begin
      if Hit'Length > 0 then
         return Ok_Text (Hit);
      end if;

      case Language is
         when English_Inflection =>
            return Singularize (Word);
         when Danish_Inflection | Norwegian_Inflection
            | Norwegian_Bokmal_Inflection =>
            if Ends_With (Low, "er") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2));
            elsif Ends_With (Low, "r") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when German_Inflection =>
            if Ends_With (Low, "chen") or else Ends_With (Low, "lein") then
               return Ok_Text (Word);
            elsif Ends_With (Low, "nen") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 1));
            elsif Ends_With (Low, "en") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2));
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when French_Inflection =>
            if Ends_With (Low, "eaux") and then Word'Length > 4 then
               return Ok_Text (Remove_Last (Word, 1));
            elsif Ends_With (Low, "aux") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "al");
            elsif Ends_With (Low, "x") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when Spanish_Inflection =>
            if Ends_With (Low, "ces") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "z");
            elsif Ends_With (Low, "es") and then Word'Length > 2
              and then not Is_ASCII_Vowel (Low (Low'Last - 2))
            then
               return Ok_Text (Remove_Last (Word, 2));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when Italian_Inflection =>
            if Ends_With (Low, "che") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "ca");
            elsif Ends_With (Low, "ghe") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "ga");
            elsif Ends_With (Low, "chi") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "co");
            elsif Ends_With (Low, "ghi") and then Word'Length > 3 then
               return Ok_Text (Remove_Last (Word, 3) & "go");
            elsif Ends_With (Low, "i") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "o");
            elsif Ends_With (Low, "e") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1) & "a");
            else
               return Ok_Text (Word);
            end if;
         when Portuguese_Inflection =>
            if Ends_With (Low, "coes") and then Word'Length > 4 then
               return Ok_Text (Remove_Last (Word, 4) & "cao");
            elsif Ends_With (Low, "is") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "l");
            elsif Ends_With (Low, "ns") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "m");
            elsif Ends_With (Low, "es") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2));
            elsif Ends_With (Low, "s") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when Dutch_Inflection =>
            if Ends_With (Low, "en") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2));
            elsif Ends_With (Low, "n") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when Swedish_Inflection =>
            if Ends_With (Low, "or") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2) & "a");
            elsif Ends_With (Low, "ar") and then Word'Length > 2 then
               return Ok_Text (Remove_Last (Word, 2));
            elsif Ends_With (Low, "r") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when Finnish_Inflection =>
            if Ends_With (Low, "t") and then Word'Length > 1 then
               return Ok_Text (Remove_Last (Word, 1));
            else
               return Ok_Text (Word);
            end if;
         when Turkish_Inflection =>
            if Ends_With (Low, "lar") or else Ends_With (Low, "ler") then
               return Ok_Text (Remove_Last (Word, 3));
            else
               return Ok_Text (Word);
            end if;
      end case;
   end Singularize_In_Language;

   function Inflection_Language_Label
     (Language : Inflection_Language)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (case Language is
            when English_Inflection           => "en",
            when Danish_Inflection            => "da",
            when German_Inflection            => "de",
            when French_Inflection            => "fr",
            when Spanish_Inflection           => "es",
            when Italian_Inflection           => "it",
            when Portuguese_Inflection        => "pt",
            when Dutch_Inflection             => "nl",
            when Swedish_Inflection           => "sv",
            when Norwegian_Inflection         => "no",
            when Norwegian_Bokmal_Inflection  => "nb",
            when Finnish_Inflection           => "fi",
            when Turkish_Inflection           => "tr");
   end Inflection_Language_Label;

   function Singularize_With_Dictionary
     (Word      : String;
      Singulars : String;
      Plurals   : String)
      return Humanize.Status.Text_Result
   is
      Low : constant String := Result_Text (Humanize.Strings.Identifiers.Parameterize (Word, '_'));
      Pos : constant Natural := Word_Position (Plurals, Low);
      Hit : constant String := Word_At (Singulars, Pos);
   begin
      if Hit'Length > 0 then
         return Ok_Text (Hit);
      else
         return Singularize (Word);
      end if;
   end Singularize_With_Dictionary;

   function Dictionary_Plural
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Preserve  : Boolean)
      return String
   is
      Low : constant String := Inflection_Key (Word);
      Pos : constant Natural := Word_Position (Singulars, Low);
      Hit : constant String := Word_At (Plurals, Pos);
   begin
      if Hit'Length = 0 then
         return "";
      elsif Preserve then
         return Hit;
      else
         return Lower_ASCII (Hit);
      end if;
   end Dictionary_Plural;

   function Dictionary_Singular
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Preserve  : Boolean)
      return String
   is
      Low : constant String := Inflection_Key (Word);
      Pos : constant Natural := Word_Position (Plurals, Low);
      Hit : constant String := Word_At (Singulars, Pos);
   begin
      if Hit'Length = 0 then
         return "";
      elsif Preserve then
         return Hit;
      else
         return Lower_ASCII (Hit);
      end if;
   end Dictionary_Singular;

   function Pluralize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
   is
      Input : constant String :=
        (if Options.Preserve_Case then Word else Inflection_Key (Word));
      Dict  : constant String :=
        Dictionary_Plural (Word, Singulars, Plurals, Options.Preserve_Case);
   begin
      if Options.Rule_Order = Built_In_First
        and then (Irregular_Plural (Word)'Length > 0
                  or else Is_Uncountable_Noun (Word))
      then
         return Pluralize (Input);
      elsif Dict'Length > 0 then
         return Ok_Text (Dict);
      else
         return Pluralize (Input);
      end if;
   end Pluralize_With_Options;

   function Singularize_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Humanize.Status.Text_Result
   is
      Input : constant String :=
        (if Options.Preserve_Case then Word else Inflection_Key (Word));
      Dict  : constant String :=
        Dictionary_Singular (Word, Singulars, Plurals, Options.Preserve_Case);
   begin
      if Options.Rule_Order = Built_In_First
        and then (Irregular_Singular (Word)'Length > 0
                  or else Is_Uncountable_Noun (Word))
      then
         return Singularize (Input);
      elsif Dict'Length > 0 then
         return Ok_Text (Dict);
      else
         return Singularize (Input);
      end if;
   end Singularize_With_Options;

   function Is_Irregular_Singular (Word : String) return Boolean is
      Hit : constant String := Irregular_Plural (Word);
   begin
      return Hit'Length > 0;
   end Is_Irregular_Singular;

   function Is_Irregular_Plural (Word : String) return Boolean is
      Hit : constant String := Irregular_Singular (Word);
   begin
      return Hit'Length > 0;
   end Is_Irregular_Plural;

   function Pluralize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
   is
   begin
      return Pluralize_Source_With_Options
        (Word, Singulars, Plurals, Default_Inflection_Options);
   end Pluralize_Source;

   function Singularize_Source
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "")
      return Inflection_Source
   is
   begin
      return Singularize_Source_With_Options
        (Word, Singulars, Plurals, Default_Inflection_Options);
   end Singularize_Source;

   function Pluralize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
   is
      Low : constant String := Inflection_Key (Word);
      Dict : constant Boolean := Word_Position (Singulars, Low) /= 0;
      Result : constant Humanize.Status.Text_Result :=
        Pluralize_With_Options (Word, Singulars, Plurals, Options);
   begin
      if Options.Rule_Order = Built_In_First and then Is_Irregular_Singular (Word) then
         return Irregular_Inflection;
      elsif Options.Rule_Order = Built_In_First and then Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Dict then
         return Dictionary_Inflection;
      elsif Is_Irregular_Singular (Word) then
         return Irregular_Inflection;
      elsif Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Result.Status = Humanize.Status.Ok
        and then Result_Text (Result) = Word
      then
         return Unchanged_Inflection;
      else
         return Rule_Inflection;
      end if;
   end Pluralize_Source_With_Options;

   function Singularize_Source_With_Options
     (Word      : String;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
      return Inflection_Source
   is
      Low : constant String := Inflection_Key (Word);
      Dict : constant Boolean := Word_Position (Plurals, Low) /= 0;
      Result : constant Humanize.Status.Text_Result :=
        Singularize_With_Options (Word, Singulars, Plurals, Options);
   begin
      if Options.Rule_Order = Built_In_First and then Is_Irregular_Plural (Word) then
         return Irregular_Inflection;
      elsif Options.Rule_Order = Built_In_First and then Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Dict then
         return Dictionary_Inflection;
      elsif Is_Irregular_Plural (Word) then
         return Irregular_Inflection;
      elsif Is_Uncountable_Noun (Word) then
         return Uncountable_Inflection;
      elsif Result.Status = Humanize.Status.Ok
        and then Result_Text (Result) = Word
      then
         return Unchanged_Inflection;
      else
         return Rule_Inflection;
      end if;
   end Singularize_Source_With_Options;

   function Inflection_Source_Label
     (Source : Inflection_Source)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (case Source is
            when Dictionary_Inflection => "dictionary",
            when Irregular_Inflection  => "irregular",
            when Uncountable_Inflection => "uncountable",
            when Rule_Inflection       => "rule",
            when Unchanged_Inflection  => "unchanged");
   end Inflection_Source_Label;

   procedure Pluralize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Pluralize (Word), Target, Written, Status);
   end Pluralize_Into;

   procedure Singularize_Into
     (Word    : String;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Singularize (Word), Target, Written, Status);
   end Singularize_Into;

   procedure Pluralize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Pluralize_In_Language (Word, Language), Target, Written, Status);
   end Pluralize_In_Language_Into;

   procedure Singularize_In_Language_Into
     (Word     : String;
      Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Singularize_In_Language (Word, Language), Target, Written, Status);
   end Singularize_In_Language_Into;

   procedure Pluralize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Pluralize_With_Dictionary (Word, Singulars, Plurals),
         Target, Written, Status);
   end Pluralize_With_Dictionary_Into;

   procedure Singularize_With_Dictionary_Into
     (Word      : String;
      Singulars : String;
      Plurals   : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Singularize_With_Dictionary (Word, Singulars, Plurals),
         Target, Written, Status);
   end Singularize_With_Dictionary_Into;

   procedure Pluralize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
   is
   begin
      Copy_Into
        (Pluralize_With_Options (Word, Singulars, Plurals, Options),
         Target, Written, Status);
   end Pluralize_With_Options_Into;

   procedure Singularize_With_Options_Into
     (Word      : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Singulars : String := "";
      Plurals   : String := "";
      Options   : Inflection_Options := Default_Inflection_Options)
   is
   begin
      Copy_Into
        (Singularize_With_Options (Word, Singulars, Plurals, Options),
         Target, Written, Status);
   end Singularize_With_Options_Into;

   procedure Inflection_Source_Label_Into
     (Source  : Inflection_Source;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into (Inflection_Source_Label (Source), Target, Written, Status);
   end Inflection_Source_Label_Into;

   procedure Inflection_Language_Label_Into
     (Language : Inflection_Language;
      Target   : in out String;
      Written  : out Natural;
      Status   : out Humanize.Status.Status_Code)
   is
   begin
      Copy_Into
        (Inflection_Language_Label (Language), Target, Written, Status);
   end Inflection_Language_Label_Into;
end Humanize.Strings.Inflections;
