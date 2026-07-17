with Humanize.Bounded_Text;
with Humanize.Locales;
with Humanize.Messages;

package body Humanize.Datetimes.Support.Relative_Locales is
   use type Humanize.Selections.Argument_Kind;

   type Slavic_Form is (One_Form, Few_Form, Many_Form);
   type Relative_Unit is
     (Rel_Second, Rel_Minute, Rel_Hour, Rel_Day, Rel_Week, Rel_Month,
      Rel_Year);

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Integer_Text (Value : Long_Long_Integer) return String
      renames Humanize.Bounded_Text.Image;

   function B (Hex : String) return String
      renames Humanize.Bounded_Text.Hex_Bytes;

   function Slavic_Form_For
     (Lang  : String;
      Count : Long_Long_Integer)
      return Slavic_Form
   is
      Mod_10  : constant Long_Long_Integer := Count mod 10;
      Mod_100 : constant Long_Long_Integer := Count mod 100;
   begin
      if Lang = "pl" then
         if Count = 1 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      elsif Lang = "cs" then
         if Count = 1 then
            return One_Form;
         elsif Count in 2 .. 4 then
            return Few_Form;
         else
            return Many_Form;
         end if;
      else
         if Mod_10 = 1 and then Mod_100 /= 11 then
            return One_Form;
         elsif Mod_10 in 2 .. 4 and then not (Mod_100 in 12 .. 14) then
            return Few_Form;
         else
            return Many_Form;
         end if;
      end if;
   end Slavic_Form_For;

   function Slavic_Relative_Name
     (Lang : String;
      Unit : Relative_Unit;
      Form : Slavic_Form)
      return String
   is
   begin
      if Lang = "pl" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Rel_Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Rel_Hour =>
               return (case Form is
                         when One_Form => "godzina",
                         when Few_Form => "godziny",
                         when Many_Form => "godzin");
            when Rel_Day =>
               return (case Form is
                         when One_Form => B ("647A6965C584"),
                         when Few_Form => "dni",
                         when Many_Form => "dni");
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("7479647A6965C584"),
                         when Few_Form => "tygodnie",
                         when Many_Form => "tygodni");
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("6D69657369C48563"),
                         when Few_Form => B ("6D69657369C4856365"),
                         when Many_Form => B ("6D69657369C4996379"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "lata",
                         when Many_Form => "lat");
         end case;
      elsif Lang = "cs" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => "sekunda",
                         when Few_Form => "sekundy",
                         when Many_Form => "sekund");
            when Rel_Minute =>
               return (case Form is
                         when One_Form => "minuta",
                         when Few_Form => "minuty",
                         when Many_Form => "minut");
            when Rel_Hour =>
               return (case Form is
                         when One_Form => "hodina",
                         when Few_Form => "hodiny",
                         when Many_Form => "hodin");
            when Rel_Day =>
               return (case Form is
                         when One_Form => "den",
                         when Few_Form => "dny",
                         when Many_Form => B ("646EC5AF"));
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("74C3BD64656E"),
                         when Few_Form => B ("74C3BD646E79"),
                         when Many_Form => B ("74C3BD646EC5AF"));
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("6DC49B73C3AD63"),
                         when Few_Form => B ("6DC49B73C3AD6365"),
                         when Many_Form => B ("6DC49B73C3AD63C5AF"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => "rok",
                         when Few_Form => "roky",
                         when Many_Form => "let");
         end case;
      elsif Lang = "ru" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D18B"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Rel_Minute =>
               return (case Form is
                         when One_Form => B ("D0BCD0B8D0BDD183D182D0B0"),
                         when Few_Form => B ("D0BCD0B8D0BDD183D182D18B"),
                         when Many_Form => B ("D0BCD0B8D0BDD183D182"));
            when Rel_Hour =>
               return (case Form is
                         when One_Form => B ("D187D0B0D181"),
                         when Few_Form => B ("D187D0B0D181D0B0"),
                         when Many_Form => B ("D187D0B0D181D0BED0B2"));
            when Rel_Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD18F"),
                         when Many_Form => B ("D0B4D0BDD0B5D0B9"));
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("D0BDD0B5D0B4D0B5D0BBD18F"),
                         when Few_Form => B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
                         when Many_Form => B ("D0BDD0B5D0B4D0B5D0BBD18C"));
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("D0BCD0B5D181D18FD186"),
                         when Few_Form => B ("D0BCD0B5D181D18FD186D0B0"),
                         when Many_Form => B ("D0BCD0B5D181D18FD186D0B5D0B2"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4"),
                         when Few_Form => B ("D0B3D0BED0B4D0B0"),
                         when Many_Form => B ("D0BBD0B5D182"));
         end case;
      elsif Lang = "uk" then
         case Unit is
            when Rel_Second =>
               return (case Form is
                         when One_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
                         when Few_Form => B ("D181D0B5D0BAD183D0BDD0B4D0B8"),
                         when Many_Form => B ("D181D0B5D0BAD183D0BDD0B4"));
            when Rel_Minute =>
               return (case Form is
                         when One_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B0"),
                         when Few_Form => B ("D185D0B2D0B8D0BBD0B8D0BDD0B8"),
                         when Many_Form => B ("D185D0B2D0B8D0BBD0B8D0BD"));
            when Rel_Hour =>
               return (case Form is
                         when One_Form => B ("D0B3D0BED0B4D0B8D0BDD0B0"),
                         when Few_Form => B ("D0B3D0BED0B4D0B8D0BDD0B8"),
                         when Many_Form => B ("D0B3D0BED0B4D0B8D0BD"));
            when Rel_Day =>
               return (case Form is
                         when One_Form => B ("D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D0B4D0BDD196"),
                         when Many_Form => B ("D0B4D0BDD196D0B2"));
            when Rel_Week =>
               return (case Form is
                         when One_Form => B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
                         when Few_Form => B ("D182D0B8D0B6D0BDD196"),
                         when Many_Form => B ("D182D0B8D0B6D0BDD196D0B2"));
            when Rel_Month =>
               return (case Form is
                         when One_Form => B ("D0BCD196D181D18FD186D18C"),
                         when Few_Form => B ("D0BCD196D181D18FD186D196"),
                         when Many_Form => B ("D0BCD196D181D18FD186D196D0B2"));
            when Rel_Year =>
               return (case Form is
                         when One_Form => B ("D180D196D0BA"),
                         when Few_Form => B ("D180D0BED0BAD0B8"),
                         when Many_Form => B ("D180D0BED0BAD196D0B2"));
         end case;
      else
         return "";
      end if;
   end Slavic_Relative_Name;

   function Slavic_Relative_Result
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result
   is
      use Humanize.Messages;

      Lang      : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Unit      : Relative_Unit := Rel_Second;
      Is_Future : Boolean := False;
   begin
      if not (Lang = "pl" or else Lang = "cs" or else Lang = "ru" or else Lang = "uk") then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      if Selection.Arguments /= Humanize.Selections.Count_Argument then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      case Selection.Key is
         when Datetime_Relative_Second_Past =>
            Unit := Rel_Second;
         when Datetime_Relative_Second_Future =>
            Unit := Rel_Second;
            Is_Future := True;
         when Datetime_Relative_Minute_Past =>
            Unit := Rel_Minute;
         when Datetime_Relative_Minute_Future =>
            Unit := Rel_Minute;
            Is_Future := True;
         when Datetime_Relative_Hour_Past =>
            Unit := Rel_Hour;
         when Datetime_Relative_Hour_Future =>
            Unit := Rel_Hour;
            Is_Future := True;
         when Datetime_Relative_Day_Past =>
            Unit := Rel_Day;
         when Datetime_Relative_Day_Future =>
            Unit := Rel_Day;
            Is_Future := True;
         when Datetime_Relative_Week_Past =>
            Unit := Rel_Week;
         when Datetime_Relative_Week_Future =>
            Unit := Rel_Week;
            Is_Future := True;
         when Datetime_Relative_Month_Past =>
            Unit := Rel_Month;
         when Datetime_Relative_Month_Future =>
            Unit := Rel_Month;
            Is_Future := True;
         when Datetime_Relative_Year_Past =>
            Unit := Rel_Year;
         when Datetime_Relative_Year_Future =>
            Unit := Rel_Year;
            Is_Future := True;
         when others =>
            return (Status => Humanize.Status.Runtime_Error, others => <>);
      end case;

      declare
         Count : constant Long_Long_Integer :=
           Long_Long_Integer (Selection.Count);
         Core : constant String :=
           Integer_Text (Count) & " "
           & Slavic_Relative_Name
               (Lang, Unit, Slavic_Form_For (Lang, Count));
         Text : constant String :=
           (if Is_Future then
              (if Lang = "pl" or else Lang = "cs" then "za " & Core
               elsif Lang = "ru" then B ("D187D0B5D180D0B5D0B720") & Core
               else B ("D187D0B5D180D0B5D0B720") & Core)
            else
              (if Lang = "pl" then Core & " temu"
               elsif Lang = "cs" then Core & B ("207A70C49B74")
               elsif Lang = "ru" then Core & B ("20D0BDD0B0D0B7D0B0D0B4")
               else Core & B ("20D182D0BED0BCD183")));
      begin
         return Ok_Text (Text);
      end;
   end Slavic_Relative_Result;

   function Future_Relative_Unit
     (Key       : Humanize.Messages.Message_Id;
      Unit      : out Relative_Unit;
      Is_Future : out Boolean)
      return Boolean
   is
      use Humanize.Messages;
   begin
      Is_Future := True;
      case Key is
         when Datetime_Relative_Second_Future =>
            Unit := Rel_Second;
         when Datetime_Relative_Minute_Future =>
            Unit := Rel_Minute;
         when Datetime_Relative_Hour_Future =>
            Unit := Rel_Hour;
         when Datetime_Relative_Day_Future =>
            Unit := Rel_Day;
         when Datetime_Relative_Week_Future =>
            Unit := Rel_Week;
         when Datetime_Relative_Month_Future =>
            Unit := Rel_Month;
         when Datetime_Relative_Year_Future =>
            Unit := Rel_Year;
         when others =>
            Is_Future := False;
            return False;
      end case;
      return True;
   end Future_Relative_Unit;

   function Generated_Future_Relative_Name
     (Lang : String;
      Unit : Relative_Unit)
      return String
   is
   begin
      if Lang = "fi" then
         case Unit is
            when Rel_Second => return "sekunnin";
            when Rel_Minute => return "minuutin";
            when Rel_Hour   => return "tunnin";
            when Rel_Day    => return B ("70C3A46976C3A46E");
            when Rel_Week   => return "viikon";
            when Rel_Month  => return "kuukauden";
            when Rel_Year   => return "vuoden";
         end case;
      elsif Lang = "tr" then
         case Unit is
            when Rel_Second => return "saniye";
            when Rel_Minute => return "dakika";
            when Rel_Hour   => return "saat";
            when Rel_Day    => return B ("67C3BC6E");
            when Rel_Week   => return "hafta";
            when Rel_Month  => return "ay";
            when Rel_Year   => return B ("79C4B16C");
         end case;
      elsif Lang = "ko" then
         case Unit is
            when Rel_Second => return B ("ECB488");
            when Rel_Minute => return B ("EBB684");
            when Rel_Hour   => return B ("EC8B9CEAB084");
            when Rel_Day    => return B ("EC9DBC");
            when Rel_Week   => return B ("ECA3BC");
            when Rel_Month  => return B ("EAB09CEC9B94");
            when Rel_Year   => return B ("EB8584");
         end case;
      elsif Lang = "hi" then
         case Unit is
            when Rel_Second => return B ("E0A4B8E0A587E0A495E0A482E0A4A1");
            when Rel_Minute => return B ("E0A4AEE0A4BFE0A4A8E0A49F");
            when Rel_Hour   => return B ("E0A498E0A482E0A49FE0A587");
            when Rel_Day    => return B ("E0A4A6E0A4BFE0A4A8");
            when Rel_Week   =>
               return B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9");
            when Rel_Month  =>
               return B ("E0A4AEE0A4B9E0A580E0A4A8E0A587");
            when Rel_Year   => return B ("E0A4B8E0A4BEE0A4B2");
         end case;
      else
         return "";
      end if;
   end Generated_Future_Relative_Name;

   function Generated_Future_Relative_Result
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result
   is
      Lang      : constant String :=
        Humanize.Locales.Language_Code (Humanize.Contexts.Locale (Context));
      Unit      : Relative_Unit := Rel_Second;
      Is_Future : Boolean := False;
   begin
      if not (Lang = "fi" or else Lang = "tr" or else Lang = "ko"
              or else Lang = "hi")
      then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      if Selection.Arguments /= Humanize.Selections.Count_Argument
        or else not Future_Relative_Unit (Selection.Key, Unit, Is_Future)
        or else not Is_Future
      then
         return (Status => Humanize.Status.Runtime_Error, others => <>);
      end if;

      declare
         Count : constant String :=
           Integer_Text (Long_Long_Integer (Selection.Count));
         Name : constant String := Generated_Future_Relative_Name (Lang, Unit);
         Text : constant String :=
           (if Lang = "fi" then Count & " " & Name & " kuluttua"
            elsif Lang = "tr" then Count & " " & Name & " sonra"
            elsif Lang = "ko" then Count & " " & Name & " " & B ("ED9B84")
            else Count & " " & Name & " " & B ("E0A4ACE0A4BEE0A4A6"));
      begin
         if Name'Length = 0 then
            return (Status => Humanize.Status.Runtime_Error, others => <>);
         end if;

         return Ok_Text (Text);
      end;
   end Generated_Future_Relative_Result;
end Humanize.Datetimes.Support.Relative_Locales;
