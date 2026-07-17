separate (Humanize.Units.Support)
function Slavic_Unit_Name
  (Lang : String;
   Unit : Unit_Kind;
   Form : Slavic_Form)
   return String
is
begin
   if Lang = "pl" then
      case Unit is
         when Meter =>
            return (case Form is
                      when One_Form => "metr",
                      when Few_Form => "metry",
                      when Many_Form => B ("6D657472C3B377"));
         when Kilometer =>
            return (case Form is
                      when One_Form => "kilometr",
                      when Few_Form => "kilometry",
                      when Many_Form => B ("6B696C6F6D657472C3B377"));
         when Centimeter =>
            return (case Form is
                      when One_Form => "centymetr",
                      when Few_Form => "centymetry",
                      when Many_Form => B ("63656E74796D657472C3B377"));
         when Millimeter =>
            return (case Form is
                      when One_Form => "milimetr",
                      when Few_Form => "milimetry",
                      when Many_Form => B ("6D696C696D657472C3B377"));
         when Gram =>
            return (case Form is
                      when One_Form => "gram",
                      when Few_Form => "gramy",
                      when Many_Form => B ("6772616DC3B377"));
         when Kilogram =>
            return (case Form is
                      when One_Form => "kilogram",
                      when Few_Form => "kilogramy",
                      when Many_Form => B ("6B696C6F6772616DC3B377"));
         when Milligram =>
            return (case Form is
                      when One_Form => "miligram",
                      when Few_Form => "miligramy",
                      when Many_Form => B ("6D696C696772616DC3B377"));
         when Liter =>
            return (case Form is
                      when One_Form => "litr",
                      when Few_Form => "litry",
                      when Many_Form => B ("6C697472C3B377"));
         when Milliliter =>
            return (case Form is
                      when One_Form => "mililitr",
                      when Few_Form => "mililitry",
                      when Many_Form => B ("6D696C696C697472C3B377"));
         when others =>
            return "";
      end case;
   elsif Lang = "cs" then
      case Unit is
         when Meter =>
            return (case Form is
                      when One_Form => "metr",
                      when Few_Form => "metry",
                      when Many_Form => B ("6D657472C5AF"));
         when Kilometer =>
            return (case Form is
                      when One_Form => "kilometr",
                      when Few_Form => "kilometry",
                      when Many_Form => B ("6B696C6F6D657472C5AF"));
         when Centimeter =>
            return (case Form is
                      when One_Form => "centimetr",
                      when Few_Form => "centimetry",
                      when Many_Form => B ("63656E74696D657472C5AF"));
         when Millimeter =>
            return (case Form is
                      when One_Form => "milimetr",
                      when Few_Form => "milimetry",
                      when Many_Form => B ("6D696C696D657472C5AF"));
         when Gram =>
            return (case Form is
                      when One_Form => "gram",
                      when Few_Form => "gramy",
                      when Many_Form => B ("6772616DC5AF"));
         when Kilogram =>
            return (case Form is
                      when One_Form => "kilogram",
                      when Few_Form => "kilogramy",
                      when Many_Form => B ("6B696C6F6772616DC5AF"));
         when Milligram =>
            return (case Form is
                      when One_Form => "miligram",
                      when Few_Form => "miligramy",
                      when Many_Form => B ("6D696C696772616DC5AF"));
         when Liter =>
            return (case Form is
                      when One_Form => "litr",
                      when Few_Form => "litry",
                      when Many_Form => B ("6C697472C5AF"));
         when Milliliter =>
            return (case Form is
                      when One_Form => "mililitr",
                      when Few_Form => "mililitry",
                      when Many_Form => B ("6D696C696C697472C5AF"));
         when others =>
            return "";
      end case;
   elsif Lang = "ru" then
      case Unit is
         when Meter =>
            return (case Form is
                      when One_Form => B ("D0BCD0B5D182D180"),
                      when Few_Form => B ("D0BCD0B5D182D180D0B0"),
                      when Many_Form => B ("D0BCD0B5D182D180D0BED0B2"));
         when Kilometer =>
            return (case Form is
                      when One_Form => B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180"),
                      when Few_Form => B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D0B0"),
                      when Many_Form => B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D0BED0B2"));
         when Centimeter =>
            return (case Form is
                      when One_Form => B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180"),
                      when Few_Form => B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B0"),
                      when Many_Form => B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0BED0B2"));
         when Millimeter =>
            return (case Form is
                      when One_Form => B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180"),
                      when Few_Form => B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0B0"),
                      when Many_Form => B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0BED0B2"));
         when Gram =>
            return (case Form is
                      when One_Form => B ("D0B3D180D0B0D0BCD0BC"),
                      when Few_Form => B ("D0B3D180D0B0D0BCD0BCD0B0"),
                      when Many_Form => B ("D0B3D180D0B0D0BCD0BCD0BED0B2"));
         when Kilogram =>
            return (case Form is
                      when One_Form => B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BC"),
                      when Few_Form => B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0B0"),
                      when Many_Form => B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2"));
         when Milligram =>
            return (case Form is
                      when One_Form => B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BC"),
                      when Few_Form => B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0B0"),
                      when Many_Form => B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0BED0B2"));
         when Liter =>
            return (case Form is
                      when One_Form => B ("D0BBD0B8D182D180"),
                      when Few_Form => B ("D0BBD0B8D182D180D0B0"),
                      when Many_Form => B ("D0BBD0B8D182D180D0BED0B2"));
         when Milliliter =>
            return (case Form is
                      when One_Form => B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180"),
                      when Few_Form => B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0B0"),
                      when Many_Form => B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0BED0B2"));
         when others =>
            return "";
      end case;
   elsif Lang = "uk" then
      case Unit is
         when Meter =>
            return (case Form is
                      when One_Form => B ("D0BCD0B5D182D180"),
                      when Few_Form => B ("D0BCD0B5D182D180D0B8"),
                      when Many_Form => B ("D0BCD0B5D182D180D196D0B2"));
         when Kilometer =>
            return (case Form is
                      when One_Form => B ("D0BAD196D0BBD0BED0BCD0B5D182D180"),
                      when Few_Form => B ("D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"),
                      when Many_Form => B ("D0BAD196D0BBD0BED0BCD0B5D182D180D196D0B2"));
         when Centimeter =>
            return (case Form is
                      when One_Form => B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180"),
                      when Few_Form => B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B8"),
                      when Many_Form => B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D196D0B2"));
         when Millimeter =>
            return (case Form is
                      when One_Form => B ("D0BCD196D0BBD196D0BCD0B5D182D180"),
                      when Few_Form => B ("D0BCD196D0BBD196D0BCD0B5D182D180D0B8"),
                      when Many_Form => B ("D0BCD196D0BBD196D0BCD0B5D182D180D196D0B2"));
         when Gram =>
            return (case Form is
                      when One_Form => B ("D0B3D180D0B0D0BC"),
                      when Few_Form => B ("D0B3D180D0B0D0BCD0B8"),
                      when Many_Form => B ("D0B3D180D0B0D0BCD196D0B2"));
         when Kilogram =>
            return (case Form is
                      when One_Form => B ("D0BAD196D0BBD0BED0B3D180D0B0D0BC"),
                      when Few_Form => B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD0B8"),
                      when Many_Form => B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2"));
         when Milligram =>
            return (case Form is
                      when One_Form => B ("D0BCD196D0BBD196D0B3D180D0B0D0BC"),
                      when Few_Form => B ("D0BCD196D0BBD196D0B3D180D0B0D0BCD0B8"),
                      when Many_Form => B ("D0BCD196D0BBD196D0B3D180D0B0D0BCD196D0B2"));
         when Liter =>
            return (case Form is
                      when One_Form => B ("D0BBD196D182D180"),
                      when Few_Form => B ("D0BBD196D182D180D0B8"),
                      when Many_Form => B ("D0BBD196D182D180D196D0B2"));
         when Milliliter =>
            return (case Form is
                      when One_Form => B ("D0BCD196D0BBD196D0BBD196D182D180"),
                      when Few_Form => B ("D0BCD196D0BBD196D0BBD196D182D180D0B8"),
                      when Many_Form => B ("D0BCD196D0BBD196D0BBD196D182D180D196D0B2"));
         when others =>
            return "";
      end case;
   elsif Lang = "sk" then
      case Unit is
         when Meter =>
            return (case Form is
                      when One_Form => "meter",
                      when Few_Form => "metre",
                      when Many_Form => "metrov");
         when Kilometer =>
            return (case Form is
                      when One_Form => "kilometer",
                      when Few_Form => "kilometre",
                      when Many_Form => "kilometrov");
         when Centimeter =>
            return (case Form is
                      when One_Form => "centimeter",
                      when Few_Form => "centimetre",
                      when Many_Form => "centimetrov");
         when Millimeter =>
            return (case Form is
                      when One_Form => "milimeter",
                      when Few_Form => "milimetre",
                      when Many_Form => "milimetrov");
         when Gram =>
            return (case Form is
                      when One_Form => "gram",
                      when Few_Form => "gramy",
                      when Many_Form => "gramov");
         when Kilogram =>
            return (case Form is
                      when One_Form => "kilogram",
                      when Few_Form => "kilogramy",
                      when Many_Form => "kilogramov");
         when Milligram =>
            return (case Form is
                      when One_Form => "miligram",
                      when Few_Form => "miligramy",
                      when Many_Form => "miligramov");
         when Liter =>
            return (case Form is
                      when One_Form => "liter",
                      when Few_Form => "litre",
                      when Many_Form => "litrov");
         when Milliliter =>
            return (case Form is
                      when One_Form => "mililiter",
                      when Few_Form => "mililitre",
                      when Many_Form => "mililitrov");
         when Celsius =>
            return (case Form is
                      when One_Form => "stupen Celzia",
                      when Few_Form => "stupne Celzia",
                      when Many_Form => "stupnov Celzia");
         when Fahrenheit =>
            return (case Form is
                      when One_Form => "stupen Fahrenheita",
                      when Few_Form => "stupne Fahrenheita",
                      when Many_Form => "stupnov Fahrenheita");
         when Square_Meter =>
            return (case Form is
                      when One_Form => "stvorcovy meter",
                      when Few_Form => "stvorcove metre",
                      when Many_Form => "stvorcovych metrov");
         when Hectare =>
            return (case Form is
                      when One_Form => "hektar",
                      when Few_Form => "hektare",
                      when Many_Form => "hektarov");
         when Kilometer_Per_Hour =>
            return (case Form is
                      when One_Form => "kilometer za hodinu",
                      when Few_Form => "kilometre za hodinu",
                      when Many_Form => "kilometrov za hodinu");
         when Meter_Per_Second =>
            return (case Form is
                      when One_Form => "meter za sekundu",
                      when Few_Form => "metre za sekundu",
                      when Many_Form => "metrov za sekundu");
         when Pascal =>
            return (case Form is
                      when One_Form => "pascal",
                      when Few_Form => "pascaly",
                      when Many_Form => "pascalov");
         when Kilopascal =>
            return (case Form is
                      when One_Form => "kilopascal",
                      when Few_Form => "kilopascaly",
                      when Many_Form => "kilopascalov");
         when Joule =>
            return (case Form is
                      when One_Form => "joule",
                      when Few_Form => "jouly",
                      when Many_Form => "joulov");
         when Kilojoule =>
            return (case Form is
                      when One_Form => "kilojoule",
                      when Few_Form => "kilojouly",
                      when Many_Form => "kilojoulov");
         when Watt =>
            return (case Form is
                      when One_Form => "watt",
                      when Few_Form => "watty",
                      when Many_Form => "wattov");
         when Kilowatt =>
            return (case Form is
                      when One_Form => "kilowatt",
                      when Few_Form => "kilowatty",
                      when Many_Form => "kilowattov");
         when Hertz =>
            return (case Form is
                      when One_Form => "hertz",
                      when Few_Form => "hertze",
                      when Many_Form => "hertzov");
         when Kilohertz =>
            return (case Form is
                      when One_Form => "kilohertz",
                      when Few_Form => "kilohertze",
                      when Many_Form => "kilohertzov");
         when Degree =>
            return (case Form is
                      when One_Form => "stupen",
                      when Few_Form => "stupne",
                      when Many_Form => "stupnov");
         when Mile =>
            return (case Form is
                      when One_Form => "mila",
                      when Few_Form => "mile",
                      when Many_Form => "mil");
         when Yard =>
            return (case Form is
                      when One_Form => "yard",
                      when Few_Form => "yardy",
                      when Many_Form => "yardov");
         when Foot =>
            return (case Form is
                      when One_Form => "stopa",
                      when Few_Form => "stopy",
                      when Many_Form => "stop");
         when Inch =>
            return (case Form is
                      when One_Form => "palec",
                      when Few_Form => "palce",
                      when Many_Form => "palcov");
         when Nautical_Mile =>
            return (case Form is
                      when One_Form => "namorna mila",
                      when Few_Form => "namorne mile",
                      when Many_Form => "namornych mil");
         when Acre =>
            return (case Form is
                      when One_Form => "aker",
                      when Few_Form => "akre",
                      when Many_Form => "akrov");
         when Square_Kilometer =>
            return (case Form is
                      when One_Form => "stvorcovy kilometer",
                      when Few_Form => "stvorcove kilometre",
                      when Many_Form => "stvorcovych kilometrov");
         when Cubic_Meter =>
            return (case Form is
                      when One_Form => "kubicky meter",
                      when Few_Form => "kubicke metre",
                      when Many_Form => "kubickych metrov");
         when Teaspoon =>
            return (case Form is
                      when One_Form => "cajova lyzicka",
                      when Few_Form => "cajove lyzicky",
                      when Many_Form => "cajovych lyziciek");
         when Tablespoon =>
            return (case Form is
                      when One_Form => "polievkova lyzica",
                      when Few_Form => "polievkove lyzice",
                      when Many_Form => "polievkovych lyzic");
         when Cup =>
            return (case Form is
                      when One_Form => "salka",
                      when Few_Form => "salky",
                      when Many_Form => "salok");
         when Gallon =>
            return (case Form is
                      when One_Form => "galon",
                      when Few_Form => "galony",
                      when Many_Form => "galonov");
         when Pound =>
            return (case Form is
                      when One_Form => "libra",
                      when Few_Form => "libry",
                      when Many_Form => "libier");
         when Ounce =>
            return (case Form is
                      when One_Form => "unca",
                      when Few_Form => "unce",
                      when Many_Form => "unci");
         when Stone =>
            return "stone";
         when Tonne =>
            return (case Form is
                      when One_Form => "tona",
                      when Few_Form => "tony",
                      when Many_Form => "ton");
         when Ton =>
            return (case Form is
                      when One_Form => "kratka tona",
                      when Few_Form => "kratke tony",
                      when Many_Form => "kratkych ton");
      end case;
   else
      return "";
   end if;
end Slavic_Unit_Name;
