with Humanize.Bounded_Text;
with Humanize.Parsing.Aliases;

package body Humanize.Parsing.Unit_Aliases is
   function Clean_Lower (Text : String) return String
      renames Humanize.Bounded_Text.Clean_Lower_Text;

   Alias_Separator : String
      renames Humanize.Parsing.Aliases.Alias_Separator;

   type Unit_Alias_Group is record
      Unit    : Humanize.Units.Unit_Kind;
      Aliases : not null access constant String;
   end record;

   type Unit_Alias_Group_Array is
     array (Positive range <>) of Unit_Alias_Group;

   function Lookup_Unit_Alias
     (Item   : String;
      Groups : Unit_Alias_Group_Array;
      Unit   : out Humanize.Units.Unit_Kind)
      return Boolean
   is
   begin
      for Group of Groups loop
         if Humanize.Parsing.Aliases.Has_Alias (Item, Group.Aliases.all) then
            Unit := Group.Unit;
            return True;
         end if;
      end loop;

      return False;
   end Lookup_Unit_Alias;

   pragma Style_Checks (Off);
   Generated_Unit_Alias_01 : aliased constant String :=
      "#E382B0E383A9E383A0"
      & Alias_Separator & "#EAB7B8EB9EA8"
      & Alias_Separator & "#E5858B"
      & Alias_Separator & "#D8BAD8B1D8A7D985D8A7D8AA"
      & Alias_Separator & "#E0A497E0A58DE0A4B0E0A4BEE0A4AE"
      ;

   Generated_Unit_Alias_02 : aliased constant String :=
      "#E3839FE383AAE382B0E383A9E383A0"
      & Alias_Separator & "#EBB080EBA6ACEAB7B8EB9EA8"
      & Alias_Separator & "#E6AFABE5858B"
      & Alias_Separator & "#D985D984D98AD8BAD8B1D8A7D985D8A7D8AA"
      & Alias_Separator & "#E0A4AEE0A4BFE0A4B2E0A580E0A497E0A58DE0A4B0E0A4BEE0A4AE"
      ;

   Generated_Unit_Alias_03 : aliased constant String :=
      "#E383AAE38383E38388E383AB"
      & Alias_Separator & "#EBA6ACED84B0"
      & Alias_Separator & "#E58D87"
      & Alias_Separator & "#D984D8AAD8B1D8A7D8AA"
      & Alias_Separator & "#E0A4B2E0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_04 : aliased constant String :=
      "#E3839FE383AAE383AAE38383E38388E383AB"
      & Alias_Separator & "#EBB080EBA6ACEBA6ACED84B0"
      & Alias_Separator & "#E6AFABE58D87"
      & Alias_Separator & "#D985D984D98AD984D8AAD8B1D8A7D8AA"
      & Alias_Separator & "#E0A4AEE0A4BFE0A4B2E0A580E0A4B2E0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_05 : aliased constant String :=
      "#EC84BCED8BB0EBAFB8ED84B0"
      & Alias_Separator & "#D8B3D986D8AAD98AD985D8AAD8B1D8A7D8AA"
      & Alias_Separator & "#E0A4B8E0A587E0A482E0A49FE0A580E0A4AEE0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_06 : aliased constant String :=
      "#EBB080EBA6ACEBAFB8ED84B0"
      & Alias_Separator & "#D985D984D98AD985D8AAD8B1D8A7D8AA"
      & Alias_Separator & "#E0A4AEE0A4BFE0A4B2E0A580E0A4AEE0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_07 : aliased constant String :=
      "#D0B3D180D0B0D0B4D183D18120D0A6D0B5D0BBD18CD181D0B8D18F"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D181D18B20D0A6D0B5D0BBD18CD181D0B8D18F"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D18120D0A6D0B5D0BBD18CD181D196D18F"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D181D0B820D0A6D0B5D0BBD18CD181D196D18F"
      & Alias_Separator & "#E382BBE383ABE382B7E382A6E382B9E5BAA6"
      & Alias_Separator & "#EC84ADEC94A8EB8F84"
      & Alias_Separator & "#E69184E6B08FE5BAA6"
      & Alias_Separator & "#D8AFD8B1D8ACD8A7D8AA20D985D8A6D988D98AD8A9"
      & Alias_Separator & "#E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4B8E0A587E0A4B2E0A58DE0A4B8E0A4BFE0A4AFE0A4B8"
      ;

   Generated_Unit_Alias_08 : aliased constant String :=
      "#D0B3D180D0B0D0B4D183D18120D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D181D18B20D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D18120D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D181D0B820D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"
      & Alias_Separator & "#E88FAFE6B08FE5BAA6"
      & Alias_Separator & "#ED9994EC94A8EB8F84"
      & Alias_Separator & "#E58D8EE6B08FE5BAA6"
      & Alias_Separator & "#D8AFD8B1D8ACD8A7D8AA20D981D987D8B1D986D987D8A7D98AD8AA"
      & Alias_Separator & "#E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4ABE0A4BEE0A4B0E0A587E0A4A8E0A4B9E0A4BEE0A487E0A49F"
      ;

   Generated_Unit_Alias_09 : aliased constant String :=
      "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B920D0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B520D0BCD0B5D182D180D18B"
      & Alias_Separator & "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD0B8D0B920D0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD19620D0BCD0B5D182D180D0B8"
      & Alias_Separator & "#E5B9B3E696B9E383A1E383BCE38388E383AB"
      & Alias_Separator & "#ECA09CEAB3B1EBAFB8ED84B0"
      & Alias_Separator & "#E5B9B3E696B9E7B1B3"
      & Alias_Separator & "#D8A3D985D8AAD8A7D8B120D985D8B1D8A8D8B9D8A9"
      & Alias_Separator & "#E0A4B5E0A4B0E0A58DE0A49720E0A4AEE0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_10 : aliased constant String :=
      "#D0B3D0B5D0BAD182D0B0D180"
      & Alias_Separator & "#D0B3D0B5D0BAD182D0B0D180D18B"
      & Alias_Separator & "#D0B3D0B5D0BAD182D0B0D180D0B8"
      & Alias_Separator & "#E38398E382AFE382BFE383BCE383AB"
      & Alias_Separator & "#ED97A5ED8380EBA5B4"
      & Alias_Separator & "#E585ACE9A1B7"
      & Alias_Separator & "#D987D983D8AAD8A7D8B1D8A7D8AA"
      & Alias_Separator & "#E0A4B9E0A587E0A495E0A58DE0A49FE0A587E0A4AFE0A4B0"
      ;

   Generated_Unit_Alias_11 : aliased constant String :=
      "#D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B20D0B220D187D0B0D181"
      & Alias_Separator & "#D0BAD196D0BBD0BED0BCD0B5D182D180D0B820D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"
      & Alias_Separator & "#E382ADE383ADE383A1E383BCE38388E383ABE6AF8EE69982"
      & Alias_Separator & "#EC8B9CEAB084EB8BB920ED82ACEBA19CEBAFB8ED84B0"
      & Alias_Separator & "#E58D83E7B1B3E6AF8FE5B08FE697B6"
      & Alias_Separator & "#D983D98AD984D988D985D8AAD8B1D8A7D8AA20D981D98A20D8A7D984D8B3D8A7D8B9D8A9"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B020E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"
      ;

   Generated_Unit_Alias_12 : aliased constant String :=
      "#D0BCD0B5D182D180D18B20D0B220D181D0B5D0BAD183D0BDD0B4D183"
      & Alias_Separator & "#D0BCD0B5D182D180D0B820D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"
      & Alias_Separator & "#E383A1E383BCE38388E383ABE6AF8EE7A792"
      & Alias_Separator & "#ECB488EB8BB920EBAFB8ED84B0"
      & Alias_Separator & "#E7B1B3E6AF8FE7A792"
      & Alias_Separator & "#D8A3D985D8AAD8A7D8B120D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"
      & Alias_Separator & "#E0A4AEE0A580E0A49FE0A4B020E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"
      ;

   Generated_Unit_Alias_13 : aliased constant String :=
      "#D0BFD0B0D181D0BAD0B0D0BBD18C"
      & Alias_Separator & "#D0BFD0B0D181D0BAD0B0D0BBD0B8"
      & Alias_Separator & "#D0BFD0B0D181D0BAD0B0D0BBD196"
      & Alias_Separator & "#E38391E382B9E382ABE383AB"
      & Alias_Separator & "#ED8C8CEC8AA4ECB9BC"
      & Alias_Separator & "#E5B895E696AFE58DA1"
      & Alias_Separator & "#D8A8D8A7D8B3D983D8A7D984"
      & Alias_Separator & "#E0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"
      ;

   Generated_Unit_Alias_14 : aliased constant String :=
      "#D0BAD0B8D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD18C"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD0B8"
      & Alias_Separator & "#D0BAD196D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD196"
      & Alias_Separator & "#E382ADE383ADE38391E382B9E382ABE383AB"
      & Alias_Separator & "#ED82ACEBA19CED8C8CEC8AA4ECB9BC"
      & Alias_Separator & "#E58D83E5B895"
      & Alias_Separator & "#D983D98AD984D988D8A8D8A7D8B3D983D8A7D984"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"
      ;

   Generated_Unit_Alias_15 : aliased constant String :=
      "#D0B4D0B6D0BED183D0BBD18C"
      & Alias_Separator & "#D0B4D0B6D0BED183D0BBD0B8"
      & Alias_Separator & "#D0B4D0B6D0BED183D0BBD196"
      & Alias_Separator & "#E382B8E383A5E383BCE383AB"
      & Alias_Separator & "#ECA484"
      & Alias_Separator & "#E784A6E880B3"
      & Alias_Separator & "#D8ACD988D984D8A7D8AA"
      & Alias_Separator & "#E0A49CE0A582E0A4B2"
      ;

   Generated_Unit_Alias_16 : aliased constant String :=
      "#D0BAD0B8D0BBD0BED0B4D0B6D0BED183D0BBD18C"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B4D0B6D0BED183D0BBD0B8"
      & Alias_Separator & "#D0BAD196D0BBD0BED0B4D0B6D0BED183D0BBD196"
      & Alias_Separator & "#E382ADE383ADE382B8E383A5E383BCE383AB"
      & Alias_Separator & "#ED82ACEBA19CECA484"
      & Alias_Separator & "#E58D83E784A6"
      & Alias_Separator & "#D983D98AD984D988D8ACD988D984D8A7D8AA"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A49CE0A582E0A4B2"
      ;

   Generated_Unit_Alias_17 : aliased constant String :=
      "#D0B2D0B0D182D182"
      & Alias_Separator & "#D0B2D0B0D182D182D18B"
      & Alias_Separator & "#D0B2D0B0D182D0B8"
      & Alias_Separator & "#E383AFE38383E38388"
      & Alias_Separator & "#EC9980ED8AB8"
      & Alias_Separator & "#E793A6E789B9"
      & Alias_Separator & "#D988D8A7D8B7D8A7D8AA"
      & Alias_Separator & "#E0A4B5E0A4BEE0A49F"
      ;

   Generated_Unit_Alias_18 : aliased constant String :=
      "#D0BAD0B8D0BBD0BED0B2D0B0D182D182"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B2D0B0D182D182D18B"
      & Alias_Separator & "#D0BAD196D0BBD0BED0B2D0B0D182D0B8"
      & Alias_Separator & "#E382ADE383ADE383AFE38383E38388"
      & Alias_Separator & "#ED82ACEBA19CEC9980ED8AB8"
      & Alias_Separator & "#E58D83E793A6"
      & Alias_Separator & "#D983D98AD984D988D988D8A7D8B7D8A7D8AA"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A4B5E0A4BEE0A49F"
      ;

   Generated_Unit_Alias_19 : aliased constant String :=
      "#D0B3D0B5D180D186"
      & Alias_Separator & "#D0B3D0B5D180D186D18B"
      & Alias_Separator & "#D0B3D0B5D180D186D0B8"
      & Alias_Separator & "#E38398E383ABE38384"
      & Alias_Separator & "#ED97A4EBA5B4ECB8A0"
      & Alias_Separator & "#E8B5ABE585B9"
      & Alias_Separator & "#D987D8B1D8AAD8B2"
      & Alias_Separator & "#E0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"
      ;

   Generated_Unit_Alias_20 : aliased constant String :=
      "#D0BAD0B8D0BBD0BED0B3D0B5D180D186"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B3D0B5D180D186D18B"
      & Alias_Separator & "#D0BAD196D0BBD0BED0B3D0B5D180D186D0B8"
      & Alias_Separator & "#E382ADE383ADE38398E383ABE38384"
      & Alias_Separator & "#ED82ACEBA19CED97A4EBA5B4ECB8A0"
      & Alias_Separator & "#E58D83E8B5AB"
      & Alias_Separator & "#D983D98AD984D988D987D8B1D8AAD8B2"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"
      ;

   Generated_Unit_Alias_21 : aliased constant String :=
      "#D0B3D180D0B0D0B4D183D181"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D181D18B"
      & Alias_Separator & "#D0B3D180D0B0D0B4D183D181D0B8"
      & Alias_Separator & "#E5BAA6"
      & Alias_Separator & "#EB8F84"
      & Alias_Separator & "#D8AFD8B1D8ACD8A7D8AA"
      & Alias_Separator & "#E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A580"
      ;

   Generated_Unit_Alias_22 : aliased constant String :=
      "#D0BCD0B8D0BBD18F"
      & Alias_Separator & "#D0BCD0B8D0BBD0B8"
      & Alias_Separator & "#D0BCD0B8D0BBD196"
      & Alias_Separator & "#E3839EE382A4E383AB"
      & Alias_Separator & "#EBA788EC9DBC"
      & Alias_Separator & "#E88BB1E9878C"
      & Alias_Separator & "#D8A3D985D98AD8A7D984"
      & Alias_Separator & "#E0A4AEE0A580E0A4B2"
      ;

   Generated_Unit_Alias_23 : aliased constant String :=
      "#D18FD180D0B4"
      & Alias_Separator & "#D18FD180D0B4D18B"
      & Alias_Separator & "#D18FD180D0B4D0B8"
      & Alias_Separator & "#E383A4E383BCE38389"
      & Alias_Separator & "#EC95BCEB939C"
      & Alias_Separator & "#E7A081"
      & Alias_Separator & "#D98AD8A7D8B1D8AFD8A7D8AA"
      & Alias_Separator & "#E0A497E0A49C"
      ;

   Generated_Unit_Alias_24 : aliased constant String :=
      "#D184D183D182"
      & Alias_Separator & "#D184D183D182D18B"
      & Alias_Separator & "#D184D183D182D0B8"
      & Alias_Separator & "#E38395E382A3E383BCE38388"
      & Alias_Separator & "#ED94BCED8AB8"
      & Alias_Separator & "#E88BB1E5B0BA"
      & Alias_Separator & "#D8A3D982D8AFD8A7D985"
      & Alias_Separator & "#E0A4ABE0A581E0A49F"
      ;

   Generated_Unit_Alias_25 : aliased constant String :=
      "#D0B4D18ED0B9D0BC"
      & Alias_Separator & "#D0B4D18ED0B9D0BCD18B"
      & Alias_Separator & "#D0B4D18ED0B9D0BCD0B8"
      & Alias_Separator & "#E382A4E383B3E38381"
      & Alias_Separator & "#EC9DB8ECB998"
      & Alias_Separator & "#E88BB1E5AFB8"
      & Alias_Separator & "#D8A8D988D8B5D8A7D8AA"
      & Alias_Separator & "#E0A487E0A482E0A49A"
      ;

   Generated_Unit_Alias_26 : aliased constant String :=
      "#D0BCD0BED180D181D0BAD0B0D18F20D0BCD0B8D0BBD18F"
      & Alias_Separator & "#D0BCD0BED180D181D0BAD0B8D0B520D0BCD0B8D0BBD0B8"
      & Alias_Separator & "#D0BCD0BED180D181D18CD0BAD0B020D0BCD0B8D0BBD18F"
      & Alias_Separator & "#D0BCD0BED180D181D18CD0BAD19620D0BCD0B8D0BBD196"
      & Alias_Separator & "#E6B5B7E9878C"
      & Alias_Separator & "#ED95B4EBA6AC"
      & Alias_Separator & "#D985D98AD98420D8A8D8ADD8B1D98A"
      & Alias_Separator & "#D8A3D985D98AD8A7D98420D8A8D8ADD8B1D98AD8A9"
      & Alias_Separator & "#E0A4B8E0A4AEE0A581E0A4A6E0A58DE0A4B0E0A58020E0A4AEE0A580E0A4B2"
      ;

   Generated_Unit_Alias_27 : aliased constant String :=
      "#D0B0D0BAD180"
      & Alias_Separator & "#D0B0D0BAD180D18B"
      & Alias_Separator & "#D0B0D0BAD180D0B8"
      & Alias_Separator & "#E382A8E383BCE382ABE383BC"
      & Alias_Separator & "#EC9790EC9DB4ECBBA4"
      & Alias_Separator & "#E88BB1E4BAA9"
      & Alias_Separator & "#D8A3D981D8AFD986D8A9"
      & Alias_Separator & "#E0A48FE0A495E0A4A1E0A4BC"
      ;

   Generated_Unit_Alias_28 : aliased constant String :=
      "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B920D0BAD0B8D0BBD0BED0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B520D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B"
      & Alias_Separator & "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD0B8D0B920D0BAD196D0BBD0BED0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD0B2D0B0D0B4D180D0B0D182D0BDD19620D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"
      & Alias_Separator & "#E5B9B3E696B9E382ADE383ADE383A1E383BCE38388E383AB"
      & Alias_Separator & "#ECA09CEAB3B1ED82ACEBA19CEBAFB8ED84B0"
      & Alias_Separator & "#E5B9B3E696B9E58D83E7B1B3"
      & Alias_Separator & "#D983D98AD984D988D985D8AAD8B1D8A7D8AA20D985D8B1D8A8D8B9D8A9"
      & Alias_Separator & "#E0A4B5E0A4B0E0A58DE0A49720E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_29 : aliased constant String :=
      "#D0BAD183D0B1D0B8D187D0B5D181D0BAD0B8D0B920D0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD183D0B1D0B8D187D0B5D181D0BAD0B8D0B520D0BCD0B5D182D180D18B"
      & Alias_Separator & "#D0BAD183D0B1D196D187D0BDD0B8D0B920D0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD183D0B1D196D187D0BDD19620D0BCD0B5D182D180D0B8"
      & Alias_Separator & "#E7AB8BE696B9E383A1E383BCE38388E383AB"
      & Alias_Separator & "#EC84B8ECA09CEAB3B1EBAFB8ED84B0"
      & Alias_Separator & "#E7AB8BE696B9E7B1B3"
      & Alias_Separator & "#D8A3D985D8AAD8A7D8B120D985D983D8B9D8A8D8A9"
      & Alias_Separator & "#E0A498E0A4A820E0A4AEE0A580E0A49FE0A4B0"
      ;

   Generated_Unit_Alias_30 : aliased constant String :=
      "#D187D0B0D0B9D0BDD0B0D18F20D0BBD0BED0B6D0BAD0B0"
      & Alias_Separator & "#D187D0B0D0B9D0BDD18BD0B520D0BBD0BED0B6D0BAD0B8"
      & Alias_Separator & "#D187D0B0D0B9D0BDD0B020D0BBD0BED0B6D0BAD0B0"
      & Alias_Separator & "#D187D0B0D0B9D0BDD19620D0BBD0BED0B6D0BAD0B8"
      & Alias_Separator & "#E5B08FE38195E38198"
      & Alias_Separator & "#ED8BB0EC8AA4ED91BC"
      & Alias_Separator & "#E88CB6E58C99"
      & Alias_Separator & "#D985D984D8A7D8B9D98220D8B5D8BAD98AD8B1D8A9"
      & Alias_Separator & "#E0A49AE0A4AEE0A58DE0A4AEE0A49A"
      ;

   Generated_Unit_Alias_31 : aliased constant String :=
      "#D181D182D0BED0BBD0BED0B2D0B0D18F20D0BBD0BED0B6D0BAD0B0"
      & Alias_Separator & "#D181D182D0BED0BBD0BED0B2D18BD0B520D0BBD0BED0B6D0BAD0B8"
      & Alias_Separator & "#D181D182D0BED0BBD0BED0B2D0B020D0BBD0BED0B6D0BAD0B0"
      & Alias_Separator & "#D181D182D0BED0BBD0BED0B2D19620D0BBD0BED0B6D0BAD0B8"
      & Alias_Separator & "#E5A4A7E38195E38198"
      & Alias_Separator & "#ED858CEC9DB4EBB894EC8AA4ED91BC"
      & Alias_Separator & "#E6B1A4E58C99"
      & Alias_Separator & "#D985D984D8A7D8B9D98220D983D8A8D98AD8B1D8A9"
      & Alias_Separator & "#E0A4ACE0A4A1E0A4BCE0A58720E0A49AE0A4AEE0A58DE0A4AEE0A49A"
      ;

   Generated_Unit_Alias_32 : aliased constant String :=
      "#D187D0B0D188D0BAD0B0"
      & Alias_Separator & "#D187D0B0D188D0BAD0B8"
      & Alias_Separator & "#E382ABE38383E38397"
      & Alias_Separator & "#ECBBB5"
      & Alias_Separator & "#E69DAF"
      & Alias_Separator & "#D8A3D983D988D8A7D8A8"
      & Alias_Separator & "#E0A495E0A4AA"
      ;

   Generated_Unit_Alias_33 : aliased constant String :=
      "#D0B3D0B0D0BBD0BBD0BED0BD"
      & Alias_Separator & "#D0B3D0B0D0BBD0BBD0BED0BDD18B"
      & Alias_Separator & "#D0B3D0B0D0BBD0BED0BDD0B8"
      & Alias_Separator & "#E382ACE383ADE383B3"
      & Alias_Separator & "#EAB0A4EB9FB0"
      & Alias_Separator & "#E58AA0E4BB91"
      & Alias_Separator & "#D8BAD8A7D984D988D986D8A7D8AA"
      & Alias_Separator & "#E0A497E0A588E0A4B2E0A4A8"
      ;

   Generated_Unit_Alias_34 : aliased constant String :=
      "#D184D183D0BDD182"
      & Alias_Separator & "#D184D183D0BDD182D18B"
      & Alias_Separator & "#D184D183D0BDD182D0B8"
      & Alias_Separator & "#E3839DE383B3E38389"
      & Alias_Separator & "#ED8C8CEC9AB4EB939C"
      & Alias_Separator & "#E7A385"
      & Alias_Separator & "#D8A3D8B1D8B7D8A7D984"
      & Alias_Separator & "#E0A4AAE0A4BEE0A489E0A482E0A4A1"
      ;

   Generated_Unit_Alias_35 : aliased constant String :=
      "#D183D0BDD186D0B8D18F"
      & Alias_Separator & "#D183D0BDD186D0B8D0B8"
      & Alias_Separator & "#D183D0BDD186D196D197"
      & Alias_Separator & "#E382AAE383B3E382B9"
      & Alias_Separator & "#EC98A8EC8AA4"
      & Alias_Separator & "#E79B8EE58FB8"
      & Alias_Separator & "#D8A3D988D986D8B5D8A7D8AA"
      & Alias_Separator & "#E0A494E0A482E0A4B8"
      ;

   Generated_Unit_Alias_36 : aliased constant String :=
      "#D181D182D0BED183D0BD"
      & Alias_Separator & "#D181D182D0BED183D0BDD18B"
      & Alias_Separator & "#D181D182D0BED183D0BDD0B8"
      & Alias_Separator & "#E382B9E38388E383BCE383B3"
      & Alias_Separator & "#EC8AA4ED86A4"
      & Alias_Separator & "#E88BB1E79FB3"
      & Alias_Separator & "#D8B3D8AAD988D986"
      & Alias_Separator & "#E0A4B8E0A58DE0A49FE0A58BE0A4A8"
      ;

   Generated_Unit_Alias_37 : aliased constant String :=
      "#D182D0BED0BDD0BDD0B0"
      & Alias_Separator & "#D182D0BED0BDD0BDD18B"
      & Alias_Separator & "#D182D0BED0BDD0BDD0B8"
      & Alias_Separator & "#E38388E383B3"
      & Alias_Separator & "#ED86A4"
      & Alias_Separator & "#E590A8"
      & Alias_Separator & "#D8A3D8B7D986D8A7D98620D985D8AAD8B1D98AD8A9"
      & Alias_Separator & "#E0A49FE0A4A8"
      ;

   Generated_Unit_Alias_38 : aliased constant String :=
      "#D182D0BED0BDD0BDD0B0"
      & Alias_Separator & "#D182D0BED0BDD0BDD18B"
      & Alias_Separator & "#D182D0BED0BDD0BDD0B8"
      & Alias_Separator & "#E382B7E383A7E383BCE38388E38388E383B3"
      & Alias_Separator & "#EC87BCED8AB8ED86A4"
      & Alias_Separator & "#E79FADE590A8"
      & Alias_Separator & "#D8A3D8B7D986D8A7D986"
      & Alias_Separator & "#E0A49BE0A58BE0A49FE0A58720E0A49FE0A4A8"
      ;

   Generated_Unit_Aliases : constant Unit_Alias_Group_Array :=
     [
      (Unit => Humanize.Units.Gram, Aliases => Generated_Unit_Alias_01'Access),
      (Unit => Humanize.Units.Milligram, Aliases => Generated_Unit_Alias_02'Access),
      (Unit => Humanize.Units.Liter, Aliases => Generated_Unit_Alias_03'Access),
      (Unit => Humanize.Units.Milliliter, Aliases => Generated_Unit_Alias_04'Access),
      (Unit => Humanize.Units.Centimeter, Aliases => Generated_Unit_Alias_05'Access),
      (Unit => Humanize.Units.Millimeter, Aliases => Generated_Unit_Alias_06'Access),
      (Unit => Humanize.Units.Celsius, Aliases => Generated_Unit_Alias_07'Access),
      (Unit => Humanize.Units.Fahrenheit, Aliases => Generated_Unit_Alias_08'Access),
      (Unit => Humanize.Units.Square_Meter, Aliases => Generated_Unit_Alias_09'Access),
      (Unit => Humanize.Units.Hectare, Aliases => Generated_Unit_Alias_10'Access),
      (Unit => Humanize.Units.Kilometer_Per_Hour, Aliases => Generated_Unit_Alias_11'Access),
      (Unit => Humanize.Units.Meter_Per_Second, Aliases => Generated_Unit_Alias_12'Access),
      (Unit => Humanize.Units.Pascal, Aliases => Generated_Unit_Alias_13'Access),
      (Unit => Humanize.Units.Kilopascal, Aliases => Generated_Unit_Alias_14'Access),
      (Unit => Humanize.Units.Joule, Aliases => Generated_Unit_Alias_15'Access),
      (Unit => Humanize.Units.Kilojoule, Aliases => Generated_Unit_Alias_16'Access),
      (Unit => Humanize.Units.Watt, Aliases => Generated_Unit_Alias_17'Access),
      (Unit => Humanize.Units.Kilowatt, Aliases => Generated_Unit_Alias_18'Access),
      (Unit => Humanize.Units.Hertz, Aliases => Generated_Unit_Alias_19'Access),
      (Unit => Humanize.Units.Kilohertz, Aliases => Generated_Unit_Alias_20'Access),
      (Unit => Humanize.Units.Degree, Aliases => Generated_Unit_Alias_21'Access),
      (Unit => Humanize.Units.Mile, Aliases => Generated_Unit_Alias_22'Access),
      (Unit => Humanize.Units.Yard, Aliases => Generated_Unit_Alias_23'Access),
      (Unit => Humanize.Units.Foot, Aliases => Generated_Unit_Alias_24'Access),
      (Unit => Humanize.Units.Inch, Aliases => Generated_Unit_Alias_25'Access),
      (Unit => Humanize.Units.Nautical_Mile, Aliases => Generated_Unit_Alias_26'Access),
      (Unit => Humanize.Units.Acre, Aliases => Generated_Unit_Alias_27'Access),
      (Unit => Humanize.Units.Square_Kilometer, Aliases => Generated_Unit_Alias_28'Access),
      (Unit => Humanize.Units.Cubic_Meter, Aliases => Generated_Unit_Alias_29'Access),
      (Unit => Humanize.Units.Teaspoon, Aliases => Generated_Unit_Alias_30'Access),
      (Unit => Humanize.Units.Tablespoon, Aliases => Generated_Unit_Alias_31'Access),
      (Unit => Humanize.Units.Cup, Aliases => Generated_Unit_Alias_32'Access),
      (Unit => Humanize.Units.Gallon, Aliases => Generated_Unit_Alias_33'Access),
      (Unit => Humanize.Units.Pound, Aliases => Generated_Unit_Alias_34'Access),
      (Unit => Humanize.Units.Ounce, Aliases => Generated_Unit_Alias_35'Access),
      (Unit => Humanize.Units.Stone, Aliases => Generated_Unit_Alias_36'Access),
      (Unit => Humanize.Units.Tonne, Aliases => Generated_Unit_Alias_37'Access),
      (Unit => Humanize.Units.Ton, Aliases => Generated_Unit_Alias_38'Access)
     ];

   Unit_Alias_01 : aliased constant String :=
      "m"
      & Alias_Separator & "meter"
      & Alias_Separator & "meters"
      & Alias_Separator & "metre"
      & Alias_Separator & "metres"
      & Alias_Separator & "#6DC3A8747265"
      & Alias_Separator & "#6DC3A874726573"
      & Alias_Separator & "meter"
      & Alias_Separator & "metri"
      & Alias_Separator & "metrai"
      & Alias_Separator & "#6D65747269C3A4"
      & Alias_Separator & "metroj"
      & Alias_Separator & "metro"
      & Alias_Separator & "metros"
      & Alias_Separator & "met"
      & Alias_Separator & "mita"
      & Alias_Separator & "metr"
      & Alias_Separator & "metry"
      & Alias_Separator & "#6D657472C3B377"
      & Alias_Separator & "#6D657472C5AF"
      & Alias_Separator & "metreler"
      & Alias_Separator & "#D0BCD0B5D182D180"
      & Alias_Separator & "#D0BCD0B5D182D180D0B0"
      & Alias_Separator & "#D0BCD0B5D182D180D0BED0B2"
      & Alias_Separator & "#D0BCD0B5D182D180D18B"
      & Alias_Separator & "#D0BCD0B5D182D180D0B8"
      & Alias_Separator & "#D0BCD0B5D182D180D196D0B2"
      & Alias_Separator & "#E383A1E383BCE38388E383AB"
      & Alias_Separator & "#EBAFB8ED84B0"
      & Alias_Separator & "#E7B1B3"
      & Alias_Separator & "#D985D8AAD8B1"
      & Alias_Separator & "#D8A3D985D8AAD8A7D8B1"
      & Alias_Separator & "#E0A4AEE0A580E0A49FE0A4B0"
      ;

   Unit_Alias_02 : aliased constant String :=
      "km"
      & Alias_Separator & "kilometer"
      & Alias_Separator & "kilometers"
      & Alias_Separator & "kilometre"
      & Alias_Separator & "kilometres"
      & Alias_Separator & "#6B696C6F6DC3A8747265"
      & Alias_Separator & "#6B696C6F6DC3A874726573"
      & Alias_Separator & "kilometro"
      & Alias_Separator & "kilometros"
      & Alias_Separator & "kilometrai"
      & Alias_Separator & "kilometroj"
      & Alias_Separator & "#6B696CC3B36D6574726F"
      & Alias_Separator & "#6B696CC3B36D6574726F73"
      & Alias_Separator & "kilomita"
      & Alias_Separator & "#7175696CC3B46D6574726F"
      & Alias_Separator & "#7175696CC3B46D6574726F73"
      & Alias_Separator & "#7175696CC3B36D6574726F"
      & Alias_Separator & "#7175696CC3B36D6574726F73"
      & Alias_Separator & "chilometro"
      & Alias_Separator & "chilometri"
      & Alias_Separator & "kilometri"
      & Alias_Separator & "kilometr"
      & Alias_Separator & "kilomet"
      & Alias_Separator & "kilometry"
      & Alias_Separator & "#6B696C6F6D657472C3B377"
      & Alias_Separator & "#6B696C6F6D657472C5AF"
      & Alias_Separator & "#6B696C6F6D65747269C3A4"
      & Alias_Separator & "kilometreler"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0BCD0B5D182D180D0B0"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0BCD0B5D182D180D0BED0B2"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B"
      & Alias_Separator & "#D0BAD196D0BBD0BED0BCD0B5D182D180"
      & Alias_Separator & "#D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"
      & Alias_Separator & "#D0BAD196D0BBD0BED0BCD0B5D182D180D196D0B2"
      & Alias_Separator & "#E382ADE383ADE383A1E383BCE38388E383AB"
      & Alias_Separator & "#ED82ACEBA19CEBAFB8ED84B0"
      & Alias_Separator & "#E58D83E7B1B3"
      & Alias_Separator & "#D983D98AD984D988D985D8AAD8B1"
      & Alias_Separator & "#D983D98AD984D988D985D8AAD8B1D8A7D8AA"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"
      ;

   Unit_Alias_03 : aliased constant String :=
      "cm"
      & Alias_Separator & "centimeter"
      & Alias_Separator & "centimeters"
      & Alias_Separator & "centimetre"
      & Alias_Separator & "centimetres"
      & Alias_Separator & "zentimeter"
      & Alias_Separator & "#63656E74696DC3A8747265"
      & Alias_Separator & "#63656E74696DC3A874726573"
      & Alias_Separator & "centimetro"
      & Alias_Separator & "centimetri"
      & Alias_Separator & "centimetrai"
      & Alias_Separator & "centimetroj"
      & Alias_Separator & "centimetros"
      & Alias_Separator & "#63656E74C3AD6D6574726F"
      & Alias_Separator & "#63656E74C3AD6D6574726F73"
      & Alias_Separator & "centimetr"
      & Alias_Separator & "centimetry"
      & Alias_Separator & "senttimetri"
      & Alias_Separator & "sentimeter"
      & Alias_Separator & "sentimeters"
      & Alias_Separator & "xentimet"
      & Alias_Separator & "sentimita"
      & Alias_Separator & "#73656E7474696D65747269C3A4"
      & Alias_Separator & "santimetre"
      & Alias_Separator & "#63656E74796D657472C3B377"
      & Alias_Separator & "#63656E74696D657472C5AF"
      & Alias_Separator & "#D181D0B0D0BDD182D0B8D0BCD0B5D182D180"
      & Alias_Separator & "#D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B0"
      & Alias_Separator & "#D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0BED0B2"
      & Alias_Separator & "#D181D0B0D0BDD182D0B8D0BCD0B5D182D180D18B"
      & Alias_Separator & "#D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B8"
      & Alias_Separator & "#D181D0B0D0BDD182D0B8D0BCD0B5D182D180D196D0B2"
      & Alias_Separator & "#E382BBE383B3E38381E383A1E383BCE38388E383AB"
      & Alias_Separator & "#E58E98E7B1B3"
      ;

   Unit_Alias_04 : aliased constant String :=
      "mm"
      & Alias_Separator & "millimeter"
      & Alias_Separator & "millimeters"
      & Alias_Separator & "millimetre"
      & Alias_Separator & "millimetres"
      & Alias_Separator & "#6D696C6C696DC3A8747265"
      & Alias_Separator & "#6D696C6C696DC3A874726573"
      & Alias_Separator & "milimetro"
      & Alias_Separator & "milimetros"
      & Alias_Separator & "#6D696CC3AD6D6574726F"
      & Alias_Separator & "#6D696CC3AD6D6574726F73"
      & Alias_Separator & "millimetro"
      & Alias_Separator & "millimetri"
      & Alias_Separator & "milimetri"
      & Alias_Separator & "milimetrai"
      & Alias_Separator & "milimetroj"
      & Alias_Separator & "milimetr"
      & Alias_Separator & "milimeter"
      & Alias_Separator & "milimetry"
      & Alias_Separator & "milimetre"
      & Alias_Separator & "milimet"
      & Alias_Separator & "milimita"
      & Alias_Separator & "#6D696C6C696D65747269C3A4"
      & Alias_Separator & "#6D696C696D657472C3B377"
      & Alias_Separator & "#6D696C696D657472C5AF"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0B0"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0BED0B2"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D18B"
      & Alias_Separator & "#D0BCD196D0BBD196D0BCD0B5D182D180"
      & Alias_Separator & "#D0BCD196D0BBD196D0BCD0B5D182D180D0B8"
      & Alias_Separator & "#D0BCD196D0BBD196D0BCD0B5D182D180D196D0B2"
      & Alias_Separator & "#E3839FE383AAE383A1E383BCE38388E383AB"
      & Alias_Separator & "#E6AFABE7B1B3"
      ;

   Unit_Alias_05 : aliased constant String :=
      "g"
      & Alias_Separator & "gram"
      & Alias_Separator & "grams"
      & Alias_Separator & "gramme"
      & Alias_Separator & "grammes"
      & Alias_Separator & "gramm"
      & Alias_Separator & "gramo"
      & Alias_Separator & "gramos"
      & Alias_Separator & "grammo"
      & Alias_Separator & "grammi"
      & Alias_Separator & "grame"
      & Alias_Separator & "gramai"
      & Alias_Separator & "grami"
      & Alias_Separator & "gramoj"
      & Alias_Separator & "grama"
      & Alias_Separator & "gramas"
      & Alias_Separator & "gam"
      & Alias_Separator & "gramu"
      & Alias_Separator & "gramy"
      & Alias_Separator & "gramma"
      & Alias_Separator & "grammaa"
      & Alias_Separator & "#6772616DC3B377"
      & Alias_Separator & "#6772616DC5AF"
      & Alias_Separator & "#D0B3D180D0B0D0BC"
      & Alias_Separator & "#D0B3D180D0B0D0BCD0BC"
      & Alias_Separator & "#D0B3D180D0B0D0BCD0B8"
      & Alias_Separator & "#D0B3D180D0B0D0BCD196D0B2"
      & Alias_Separator & "#D0B3D180D0B0D0BCD0BCD0B0"
      & Alias_Separator & "#D0B3D180D0B0D0BCD0BCD0BED0B2"
      ;

   Unit_Alias_06 : aliased constant String :=
      "kg"
      & Alias_Separator & "kilogram"
      & Alias_Separator & "kilograms"
      & Alias_Separator & "kilogramm"
      & Alias_Separator & "kilogramme"
      & Alias_Separator & "kilogrammes"
      & Alias_Separator & "kilogramo"
      & Alias_Separator & "kilogramos"
      & Alias_Separator & "chilogrammo"
      & Alias_Separator & "chilogrammi"
      & Alias_Separator & "quilograma"
      & Alias_Separator & "quilogramas"
      & Alias_Separator & "kilograme"
      & Alias_Separator & "kilogramai"
      & Alias_Separator & "kilogrami"
      & Alias_Separator & "kilogramoj"
      & Alias_Separator & "kilogam"
      & Alias_Separator & "kilogramu"
      & Alias_Separator & "kilogrammaa"
      & Alias_Separator & "kilogramy"
      & Alias_Separator & "kilogramlar"
      & Alias_Separator & "#6B696C6F6772616DC3B377"
      & Alias_Separator & "#6B696C6F6772616DC5AF"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B3D180D0B0D0BC"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0B0"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2"
      & Alias_Separator & "#D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD18B"
      & Alias_Separator & "#D0BAD196D0BBD0BED0B3D180D0B0D0BC"
      & Alias_Separator & "#D0BAD196D0BBD0BED0B3D180D0B0D0BCD0B8"
      & Alias_Separator & "#D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2"
      & Alias_Separator & "#E382ADE383ADE382B0E383A9E383A0"
      & Alias_Separator & "#ED82ACEBA19CEAB7B8EBA7A8"
      & Alias_Separator & "#ED82ACEBA19CEAB7B8EB9EA8"
      & Alias_Separator & "#E58D83E5858B"
      & Alias_Separator & "#D983D98AD984D988D8ACD8B1D8A7D985"
      & Alias_Separator & "#D983D98AD984D988D8ACD8B1D8A7D985D8A7D8AA"
      & Alias_Separator & "#D983D98AD984D988D8BAD8B1D8A7D985"
      & Alias_Separator & "#D983D98AD984D988D8BAD8B1D8A7D985D8A7D8AA"
      & Alias_Separator & "#E0A495E0A4BFE0A4B2E0A58BE0A497E0A58DE0A4B0E0A4BEE0A4AE"
      ;

   Unit_Alias_07 : aliased constant String :=
      "mg"
      & Alias_Separator & "milligram"
      & Alias_Separator & "milligrams"
      & Alias_Separator & "milligramme"
      & Alias_Separator & "milligrammes"
      & Alias_Separator & "milligramm"
      & Alias_Separator & "miligramo"
      & Alias_Separator & "miligramos"
      & Alias_Separator & "milligrammo"
      & Alias_Separator & "milligrammi"
      & Alias_Separator & "miligrame"
      & Alias_Separator & "miligramai"
      & Alias_Separator & "miligrami"
      & Alias_Separator & "miligramoj"
      & Alias_Separator & "miligrama"
      & Alias_Separator & "miligramas"
      & Alias_Separator & "miligram"
      & Alias_Separator & "miligam"
      & Alias_Separator & "miligramu"
      & Alias_Separator & "miligramy"
      & Alias_Separator & "milligramma"
      & Alias_Separator & "milligrammaa"
      & Alias_Separator & "#6D696C696772616DC3B377"
      & Alias_Separator & "#6D696C696772616DC5AF"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BC"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0B0"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0BED0B2"
      & Alias_Separator & "#D0BCD196D0BBD196D0B3D180D0B0D0BC"
      & Alias_Separator & "#D0BCD196D0BBD196D0B3D180D0B0D0BCD0B8"
      & Alias_Separator & "#D0BCD196D0BBD196D0B3D180D0B0D0BCD196D0B2"
      ;

   Unit_Alias_08 : aliased constant String :=
      "l"
      & Alias_Separator & "liter"
      & Alias_Separator & "liters"
      & Alias_Separator & "litre"
      & Alias_Separator & "litres"
      & Alias_Separator & "litri"
      & Alias_Separator & "litrai"
      & Alias_Separator & "litroj"
      & Alias_Separator & "litro"
      & Alias_Separator & "litros"
      & Alias_Separator & "litraa"
      & Alias_Separator & "litr"
      & Alias_Separator & "litry"
      & Alias_Separator & "lit"
      & Alias_Separator & "lita"
      & Alias_Separator & "#6C697472C3B377"
      & Alias_Separator & "#6C697472C5AF"
      & Alias_Separator & "litreler"
      & Alias_Separator & "litra"
      & Alias_Separator & "#D0BBD0B8D182D180"
      & Alias_Separator & "#D0BBD0B8D182D180D0B0"
      & Alias_Separator & "#D0BBD0B8D182D180D0BED0B2"
      & Alias_Separator & "#D0BBD0B8D182D180D18B"
      & Alias_Separator & "#D0BBD196D182D180"
      & Alias_Separator & "#D0BBD196D182D180D0B8"
      & Alias_Separator & "#D0BBD196D182D180D196D0B2"
      & Alias_Separator & "#E383AAE38383E38388E383AB"
      & Alias_Separator & "#EBA6ACED84B0"
      & Alias_Separator & "#E58D87"
      & Alias_Separator & "#D984D8AAD8B1"
      & Alias_Separator & "#D984D8AAD8B1D8A7D8AA"
      & Alias_Separator & "#E0A4B2E0A580E0A49FE0A4B0"
      ;

   Unit_Alias_09 : aliased constant String :=
      "ml"
      & Alias_Separator & "milliliter"
      & Alias_Separator & "milliliters"
      & Alias_Separator & "millilitre"
      & Alias_Separator & "millilitres"
      & Alias_Separator & "mililitro"
      & Alias_Separator & "mililitros"
      & Alias_Separator & "millilitro"
      & Alias_Separator & "millilitri"
      & Alias_Separator & "mililitri"
      & Alias_Separator & "mililitrai"
      & Alias_Separator & "mililitroj"
      & Alias_Separator & "mililitr"
      & Alias_Separator & "mililiter"
      & Alias_Separator & "mililitry"
      & Alias_Separator & "mililitre"
      & Alias_Separator & "mililit"
      & Alias_Separator & "mililita"
      & Alias_Separator & "millilitra"
      & Alias_Separator & "millilitraa"
      & Alias_Separator & "#6D696C696C697472C3B377"
      & Alias_Separator & "#6D696C696C697472C5AF"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0B0"
      & Alias_Separator & "#D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0BED0B2"
      & Alias_Separator & "#D0BCD196D0BBD196D0BBD196D182D180"
      & Alias_Separator & "#D0BCD196D0BBD196D0BBD196D182D180D0B8"
      & Alias_Separator & "#D0BCD196D0BBD196D0BBD196D182D180D196D0B2"
      ;

   Unit_Alias_10 : aliased constant String :=
      "c"
      & Alias_Separator & "deg c"
      & Alias_Separator & "degree c"
      & Alias_Separator & "degrees c"
      & Alias_Separator & "celsius"
      & Alias_Separator & "degree celsius"
      & Alias_Separator & "degrees celsius"
      & Alias_Separator & "grad celsius"
      & Alias_Separator & "grader celsius"
      & Alias_Separator & "#64656772C3A92063656C73697573"
      & Alias_Separator & "#64656772C3A9732063656C73697573"
      & Alias_Separator & "grado celsius"
      & Alias_Separator & "grados celsius"
      & Alias_Separator & "grado celsius"
      & Alias_Separator & "gradi celsius"
      & Alias_Separator & "grau celsius"
      & Alias_Separator & "graus celsius"
      & Alias_Separator & "graad celsius"
      & Alias_Separator & "graden celsius"
      & Alias_Separator & "grader c"
      & Alias_Separator & "celsiusastetta"
      & Alias_Separator & "stopnie celsjusza"
      & Alias_Separator & "stupne celsia"
      & Alias_Separator & "#7374757065C5882043656C736961"
      & Alias_Separator & "#737475706EC49B2043656C736961"
      & Alias_Separator & "#7374757065C5882063656C736961"
      & Alias_Separator & "#737475706EC49B2063656C736961"
      & Alias_Separator & "santigrat derece"
      ;

   Unit_Alias_11 : aliased constant String :=
      "f"
      & Alias_Separator & "deg f"
      & Alias_Separator & "degree f"
      & Alias_Separator & "degrees f"
      & Alias_Separator & "fahrenheit"
      & Alias_Separator & "degree fahrenheit"
      & Alias_Separator & "degrees fahrenheit"
      & Alias_Separator & "#64656772C3A92066616872656E68656974"
      & Alias_Separator & "#64656772C3A9732066616872656E68656974"
      & Alias_Separator & "grado fahrenheit"
      & Alias_Separator & "grados fahrenheit"
      & Alias_Separator & "gradi fahrenheit"
      & Alias_Separator & "grau fahrenheit"
      & Alias_Separator & "graus fahrenheit"
      & Alias_Separator & "graad fahrenheit"
      & Alias_Separator & "graden fahrenheit"
      & Alias_Separator & "grad fahrenheit"
      & Alias_Separator & "grader fahrenheit"
      & Alias_Separator & "grader f"
      & Alias_Separator & "fahrenheitastetta"
      & Alias_Separator & "stopnie fahrenheita"
      & Alias_Separator & "stupne fahrenheita"
      & Alias_Separator & "#7374757065C5882046616872656E6865697461"
      & Alias_Separator & "#737475706EC49B2046616872656E6865697461"
      & Alias_Separator & "#7374757065C5882066616872656E6865697461"
      & Alias_Separator & "#737475706EC49B2066616872656E6865697461"
      & Alias_Separator & "fahrenhayt derece"
      ;

   Unit_Alias_12 : aliased constant String :=
      "m2"
      & Alias_Separator & "square meter"
      & Alias_Separator & "square meters"
      & Alias_Separator & "square metre"
      & Alias_Separator & "square metres"
      & Alias_Separator & "#6DC3A87472652063617272C3A9"
      & Alias_Separator & "#6DC3A8747265732063617272C3A973"
      & Alias_Separator & "quadratmeter"
      & Alias_Separator & "metro cuadrado"
      & Alias_Separator & "metros cuadrados"
      & Alias_Separator & "metro quadrato"
      & Alias_Separator & "metri quadrati"
      & Alias_Separator & "metro quadrado"
      & Alias_Separator & "metros quadrados"
      & Alias_Separator & "vierkante meter"
      & Alias_Separator & "kvadratmeter"
      & Alias_Separator & "#6E656C69C3B66D65747269"
      & Alias_Separator & "#6E656C69C3B66D65747269C3A4"
      & Alias_Separator & "metr kwadratowy"
      & Alias_Separator & "metry kwadratowe"
      & Alias_Separator & "#6D65747220C48D7476657265C48D6EC3BD"
      & Alias_Separator & "#6D6574727920C48D7476657265C48D6EC3A9"
      & Alias_Separator & "metrekare"
      ;

   Unit_Alias_13 : aliased constant String :=
      "km2"
      & Alias_Separator & "square kilometer"
      & Alias_Separator & "square kilometers"
      & Alias_Separator & "square kilometre"
      & Alias_Separator & "square kilometres"
      & Alias_Separator & "#6B696C6F6DC3A87472652063617272C3A9"
      & Alias_Separator & "#6B696C6F6DC3A8747265732063617272C3A973"
      & Alias_Separator & "quadratkilometer"
      & Alias_Separator & "kilometro cuadrado"
      & Alias_Separator & "kilometros cuadrados"
      & Alias_Separator & "#6B696CC3B36D6574726F20637561647261646F"
      & Alias_Separator & "#6B696CC3B36D6574726F7320637561647261646F73"
      & Alias_Separator & "chilometro quadrato"
      & Alias_Separator & "chilometri quadrati"
      & Alias_Separator & "quilometro quadrado"
      & Alias_Separator & "quilometros quadrados"
      & Alias_Separator & "#7175696CC3B46D6574726F20717561647261646F"
      & Alias_Separator & "#7175696CC3B46D6574726F7320717561647261646F73"
      & Alias_Separator & "vierkante kilometer"
      & Alias_Separator & "kvadratkilometer"
      & Alias_Separator & "#6E656C69C3B66B696C6F6D65747269"
      & Alias_Separator & "#6E656C69C3B66B696C6F6D65747269C3A4"
      & Alias_Separator & "kilometr kwadratowy"
      & Alias_Separator & "kilometry kwadratowe"
      & Alias_Separator & "#6B696C6F6D65747220C48D7476657265C48D6EC3BD"
      & Alias_Separator & "#6B696C6F6D6574727920C48D7476657265C48D6EC3A9"
      & Alias_Separator & "kilometrekare"
      ;

   Unit_Alias_14 : aliased constant String :=
      "ha"
      & Alias_Separator & "hectare"
      & Alias_Separator & "hectares"
      & Alias_Separator & "hectarea"
      & Alias_Separator & "hectareas"
      & Alias_Separator & "#68656374C3A1726561"
      & Alias_Separator & "#68656374C3A172656173"
      & Alias_Separator & "ettaro"
      & Alias_Separator & "ettari"
      & Alias_Separator & "hektar"
      & Alias_Separator & "hektary"
      & Alias_Separator & "hehtaari"
      & Alias_Separator & "hehtaaria"
      ;

   Unit_Alias_15 : aliased constant String :=
      "acre"
      & Alias_Separator & "acres"
      & Alias_Separator & "ac"
      & Alias_Separator & "acro"
      & Alias_Separator & "acri"
      & Alias_Separator & "akr"
      & Alias_Separator & "akry"
      & Alias_Separator & "eekkeri"
      & Alias_Separator & "#65656B6B657269C3A4"
      ;

   Unit_Alias_16 : aliased constant String :=
      "m3"
      & Alias_Separator & "cubic meter"
      & Alias_Separator & "cubic meters"
      & Alias_Separator & "cubic metre"
      & Alias_Separator & "cubic metres"
      & Alias_Separator & "#6DC3A87472652063756265"
      & Alias_Separator & "#6DC3A874726573206375626573"
      & Alias_Separator & "#6D6574726F2063C3BA6269636F"
      & Alias_Separator & "#6D6574726F732063C3BA6269636F73"
      & Alias_Separator & "metro cubo"
      & Alias_Separator & "metri cubi"
      & Alias_Separator & "kubieke meter"
      & Alias_Separator & "kubikmeter"
      & Alias_Separator & "kubikkmeter"
      & Alias_Separator & "kuutiometri"
      & Alias_Separator & "#6B757574696F6D65747269C3A4"
      & Alias_Separator & "metr szescienny"
      & Alias_Separator & "metry szescienne"
      & Alias_Separator & "#6D65747220737A65C59B6369656E6E79"
      & Alias_Separator & "#6D6574727920737A65C59B6369656E6E65"
      & Alias_Separator & "#6D657472206B727963686C6F76C3BD"
      & Alias_Separator & "#6D65747279206B727963686C6F76C3A9"
      & Alias_Separator & "metrekup"
      & Alias_Separator & "#6D657472656BC3BC70"
      ;

   Unit_Alias_17 : aliased constant String :=
      "km/h"
      & Alias_Separator & "kilometer per hour"
      & Alias_Separator & "kilometers per hour"
      & Alias_Separator & "kilometer pro stunde"
      & Alias_Separator & "kilometro por hora"
      & Alias_Separator & "kilometros por hora"
      & Alias_Separator & "chilometro all'ora"
      & Alias_Separator & "chilometri all'ora"
      & Alias_Separator & "quilometro por hora"
      & Alias_Separator & "quilometros por hora"
      & Alias_Separator & "#7175696CC3B46D6574726F20706F7220686F7261"
      & Alias_Separator & "#7175696CC3B46D6574726F7320706F7220686F7261"
      & Alias_Separator & "#6B696CC3B36D6574726F20706F7220686F7261"
      & Alias_Separator & "#6B696CC3B36D6574726F7320706F7220686F7261"
      & Alias_Separator & "kilometer per uur"
      & Alias_Separator & "kilometer i timmen"
      & Alias_Separator & "kilometer i timen"
      & Alias_Separator & "#6B696C6F6DC3A874726520706172206865757265"
      & Alias_Separator & "#6B696C6F6DC3A87472657320706172206865757265"
      & Alias_Separator & "kilometri tunnissa"
      & Alias_Separator & "#6B696C6F6D65747269C3A42074756E6E69737361"
      & Alias_Separator & "kilometr na godzine"
      & Alias_Separator & "kilometry na godzine"
      & Alias_Separator & "#6B696C6F6D657472206E6120676F647A696EC499"
      & Alias_Separator & "#6B696C6F6D65747279206E6120676F647A696EC499"
      & Alias_Separator & "kilometr za hodinu"
      & Alias_Separator & "kilometry za hodinu"
      & Alias_Separator & "saatte kilometre"
      ;

   Unit_Alias_18 : aliased constant String :=
      "m/s"
      & Alias_Separator & "meter per second"
      & Alias_Separator & "meters per second"
      & Alias_Separator & "meter pro sekunde"
      & Alias_Separator & "metro por segundo"
      & Alias_Separator & "metros por segundo"
      & Alias_Separator & "metro al secondo"
      & Alias_Separator & "metri al secondo"
      & Alias_Separator & "meter per seconde"
      & Alias_Separator & "meter i sekundet"
      & Alias_Separator & "meter per sekund"
      & Alias_Separator & "#6DC3A874726520706172207365636F6E6465"
      & Alias_Separator & "#6DC3A87472657320706172207365636F6E6465"
      & Alias_Separator & "metri sekunnissa"
      & Alias_Separator & "#6D65747269C3A42073656B756E6E69737361"
      & Alias_Separator & "metr na sekunde"
      & Alias_Separator & "metry na sekunde"
      & Alias_Separator & "#6D657472206E612073656B756E64C499"
      & Alias_Separator & "#6D65747279206E612073656B756E64C499"
      & Alias_Separator & "metr za sekundu"
      & Alias_Separator & "metry za sekundu"
      & Alias_Separator & "saniyede metre"
      ;

   Unit_Alias_19 : aliased constant String :=
      "pa"
      & Alias_Separator & "pascal"
      & Alias_Separator & "pascals"
      & Alias_Separator & "pascales"
      & Alias_Separator & "pascale"
      & Alias_Separator & "pascali"
      & Alias_Separator & "pascais"
      & Alias_Separator & "pascaly"
      & Alias_Separator & "paskal"
      & Alias_Separator & "paskale"
      & Alias_Separator & "pascalia"
      ;

   Unit_Alias_20 : aliased constant String :=
      "kpa"
      & Alias_Separator & "kilopascal"
      & Alias_Separator & "kilopascals"
      & Alias_Separator & "kilopascal"
      & Alias_Separator & "kilopascales"
      & Alias_Separator & "kilopascale"
      & Alias_Separator & "kilopascali"
      & Alias_Separator & "quilopascal"
      & Alias_Separator & "quilopascais"
      & Alias_Separator & "kilopascaly"
      & Alias_Separator & "kilopaskal"
      & Alias_Separator & "kilopaskale"
      & Alias_Separator & "kilopascalia"
      ;

   Unit_Alias_21 : aliased constant String :=
      "j"
      & Alias_Separator & "joule"
      & Alias_Separator & "joules"
      & Alias_Separator & "julio"
      & Alias_Separator & "julios"
      & Alias_Separator & "joulea"
      & Alias_Separator & "jouly"
      & Alias_Separator & "#64C5BC756C"
      & Alias_Separator & "#64C5BC756C65"
      & Alias_Separator & "jul"
      ;

   Unit_Alias_22 : aliased constant String :=
      "kj"
      & Alias_Separator & "kilojoule"
      & Alias_Separator & "kilojoules"
      & Alias_Separator & "kilojulio"
      & Alias_Separator & "kilojulios"
      & Alias_Separator & "quilojoule"
      & Alias_Separator & "quilojoules"
      & Alias_Separator & "kilojoulea"
      & Alias_Separator & "kilojouly"
      & Alias_Separator & "#6B696C6F64C5BC756C"
      & Alias_Separator & "#6B696C6F64C5BC756C65"
      & Alias_Separator & "kilojul"
      ;

   Unit_Alias_23 : aliased constant String :=
      "w"
      & Alias_Separator & "watt"
      & Alias_Separator & "watts"
      & Alias_Separator & "vatio"
      & Alias_Separator & "vatios"
      & Alias_Separator & "watti"
      & Alias_Separator & "wattia"
      & Alias_Separator & "wat"
      & Alias_Separator & "waty"
      & Alias_Separator & "watty"
      & Alias_Separator & "vat"
      ;

   Unit_Alias_24 : aliased constant String :=
      "kw"
      & Alias_Separator & "kilowatt"
      & Alias_Separator & "kilowatts"
      & Alias_Separator & "kilovatio"
      & Alias_Separator & "kilovatios"
      & Alias_Separator & "quilowatt"
      & Alias_Separator & "quilowatts"
      & Alias_Separator & "kilowatti"
      & Alias_Separator & "kilowattia"
      & Alias_Separator & "kilowat"
      & Alias_Separator & "kilowaty"
      & Alias_Separator & "kilowatty"
      & Alias_Separator & "kilovat"
      ;

   Unit_Alias_25 : aliased constant String :=
      "hz"
      & Alias_Separator & "hertz"
      & Alias_Separator & "cycles per second"
      & Alias_Separator & "hercio"
      & Alias_Separator & "hercios"
      & Alias_Separator & "hertsi"
      & Alias_Separator & "#686572747369C3A4"
      & Alias_Separator & "herc"
      & Alias_Separator & "herce"
      & Alias_Separator & "hertzy"
      ;

   Unit_Alias_26 : aliased constant String :=
      "khz"
      & Alias_Separator & "kilohertz"
      & Alias_Separator & "kilohercio"
      & Alias_Separator & "kilohercios"
      & Alias_Separator & "quilohertz"
      & Alias_Separator & "kilohertsi"
      & Alias_Separator & "#6B696C6F686572747369C3A4"
      & Alias_Separator & "kiloherc"
      & Alias_Separator & "kiloherce"
      & Alias_Separator & "kilohertzy"
      ;

   Unit_Alias_27 : aliased constant String :=
      "degree"
      & Alias_Separator & "degrees"
      & Alias_Separator & "#64656772C3A9"
      & Alias_Separator & "#64656772C3A973"
      & Alias_Separator & "grado"
      & Alias_Separator & "grados"
      & Alias_Separator & "gradi"
      & Alias_Separator & "grau"
      & Alias_Separator & "graus"
      & Alias_Separator & "graad"
      & Alias_Separator & "graden"
      & Alias_Separator & "grad"
      & Alias_Separator & "grader"
      & Alias_Separator & "aste"
      & Alias_Separator & "astetta"
      & Alias_Separator & "#73746F706965C584"
      & Alias_Separator & "stopnie"
      & Alias_Separator & "#7374757065C588"
      & Alias_Separator & "#737475706EC49B"
      & Alias_Separator & "derece"
      ;

   Unit_Alias_28 : aliased constant String :=
      "mi"
      & Alias_Separator & "mile"
      & Alias_Separator & "miles"
      & Alias_Separator & "meile"
      & Alias_Separator & "meilen"
      & Alias_Separator & "mille"
      & Alias_Separator & "milles"
      & Alias_Separator & "milla"
      & Alias_Separator & "millas"
      & Alias_Separator & "miglio"
      & Alias_Separator & "miglia"
      & Alias_Separator & "milha"
      & Alias_Separator & "milhas"
      & Alias_Separator & "mijl"
      & Alias_Separator & "maili"
      & Alias_Separator & "mailia"
      & Alias_Separator & "mila"
      & Alias_Separator & "#6DC3AD6C65"
      & Alias_Separator & "mil"
      ;

   Unit_Alias_29 : aliased constant String :=
      "nmi"
      & Alias_Separator & "nautical mile"
      & Alias_Separator & "nautical miles"
      & Alias_Separator & "seemeile"
      & Alias_Separator & "seemeilen"
      & Alias_Separator & "mille marin"
      & Alias_Separator & "milles marins"
      & Alias_Separator & "milla nautica"
      & Alias_Separator & "millas nauticas"
      & Alias_Separator & "miglio nautico"
      & Alias_Separator & "miglia nautiche"
      & Alias_Separator & "milha nautica"
      & Alias_Separator & "milhas nauticas"
      & Alias_Separator & "zeemijl"
      & Alias_Separator & "#6D696C6861206EC3A17574696361"
      & Alias_Separator & "#6D696C686173206EC3A1757469636173"
      & Alias_Separator & "#6D696C6C61206EC3A17574696361"
      & Alias_Separator & "#6D696C6C6173206EC3A1757469636173"
      & Alias_Separator & "sjomil"
      & Alias_Separator & "#736AC3B66D696C"
      & Alias_Separator & "#73C3B86D696C"
      & Alias_Separator & "nautisk mil"
      & Alias_Separator & "nautiske mil"
      & Alias_Separator & "meripeninkulma"
      & Alias_Separator & "meripeninkulmaa"
      & Alias_Separator & "mila morska"
      & Alias_Separator & "mile morskie"
      & Alias_Separator & "#6EC3A16D6FC5996EC3AD206DC3AD6C65"
      & Alias_Separator & "deniz mili"
      ;

   Unit_Alias_30 : aliased constant String :=
      "yd"
      & Alias_Separator & "yard"
      & Alias_Separator & "yards"
      & Alias_Separator & "yarda"
      & Alias_Separator & "yardas"
      & Alias_Separator & "iarda"
      & Alias_Separator & "iarde"
      & Alias_Separator & "jarda"
      & Alias_Separator & "jardas"
      & Alias_Separator & "jaardi"
      & Alias_Separator & "jaardia"
      & Alias_Separator & "jard"
      & Alias_Separator & "jardy"
      & Alias_Separator & "yardy"
      & Alias_Separator & "yarda"
      ;

   Unit_Alias_31 : aliased constant String :=
      "ft"
      & Alias_Separator & "foot"
      & Alias_Separator & "feet"
      & Alias_Separator & "fod"
      & Alias_Separator & "#6675C39F"
      & Alias_Separator & "#70C3A9"
      & Alias_Separator & "#70C3A973"
      & Alias_Separator & "pied"
      & Alias_Separator & "pieds"
      & Alias_Separator & "pie"
      & Alias_Separator & "pies"
      & Alias_Separator & "piede"
      & Alias_Separator & "piedi"
      & Alias_Separator & "voet"
      & Alias_Separator & "fot"
      & Alias_Separator & "#66C3B674746572"
      & Alias_Separator & "#66C3B874746572"
      & Alias_Separator & "jalka"
      & Alias_Separator & "jalkaa"
      & Alias_Separator & "stopa"
      & Alias_Separator & "stopy"
      & Alias_Separator & "fit"
      ;

   Unit_Alias_32 : aliased constant String :=
      "in"
      & Alias_Separator & "inch"
      & Alias_Separator & "inches"
      & Alias_Separator & "zoll"
      & Alias_Separator & "pouce"
      & Alias_Separator & "pouces"
      & Alias_Separator & "pulgada"
      & Alias_Separator & "pulgadas"
      & Alias_Separator & "pollice"
      & Alias_Separator & "pollici"
      & Alias_Separator & "polegada"
      & Alias_Separator & "polegadas"
      & Alias_Separator & "tum"
      & Alias_Separator & "tomme"
      & Alias_Separator & "tommer"
      & Alias_Separator & "tuuma"
      & Alias_Separator & "tuumaa"
      & Alias_Separator & "cal"
      & Alias_Separator & "cale"
      & Alias_Separator & "palec"
      & Alias_Separator & "palce"
      & Alias_Separator & "inc"
      ;

   Unit_Alias_33 : aliased constant String :=
      "tsp"
      & Alias_Separator & "teaspoon"
      & Alias_Separator & "teaspoons"
      & Alias_Separator & "#7465656CC3B66666656C"
      & Alias_Separator & "#6375696C6CC3A8726520C3A020636166C3A9"
      & Alias_Separator & "#6375696C6CC3A872657320C3A020636166C3A9"
      & Alias_Separator & "#636F6C686572206465206368C3A1"
      & Alias_Separator & "#636F6C6865726573206465206368C3A1"
      & Alias_Separator & "cucharadita"
      & Alias_Separator & "cucharaditas"
      & Alias_Separator & "cucchiaino"
      & Alias_Separator & "cucchiaini"
      & Alias_Separator & "theelepel"
      & Alias_Separator & "theelepels"
      & Alias_Separator & "tesked"
      & Alias_Separator & "teskedar"
      & Alias_Separator & "teske"
      & Alias_Separator & "teskeer"
      & Alias_Separator & "teskje"
      & Alias_Separator & "teskjeer"
      & Alias_Separator & "teelusikka"
      & Alias_Separator & "teelusikkaa"
      & Alias_Separator & "lyzeczka"
      & Alias_Separator & "lyzeczki"
      & Alias_Separator & "#C58279C5BC65637A6B61"
      & Alias_Separator & "#C58279C5BC65637A6B69"
      & Alias_Separator & "#C48D616A6F76C3A1206CC5BE69C48D6B61"
      & Alias_Separator & "#C48D616A6F76C3A9206CC5BE69C48D6B79"
      & Alias_Separator & "#C3A76179206B61C59FC4B1C49FC4B1"
      ;

   Unit_Alias_34 : aliased constant String :=
      "tbsp"
      & Alias_Separator & "tablespoon"
      & Alias_Separator & "tablespoons"
      & Alias_Separator & "#6573736CC3B66666656C"
      & Alias_Separator & "#6375696C6CC3A8726520C3A020736F757065"
      & Alias_Separator & "#6375696C6CC3A872657320C3A020736F757065"
      & Alias_Separator & "cucharada"
      & Alias_Separator & "cucharadas"
      & Alias_Separator & "cucchiaio"
      & Alias_Separator & "cucchiai"
      & Alias_Separator & "colher de sopa"
      & Alias_Separator & "colheres de sopa"
      & Alias_Separator & "eetlepel"
      & Alias_Separator & "eetlepels"
      & Alias_Separator & "matsked"
      & Alias_Separator & "matskedar"
      & Alias_Separator & "spiseske"
      & Alias_Separator & "spiseskeer"
      & Alias_Separator & "spiseskje"
      & Alias_Separator & "spiseskjeer"
      & Alias_Separator & "ruokalusikka"
      & Alias_Separator & "ruokalusikkaa"
      & Alias_Separator & "lyzka stolowa"
      & Alias_Separator & "lyzki stolowe"
      & Alias_Separator & "#C58279C5BC6B612073746FC5826F7761"
      & Alias_Separator & "#C58279C5BC6B692073746FC5826F7765"
      & Alias_Separator & "#706F6CC3A9766B6F76C3A1206CC5BE696365"
      & Alias_Separator & "#706F6CC3A9766B6F76C3A9206CC5BE696365"
      & Alias_Separator & "#79656D656B206B61C59FC4B1C49FC4B1"
      ;

   Unit_Alias_35 : aliased constant String :=
      "cup"
      & Alias_Separator & "cups"
      & Alias_Separator & "tasse"
      & Alias_Separator & "tassen"
      & Alias_Separator & "tasses"
      & Alias_Separator & "taza"
      & Alias_Separator & "tazas"
      & Alias_Separator & "tazza"
      & Alias_Separator & "tazze"
      & Alias_Separator & "xicara"
      & Alias_Separator & "xicaras"
      & Alias_Separator & "#78C3AD63617261"
      & Alias_Separator & "#78C3AD6361726173"
      & Alias_Separator & "kop"
      & Alias_Separator & "koppen"
      & Alias_Separator & "kopp"
      & Alias_Separator & "koppar"
      & Alias_Separator & "kopper"
      & Alias_Separator & "kuppi"
      & Alias_Separator & "kuppia"
      & Alias_Separator & "filizanka"
      & Alias_Separator & "filizanki"
      & Alias_Separator & "#66696C69C5BC616E6B61"
      & Alias_Separator & "#66696C69C5BC616E6B69"
      & Alias_Separator & "#C5A1C3A16C656B"
      & Alias_Separator & "#C5A1C3A16C6B79"
      & Alias_Separator & "bardak"
      ;

   Unit_Alias_36 : aliased constant String :=
      "gal"
      & Alias_Separator & "gallon"
      & Alias_Separator & "gallons"
      & Alias_Separator & "gallone"
      & Alias_Separator & "gallonen"
      & Alias_Separator & "galon"
      & Alias_Separator & "galones"
      & Alias_Separator & "gallone"
      & Alias_Separator & "galloni"
      & Alias_Separator & "#67616CC3A36F"
      & Alias_Separator & "#67616CC3B56573"
      & Alias_Separator & "gallona"
      & Alias_Separator & "gallonaa"
      & Alias_Separator & "galon"
      & Alias_Separator & "galony"
      ;

   Unit_Alias_37 : aliased constant String :=
      "lb"
      & Alias_Separator & "lbs"
      & Alias_Separator & "pound"
      & Alias_Separator & "pounds"
      & Alias_Separator & "pfund"
      & Alias_Separator & "livre"
      & Alias_Separator & "livres"
      & Alias_Separator & "libra"
      & Alias_Separator & "libras"
      & Alias_Separator & "libbra"
      & Alias_Separator & "libbre"
      & Alias_Separator & "pond"
      & Alias_Separator & "pund"
      & Alias_Separator & "pauna"
      & Alias_Separator & "paunaa"
      & Alias_Separator & "funt"
      & Alias_Separator & "funty"
      & Alias_Separator & "libra"
      & Alias_Separator & "libry"
      ;

   Unit_Alias_38 : aliased constant String :=
      "oz"
      & Alias_Separator & "ounce"
      & Alias_Separator & "ounces"
      & Alias_Separator & "unze"
      & Alias_Separator & "unzen"
      & Alias_Separator & "once"
      & Alias_Separator & "onces"
      & Alias_Separator & "onza"
      & Alias_Separator & "onzas"
      & Alias_Separator & "oncia"
      & Alias_Separator & "once"
      & Alias_Separator & "#6F6EC3A761"
      & Alias_Separator & "#6F6EC3A76173"
      & Alias_Separator & "uns"
      & Alias_Separator & "unse"
      & Alias_Separator & "unser"
      & Alias_Separator & "unssi"
      & Alias_Separator & "unssia"
      & Alias_Separator & "uncja"
      & Alias_Separator & "uncje"
      & Alias_Separator & "unce"
      & Alias_Separator & "ons"
      ;

   Unit_Alias_39 : aliased constant String :=
      "st"
      & Alias_Separator & "stone"
      & Alias_Separator & "stones"
      & Alias_Separator & "stonea"
      ;

   Unit_Alias_40 : aliased constant String :=
      "tonne"
      & Alias_Separator & "tonnes"
      & Alias_Separator & "tonnen"
      & Alias_Separator & "tonelada"
      & Alias_Separator & "toneladas"
      & Alias_Separator & "tonnellata"
      & Alias_Separator & "tonnellate"
      & Alias_Separator & "tonn"
      & Alias_Separator & "tonni"
      & Alias_Separator & "tonnia"
      & Alias_Separator & "tona"
      & Alias_Separator & "tony"
      & Alias_Separator & "tuna"
      & Alias_Separator & "tuny"
      ;

   Unit_Alias_41 : aliased constant String :=
      "ton"
      & Alias_Separator & "tons"
      & Alias_Separator & "short ton"
      & Alias_Separator & "short tons"
      & Alias_Separator & "tonne courte"
      & Alias_Separator & "tonnes courtes"
      & Alias_Separator & "tonelada corta"
      & Alias_Separator & "toneladas cortas"
      & Alias_Separator & "tonnellata corta"
      & Alias_Separator & "tonnellate corte"
      & Alias_Separator & "tonelada curta"
      & Alias_Separator & "toneladas curtas"
      & Alias_Separator & "kort ton"
      & Alias_Separator & "korta ton"
      & Alias_Separator & "kort tonn"
      & Alias_Separator & "korte tonn"
      & Alias_Separator & "lyhyt tonni"
      & Alias_Separator & "lyhytta tonnia"
      & Alias_Separator & "#6C7968797474C3A420746F6E6E6961"
      & Alias_Separator & "tona krotka"
      & Alias_Separator & "tony krotkie"
      & Alias_Separator & "#746F6E61206B72C3B3746B61"
      & Alias_Separator & "#746F6E79206B72C3B3746B6965"
      & Alias_Separator & "#6B72C3A1746BC3A12074756E61"
      & Alias_Separator & "#6B72C3A1746BC3A92074756E79"
      & Alias_Separator & "kisa ton"
      & Alias_Separator & "#6BC4B1736120746F6E"
      ;

   Unit_Aliases : constant Unit_Alias_Group_Array :=
     [
      (Unit => Humanize.Units.Meter, Aliases => Unit_Alias_01'Access),
      (Unit => Humanize.Units.Kilometer, Aliases => Unit_Alias_02'Access),
      (Unit => Humanize.Units.Centimeter, Aliases => Unit_Alias_03'Access),
      (Unit => Humanize.Units.Millimeter, Aliases => Unit_Alias_04'Access),
      (Unit => Humanize.Units.Gram, Aliases => Unit_Alias_05'Access),
      (Unit => Humanize.Units.Kilogram, Aliases => Unit_Alias_06'Access),
      (Unit => Humanize.Units.Milligram, Aliases => Unit_Alias_07'Access),
      (Unit => Humanize.Units.Liter, Aliases => Unit_Alias_08'Access),
      (Unit => Humanize.Units.Milliliter, Aliases => Unit_Alias_09'Access),
      (Unit => Humanize.Units.Celsius, Aliases => Unit_Alias_10'Access),
      (Unit => Humanize.Units.Fahrenheit, Aliases => Unit_Alias_11'Access),
      (Unit => Humanize.Units.Square_Meter, Aliases => Unit_Alias_12'Access),
      (Unit => Humanize.Units.Square_Kilometer, Aliases => Unit_Alias_13'Access),
      (Unit => Humanize.Units.Hectare, Aliases => Unit_Alias_14'Access),
      (Unit => Humanize.Units.Acre, Aliases => Unit_Alias_15'Access),
      (Unit => Humanize.Units.Cubic_Meter, Aliases => Unit_Alias_16'Access),
      (Unit => Humanize.Units.Kilometer_Per_Hour, Aliases => Unit_Alias_17'Access),
      (Unit => Humanize.Units.Meter_Per_Second, Aliases => Unit_Alias_18'Access),
      (Unit => Humanize.Units.Pascal, Aliases => Unit_Alias_19'Access),
      (Unit => Humanize.Units.Kilopascal, Aliases => Unit_Alias_20'Access),
      (Unit => Humanize.Units.Joule, Aliases => Unit_Alias_21'Access),
      (Unit => Humanize.Units.Kilojoule, Aliases => Unit_Alias_22'Access),
      (Unit => Humanize.Units.Watt, Aliases => Unit_Alias_23'Access),
      (Unit => Humanize.Units.Kilowatt, Aliases => Unit_Alias_24'Access),
      (Unit => Humanize.Units.Hertz, Aliases => Unit_Alias_25'Access),
      (Unit => Humanize.Units.Kilohertz, Aliases => Unit_Alias_26'Access),
      (Unit => Humanize.Units.Degree, Aliases => Unit_Alias_27'Access),
      (Unit => Humanize.Units.Mile, Aliases => Unit_Alias_28'Access),
      (Unit => Humanize.Units.Nautical_Mile, Aliases => Unit_Alias_29'Access),
      (Unit => Humanize.Units.Yard, Aliases => Unit_Alias_30'Access),
      (Unit => Humanize.Units.Foot, Aliases => Unit_Alias_31'Access),
      (Unit => Humanize.Units.Inch, Aliases => Unit_Alias_32'Access),
      (Unit => Humanize.Units.Teaspoon, Aliases => Unit_Alias_33'Access),
      (Unit => Humanize.Units.Tablespoon, Aliases => Unit_Alias_34'Access),
      (Unit => Humanize.Units.Cup, Aliases => Unit_Alias_35'Access),
      (Unit => Humanize.Units.Gallon, Aliases => Unit_Alias_36'Access),
      (Unit => Humanize.Units.Pound, Aliases => Unit_Alias_37'Access),
      (Unit => Humanize.Units.Ounce, Aliases => Unit_Alias_38'Access),
      (Unit => Humanize.Units.Stone, Aliases => Unit_Alias_39'Access),
      (Unit => Humanize.Units.Tonne, Aliases => Unit_Alias_40'Access),
      (Unit => Humanize.Units.Ton, Aliases => Unit_Alias_41'Access)
     ];

   function Static_Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      return Lookup_Unit_Alias (Item, Unit_Aliases, Unit);
   end Static_Unit_Value;

   function Generated_Unit_Value
     (Text : String;
      Unit : out Humanize.Units.Unit_Kind)
      return Boolean
   is
      Item : constant String := Clean_Lower (Text);
   begin
      return Lookup_Unit_Alias (Item, Generated_Unit_Aliases, Unit);
   end Generated_Unit_Value;

   pragma Style_Checks (On);
end Humanize.Parsing.Unit_Aliases;
