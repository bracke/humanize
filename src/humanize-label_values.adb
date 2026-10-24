with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.Decimal_Images;
with Humanize.I18N_Rendering;
with Humanize.Locales;
with Humanize.Message_Keys;
with Humanize.Numbers;
with Humanize.Selections;

package body Humanize.Label_Values is

   use type Humanize.Status.Status_Code;

   Max_Places : constant Natural := 9;

   function With_Unit (Text, Unit : String) return String is
      Clean_Unit : constant String := Humanize.Bounded_Text.Clean (Unit);
   begin
      return (if Clean_Unit'Length = 0 then Text else Text & " " & Clean_Unit);
   end With_Unit;

   function Fixed
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Places  : Natural)
      return String
   is
      Image : constant String :=
        Humanize.Decimal_Images.Decimal_Image (Value, Natural'Min (Places, Max_Places), False);
   begin
      --  "-0" when a small negative value rounds to zero is "0", as the parents write it
      return Humanize.I18N_Rendering.Local_Decimal
        (Context, (if Image'Length > 1 and then Image (Image'First) = '-'
                     and then (for all C of Image => C in '-' | '0' | '.') then Image (Image'First + 1 .. Image'Last)
                   else Image));
   end Fixed;

   function Plain
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float)
      return String is
     (Humanize.I18N_Rendering.Local_Decimal (Context, Humanize.Bounded_Text.Float_Image (Value)));

   function Fixed_With_Unit
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String;
      Places  : Natural)
      return String is
     (With_Unit (Fixed (Context, Value, Places), Unit));

   function Plain_With_Unit
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Unit    : String)
      return String is
     (With_Unit (Plain (Context, Value), Unit));

   function Percent
     (Context : Humanize.Contexts.Context;
      Value   : Long_Float;
      Places  : Natural := 0)
      return String
   is
   begin
      if Places <= 3 then
         declare
            Shown : constant Humanize.Status.Text_Result :=
              Humanize.Numbers.Percent
                (Context, Value, (Maximum_Fraction_Digits => Places, Suppress_Trailing_Zero => Places = 0));
         begin
            if Shown.Status = Humanize.Status.Ok then
               return Ada.Strings.Unbounded.To_String (Shown.Text);
            end if;
         end;
      end if;
      return Fixed (Context, Value, Places) & "%";
   end Percent;

   function Unit_Or (Unit, Default : String) return String is
      Clean_Unit : constant String := Humanize.Bounded_Text.Clean (Unit);
   begin
      return (if Clean_Unit'Length = 0 then Default else Clean_Unit);
   end Unit_Or;

   function Count_Part
     (Context : Humanize.Contexts.Context;
      Key     : String;
      Count   : Long_Long_Integer)
      return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Render
        (Context, Humanize.Selections.With_Arg (Humanize.Selections.Phrase (Key), "count", Count)));

   function Join
     (Context : Humanize.Contexts.Context;
      Sofar   : Humanize.Status.Text_Result;
      Part    : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result
   is
      use type Ada.Strings.Unbounded.Unbounded_String;
   begin
      if Sofar.Status /= Humanize.Status.Ok then
         return Sofar;
      elsif Part.Status /= Humanize.Status.Ok or else Sofar.Text = Ada.Strings.Unbounded.Null_Unbounded_String then
         return Part;
      end if;
      return Humanize.I18N_Rendering.Render
        (Context,
         Humanize.Selections.With_Arg
           (Humanize.Selections.With_Arg (Humanize.Selections.Phrase ("label.parts"), "first", Text_Of (Sofar)),
            "second", Text_Of (Part)));
   end Join;

   function Localized_Or
     (Context : Humanize.Contexts.Context;
      Result  : Humanize.Status.Text_Result;
      English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (if Result.Status /= Humanize.Status.Ok
        or else Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context)) in "en" | ""
      then English else Result);

   function Decorated
     (English       : Humanize.Status.Text_Result;
      Plain_English : Humanize.Status.Text_Result;
      Plain         : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result
   is
      use type Ada.Strings.Unbounded.Unbounded_String;
      Text : constant String := Text_Of (English);
      Stop : constant Natural := Ada.Strings.Fixed.Index (Text, "] ");
   begin
      if English.Status /= Humanize.Status.Ok or else Plain.Status /= Humanize.Status.Ok
        or else Plain_English.Status /= Humanize.Status.Ok or else Plain.Text = Plain_English.Text
      then
         return English;
      end if;
      return
        (Status => Humanize.Status.Ok,
         Text   => Ada.Strings.Unbounded.To_Unbounded_String
           ((if Text'Length > 0 and then Text (Text'First) = '[' and then Stop > 0 then Text (Text'First .. Stop + 1)
             else "") & Text_Of (Plain)),
         Key    => Plain.Key);
   end Decorated;

   function Is_Digit (C : Character) return Boolean is (C in '0' .. '9');

   function Is_Hex (C : Character) return Boolean is (C in '0' .. '9' | 'A' .. 'F' | 'a' .. 'f');

   --  The token starting at Text (From): its last index and kind, 'n', 'd' or
   --  'c'; Last < From where no value starts there.
   procedure Token (Text : String; From : Positive; Last : out Natural; Kind : out Character) is
      I : Natural := From;
   begin
      Last := From - 1;
      Kind := ' ';
      if Text (From) = '#' and then From + 6 <= Text'Last
        and then (for all J in From + 1 .. From + 6 => Is_Hex (Text (J)))
        and then (From + 6 = Text'Last or else not Is_Hex (Text (From + 7)))
      then
         Last := From + 6;
         Kind := 'c';
      elsif Is_Digit (Text (From))
        and then (From = Text'First or else Text (From - 1) not in '0' .. '9' | 'A' .. 'Z' | 'a' .. 'z')
      then
         --  a number on its own, not the digits of a name ("CIEDE2000")
         while I < Text'Last and then Is_Digit (Text (I + 1)) loop
            I := I + 1;
         end loop;
         Kind := 'n';
         if I + 1 < Text'Last and then Text (I + 1) = '.' and then Is_Digit (Text (I + 2)) then
            I := I + 2;
            while I < Text'Last and then Is_Digit (Text (I + 1)) loop
               I := I + 1;
            end loop;
            Kind := 'd';
         end if;
         Last := I;
      end if;
   end Token;

   function Shape_Slug (Text : String) return String is
      Result : Ada.Strings.Unbounded.Unbounded_String;
      I      : Natural := Text'First;
      Gap    : Boolean := False;
      Last   : Natural;
      Kind   : Character;

      procedure Add (C : Character) is
      begin
         if Gap and then Ada.Strings.Unbounded.Length (Result) > 0 then
            Ada.Strings.Unbounded.Append (Result, '_');
         end if;
         Gap := False;
         Ada.Strings.Unbounded.Append (Result, C);
      end Add;
   begin
      while I <= Text'Last loop
         Token (Text, I, Last, Kind);
         if Last >= I then
            Gap := True;
            Add (Kind);
            Gap := True;
            I := Last + 1;
         else
            if Text (I) in 'a' .. 'z' | '0' .. '9' then
               Add (Text (I));
            elsif Text (I) in 'A' .. 'Z' then
               Add (Character'Val (Character'Pos (Text (I)) + 32));
            else
               Gap := True;
            end if;
            I := I + 1;
         end if;
      end loop;
      return Ada.Strings.Unbounded.To_String (Result);
   end Shape_Slug;

   --  One segment, its phrase rendered with its values.
   function Shaped_Segment
     (Context      : Humanize.Contexts.Context;
      Prefix, Text : String)
      return Humanize.Status.Text_Result
   is
      Selection : Humanize.Selections.Message_Selection :=
        Humanize.Selections.Phrase (Prefix & "." & Shape_Slug (Text));
      I         : Natural := Text'First;
      Count     : Natural := 0;
      Last      : Natural;
      Kind      : Character;
   begin
      while I <= Text'Last loop
         Token (Text, I, Last, Kind);
         if Last >= I then
            Count := Count + 1;
            declare
               Name  : constant String := "v" & Humanize.Bounded_Text.Image (Count);
               Value : constant String := Text (I .. Last);
            begin
               Selection :=
                 (case Kind is
                     when 'n' => Humanize.Selections.With_Arg (Selection, Name, Long_Long_Integer'Value (Value)),
                     when 'd' => Humanize.Selections.With_Arg
                                   (Selection, Name, Humanize.I18N_Rendering.Local_Decimal (Context, Value)),
                     when others => Humanize.Selections.With_Arg (Selection, Name, Value));
            end;
            I := Last + 1;
         else
            I := I + 1;
         end if;
      end loop;
      return Humanize.I18N_Rendering.Render (Context, Selection);
   end Shaped_Segment;

   --  Text composed by its shape in Context's locale: its segments' phrases,
   --  joined; not Ok where a segment has no phrase.
   function Composed
     (Context   : Humanize.Contexts.Context;
      Prefix    : String;
      Text      : String;
      Separator : String)
      return Humanize.Status.Text_Result
   is
      use type Ada.Strings.Unbounded.Unbounded_String;
      Join   : constant String := (if Separator = "; " then "label.groups" else "label.parts");
      Result : Humanize.Status.Text_Result := Nothing;
      Start  : Positive := Text'First;
      Stop   : Natural;
   begin
      loop
         Stop := (if Separator = "" then 0 else Ada.Strings.Fixed.Index (Text (Start .. Text'Last), Separator));
         declare
            Part : constant Humanize.Status.Text_Result :=
              Shaped_Segment (Context, Prefix, Text (Start .. (if Stop = 0 then Text'Last else Stop - 1)));
         begin
            if Part.Status /= Humanize.Status.Ok then
               return Part;
            elsif Result.Text = Ada.Strings.Unbounded.Null_Unbounded_String then
               Result := Part;
            else
               Result := Humanize.I18N_Rendering.Render
                 (Context,
                  Humanize.Selections.With_Arg
                    (Humanize.Selections.With_Arg
                       (Humanize.Selections.Phrase (Join), "first", Text_Of (Result)),
                     "second", Text_Of (Part)));
               if Result.Status /= Humanize.Status.Ok then
                  return Result;
               end if;
            end if;
         end;
         exit when Stop = 0;
         Start := Stop + Separator'Length;
      end loop;
      return Result;
   end Composed;

   function Shaped
     (Context   : Humanize.Contexts.Context;
      Prefix    : String;
      English   : Humanize.Status.Text_Result;
      Separator : String := "")
      return Humanize.Status.Text_Result
   is
      use type Ada.Strings.Unbounded.Unbounded_String;
      Locale : constant String := Humanize.Contexts.Locale (Context);
      Text   : constant String := Text_Of (English);
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      elsif Humanize.Locales.Language_Code (Locale) in "en" | "" then
         --  A regional English (en-GB "colours") where its catalog differs
         --  from en's, as Humanize.I18N_Rendering.Phrase_Or decides.
         if Locale'Length > 2 then
            declare
               Regional : constant Humanize.Status.Text_Result := Composed (Context, Prefix, Text, Separator);
               Plain    : constant Humanize.Status.Text_Result :=
                 Composed
                   (Humanize.Contexts.Create (Humanize.Contexts.Runtime (Context), "en"), Prefix, Text, Separator);
            begin
               if Regional.Status = Humanize.Status.Ok and then Plain.Status = Humanize.Status.Ok
                 and then Regional.Text /= Plain.Text
               then
                  return Regional;
               end if;
            end;
         end if;
         return English;
      end if;
      declare
         Result : constant Humanize.Status.Text_Result := Composed (Context, Prefix, Text, Separator);
      begin
         return (if Result.Status = Humanize.Status.Ok then Result else English);
      end;
   end Shaped;

   function Nothing return Humanize.Status.Text_Result is
     ((Status => Humanize.Status.Ok, Text => Ada.Strings.Unbounded.Null_Unbounded_String,
       Key => Humanize.Message_Keys.No_Message));

   function Agreeing
     (Context : Humanize.Contexts.Context;
      Prefix  : String;
      Word    : String;
      Hue     : String;
      Fallback : String)
      return String
   is
      Gender : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context, Humanize.Selections.Phrase ("label.names.hue_gender." & Shape_Slug (Hue)));
   begin
      if Gender.Status /= Humanize.Status.Ok then
         return Fallback;
      end if;
      declare
         Form : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render
             (Context,
              Humanize.Selections.With_Arg
                (Humanize.Selections.Phrase (Prefix & "." & Shape_Slug (Word)), "gender", Text_Of (Gender)));
      begin
         return (if Form.Status = Humanize.Status.Ok then Text_Of (Form) else Fallback);
      end;
   end Agreeing;

   function Hue_Noun
     (Context  : Humanize.Contexts.Context;
      Hue      : String;
      Fallback : String)
      return String
   is
      Noun : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Render
          (Context, Humanize.Selections.Phrase ("label.names.hue_noun." & Shape_Slug (Hue)));
   begin
      return (if Noun.Status = Humanize.Status.Ok then Text_Of (Noun) else Fallback);
   end Hue_Noun;

   function Value_After (Text, Marker : String) return String is
      At_Marker : constant Natural := Ada.Strings.Fixed.Index (Text, Marker);
   begin
      return (if At_Marker = 0 then Text else Text (At_Marker + Marker'Length .. Text'Last));
   end Value_After;

   function Before (Text, Marker : String) return String is
      At_Marker : constant Natural := Ada.Strings.Fixed.Index (Text, Marker);
   begin
      return (if At_Marker = 0 then Text else Text (Text'First .. At_Marker - 1));
   end Before;

   function Unbracketed (Text : String) return String is
      Item : constant String := Humanize.Bounded_Text.Clean (Text);
   begin
      return
        (if Item'Length >= 2 and then Item (Item'First) = '[' and then Item (Item'Last) = ']'
         then Item (Item'First + 1 .. Item'Last - 1) else Item);
   end Unbracketed;

   function Leading_Count (Text : String) return Long_Long_Integer is
      Last : Natural := Text'First - 1;
   begin
      while Last < Text'Last and then Is_Digit (Text (Last + 1)) loop
         Last := Last + 1;
      end loop;
      return (if Last < Text'First then 0 else Long_Long_Integer'Value (Text (Text'First .. Last)));
   end Leading_Count;

   function Word_List (Context : Humanize.Contexts.Context; Prefix, Words : String) return String is
      Result : Humanize.Status.Text_Result := Nothing;
      Start  : Positive := Words'First;
      Stop   : Natural;
   begin
      loop
         Stop := Ada.Strings.Fixed.Index (Words (Start .. Words'Last), ", ");
         Result := Join
           (Context, Result,
            Humanize.I18N_Rendering.Render
              (Context,
               Humanize.Selections.Phrase
                 (Prefix & "." & Shape_Slug (Words (Start .. (if Stop = 0 then Words'Last else Stop - 1))))));
         if Result.Status /= Humanize.Status.Ok then
            return Words;
         end if;
         exit when Stop = 0;
         Start := Stop + 2;
      end loop;
      return Text_Of (Result);
   end Word_List;

   function URL_Text (Context : Humanize.Contexts.Context; English : String) return String is
      Redacted : constant String := "[redacted user]";
      At_User  : constant Natural := Ada.Strings.Fixed.Index (English, Redacted);

      function Phrase (Key : String; Fallback : String) return String is
         Shown : constant Humanize.Status.Text_Result :=
           Humanize.I18N_Rendering.Render (Context, Humanize.Selections.Phrase (Key));
      begin
         return (if Shown.Status = Humanize.Status.Ok then Text_Of (Shown) else Fallback);
      end Phrase;

      --  Text with " query 3 params" in the locale's words.
      function With_Query (Text : String) return String is
         At_Query : constant Natural := Ada.Strings.Fixed.Index (Text, " query ");
      begin
         if At_Query = 0 then
            return Text;
         end if;
         declare
            After : constant String := Text (At_Query + 7 .. Text'Last);
            Words : constant String := Value_After (After, " ");
            Word  : constant String := (if Starts (Words, "params") then "params" else "param");
            Shown : constant Humanize.Status.Text_Result :=
              Humanize.I18N_Rendering.Render
                (Context,
                 Humanize.Selections.With_Arg
                   (Humanize.Selections.Phrase ("label.endpoints.url_label.query"), "count", Leading_Count (After)));
         begin
            return
              (if Shown.Status = Humanize.Status.Ok and then Starts (Words, "param")
               then Text (Text'First .. At_Query) & Text_Of (Shown) & Words (Words'First + Word'Length .. Words'Last)
               else Text);
         end;
      end With_Query;
   begin
      return With_Query
        (if At_User = 0 then English
         else English (English'First .. At_User - 1) & Phrase ("label.endpoints.url_label.redacted_user", Redacted)
              & English (At_User + Redacted'Length .. English'Last));
   end URL_Text;

   function Text_Of (Result : Humanize.Status.Text_Result) return String is
     (Ada.Strings.Unbounded.To_String (Result.Text));

end Humanize.Label_Values;
