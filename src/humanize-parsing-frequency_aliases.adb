with Humanize.Parsing.Aliases;

package body Humanize.Parsing.Frequency_Aliases is
   Alias_Separator : String
      renames Humanize.Parsing.Aliases.Alias_Separator;

   type Frequency_Alias_Group is record
      Count   : Humanize.Frequencies.Occurrence_Count;
      Aliases : not null access constant String;
   end record;

   type Frequency_Alias_Group_Array is
     array (Positive range <>) of Frequency_Alias_Group;

   function Lookup_Frequency_Alias
     (Item   : String;
      Groups : Frequency_Alias_Group_Array;
      Count  : out Humanize.Frequencies.Occurrence_Count)
      return Boolean
   is
   begin
      for Group of Groups loop
         if Humanize.Parsing.Aliases.Has_Alias (Item, Group.Aliases.all) then
            Count := Group.Count;
            return True;
         end if;
      end loop;

      return False;
   end Lookup_Frequency_Alias;

   Frequency_Never_Aliases : aliased constant String :=
      "never"
      & Alias_Separator & "aldrig"
      & Alias_Separator & "aldri"
      & Alias_Separator & "nie"
      & Alias_Separator & "jamais"
      & Alias_Separator & "nunca"
      & Alias_Separator & "mai"
      & Alias_Separator & "nooit"
      & Alias_Separator & "ei koskaan"
      & Alias_Separator & "nigdy"
      & Alias_Separator & "nikdy"
      & Alias_Separator & "asla"
      & Alias_Separator & "#6E6963696F646174C483"
      & Alias_Separator & "niekada"
      & Alias_Separator & "nikoli"
      & Alias_Separator & "tidak pernah"
      & Alias_Separator & "neniam"
      & Alias_Separator & "khong bao gio"
      & Alias_Separator & "kamwe"
      & Alias_Separator & "nooit"
      & Alias_Separator & "soha"
      & Alias_Separator & "#D0BDD0B8D0BAD0BED0B3D0B4D0B0"
      & Alias_Separator & "#D0BDD196D0BAD0BED0BBD0B8"
      & Alias_Separator & "#E381AAE38197"
      & Alias_Separator & "#EC9786EC9D8C"
      & Alias_Separator & "#E4BB8EE4B88D"
      & Alias_Separator & "#D8A3D8A8D8AFD98BD8A7"
      & Alias_Separator & "#E0A495E0A4ADE0A58020E0A4A8E0A4B9E0A580E0A482";

   Frequency_Once_Aliases : aliased constant String :=
      "once"
      & Alias_Separator & "#C3A96E2067616E67"
      & Alias_Separator & "einmal"
      & Alias_Separator & "une fois"
      & Alias_Separator & "una vez"
      & Alias_Separator & "una volta"
      & Alias_Separator & "uma vez"
      & Alias_Separator & "een keer"
      & Alias_Separator & "eenmaal"
      & Alias_Separator & "en gang"
      & Alias_Separator & "#656E2067C3A56E67"
      & Alias_Separator & "kerran"
      & Alias_Separator & "raz"
      & Alias_Separator & "#6A65646E6F75"
      & Alias_Separator & "bir kez"
      & Alias_Separator & "#6F20646174C483"
      & Alias_Separator & "#7669656EC485206B617274C485"
      & Alias_Separator & "enkrat"
      & Alias_Separator & "sekali"
      & Alias_Separator & "unufoje"
      & Alias_Separator & "mot lan"
      & Alias_Separator & "mara moja"
      & Alias_Separator & "een keer"
      & Alias_Separator & "egyszer"
      & Alias_Separator & "#D0BED0B4D0B8D0BD20D180D0B0D0B7"
      & Alias_Separator & "#D0BED0B4D0B8D0BD20D180D0B0D0B7"
      & Alias_Separator & "#E4B880E59B9E"
      & Alias_Separator & "#ED959C20EBB288"
      & Alias_Separator & "#E4B880E6ACA1"
      & Alias_Separator & "#D985D8B1D8A920D988D8A7D8ADD8AFD8A9"
      & Alias_Separator & "#E0A48FE0A49520E0A4ACE0A4BEE0A4B0";

   Frequency_Twice_Aliases : aliased constant String :=
      "twice"
      & Alias_Separator & "to gange"
      & Alias_Separator & "to ganger"
      & Alias_Separator & "zweimal"
      & Alias_Separator & "deux fois"
      & Alias_Separator & "dos veces"
      & Alias_Separator & "due volte"
      & Alias_Separator & "duas vezes"
      & Alias_Separator & "twee keer"
      & Alias_Separator & "tweemaal"
      & Alias_Separator & "#7476C3A52067C3A56E676572"
      & Alias_Separator & "kaksi kertaa"
      & Alias_Separator & "kahdesti"
      & Alias_Separator & "dwa razy"
      & Alias_Separator & "#6476616B72C3A174"
      & Alias_Separator & "iki kez"
      & Alias_Separator & "#646520646F75C483206F7269"
      & Alias_Separator & "du kartus"
      & Alias_Separator & "dvakrat"
      & Alias_Separator & "dua kali"
      & Alias_Separator & "dufoje"
      & Alias_Separator & "hai lan"
      & Alias_Separator & "mara mbili"
      & Alias_Separator & "twee keer"
      & Alias_Separator & "ketszer"
      & Alias_Separator & "#D0B4D0B2D0B020D180D0B0D0B7D0B0"
      & Alias_Separator & "#D0B4D0B2D0B020D180D0B0D0B7D0B8"
      & Alias_Separator & "#E4BA8CE59B9E"
      & Alias_Separator & "#EB919020EBB288"
      & Alias_Separator & "#E4B8A4E6ACA1"
      & Alias_Separator & "#D985D8B1D8AAD98AD986"
      & Alias_Separator & "#E0A4A6E0A58B20E0A4ACE0A4BEE0A4B0";

   Frequency_Count_Aliases : constant Frequency_Alias_Group_Array :=
     [(0, Frequency_Never_Aliases'Access),
      (1, Frequency_Once_Aliases'Access),
      (2, Frequency_Twice_Aliases'Access)];

   Frequency_Count_Unit_Aliases : aliased constant String :=
      "time"
      & Alias_Separator & "times"
      & Alias_Separator & "gang"
      & Alias_Separator & "gange"
      & Alias_Separator & "ganger"
      & Alias_Separator & "mal"
      & Alias_Separator & "#67C3A56E676572"
      & Alias_Separator & "fois"
      & Alias_Separator & "vez"
      & Alias_Separator & "veces"
      & Alias_Separator & "vezes"
      & Alias_Separator & "volta"
      & Alias_Separator & "volte"
      & Alias_Separator & "keer"
      & Alias_Separator & "kertaa"
      & Alias_Separator & "razy"
      & Alias_Separator & "#6B72C3A174"
      & Alias_Separator & "kez"
      & Alias_Separator & "ori"
      & Alias_Separator & "kartas"
      & Alias_Separator & "kartai"
      & Alias_Separator & "krat"
      & Alias_Separator & "kali"
      & Alias_Separator & "fojo"
      & Alias_Separator & "fojoj"
      & Alias_Separator & "lan"
      & Alias_Separator & "mara"
      & Alias_Separator & "alkalom"
      & Alias_Separator & "#D180D0B0D0B7"
      & Alias_Separator & "#D180D0B0D0B7D0B0"
      & Alias_Separator & "#D180D0B0D0B7D0B8"
      & Alias_Separator & "#E59B9E"
      & Alias_Separator & "#EBB288"
      & Alias_Separator & "#E6ACA1"
      & Alias_Separator & "#D985D8B1D8A9"
      & Alias_Separator & "#D985D8B1D8A7D8AA"
      & Alias_Separator & "#E0A4ACE0A4BEE0A4B0";

   function Known_Count_Alias
     (Text  : String;
      Count : out Humanize.Frequencies.Occurrence_Count)
      return Boolean
   is
   begin
      return Lookup_Frequency_Alias (Text, Frequency_Count_Aliases, Count);
   end Known_Count_Alias;

   function Is_Count_Unit (Unit : String) return Boolean is
     (Humanize.Parsing.Aliases.Has_Alias (Unit, Frequency_Count_Unit_Aliases));
end Humanize.Parsing.Frequency_Aliases;
