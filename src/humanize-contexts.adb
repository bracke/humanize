package body Humanize.Contexts is

   use Ada.Strings.Unbounded;

   function Create
     (Runtime : Runtime_Access;
      Locale  : I18N.Locales.Locale_Id)
      return Context
   is
   begin
      return
        (Runtime_Ref => Runtime,
         Locale_Text => To_Unbounded_String (Locale),
         Noun_Forms  => Null_Unbounded_String);
   end Create;

   function Locale
     (Item : Context)
      return I18N.Locales.Locale_Id
   is
   begin
      return To_String (Item.Locale_Text);
   end Locale;

   function Runtime
     (Item : Context)
      return Runtime_Access
   is
   begin
      return Item.Runtime_Ref;
   end Runtime;

   Field  : constant Character := Character'Val (16#1F#);
   Record_End : constant Character := Character'Val (16#1E#);

   function With_Noun_Forms
     (Item   : Context;
      Plural : String;
      Zero   : String := "";
      Two    : String := "";
      Few    : String := "";
      Many   : String := "")
      return Context
   is
      Result : Context := Item;

      procedure Add (Category, Form : String) is
      begin
         if Form /= "" then
            Append (Result.Noun_Forms, Plural & Field & Category & Field & Form & Record_End);
         end if;
      end Add;
   begin
      --  A later registration of the same form comes first, so it wins.
      Result.Noun_Forms := Null_Unbounded_String;
      Add ("zero", Zero);
      Add ("two", Two);
      Add ("few", Few);
      Add ("many", Many);
      Append (Result.Noun_Forms, Item.Noun_Forms);
      return Result;
   end With_Noun_Forms;

   function Noun_Form
     (Item     : Context;
      Plural   : String;
      Category : String)
      return String
   is
      Forms : constant String := To_String (Item.Noun_Forms);
      Head  : constant String := Plural & Field & Category & Field;
      Start : Positive := Forms'First;
   begin
      for Index in Forms'Range loop
         if Forms (Index) = Record_End then
            declare
               Entry_Text : constant String := Forms (Start .. Index - 1);
            begin
               if Entry_Text'Length > Head'Length
                 and then Entry_Text (Entry_Text'First .. Entry_Text'First + Head'Length - 1) = Head
               then
                  return Entry_Text (Entry_Text'First + Head'Length .. Entry_Text'Last);
               end if;
            end;
            Start := Index + 1;
         end if;
      end loop;
      return Plural;
   end Noun_Form;

end Humanize.Contexts;
