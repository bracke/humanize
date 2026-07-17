separate (Humanize.Parsing.Implementation.Date_Time_Text_Helpers)
function Canonical_Natural_Date_Text (Text : String) return String is
      Item : constant String := Clean_Lower (Text);
begin
      if Item = "today" or else Item = "now"
        or else Item = "i dag" or else Item = "heute"
        or else Item = "aujourd'hui" or else Item = "hoy"
        or else Item = "oggi" or else Item = "hoje"
        or else Item = "vandaag" or else Item = "idag"
        or else Item = B ("74C3A46EC3A46E")
        or else Item = B ("74C3A46EC3A4C3A46E")
        or else Item = B ("647A69C59B")
        or else Item = "dnes" or else Item = B ("627567C3BC6E")
        or else Item = B ("617374C4837A69")
        or else Item = B ("C5A169616E6469656E")
        or else Item = "danes"
        or else Item = "hari ini"
        or else Item = "hom nay"
        or else Item = "leo"
        or else Item = "vandag"
        or else Item = "ma"
        or else Item = "dnes"
        or else Item = B ("686F646961C5AD")
        or else Item = B ("D181D0B5D0B3D0BED0B4D0BDD18F")
        or else Item = B ("D181D18CD0BED0B3D0BED0B4D0BDD196")
        or else Item = B ("E4BB8AE697A5")
        or else Item = B ("EC98A4EB8A98")
        or else Item = B ("E4BB8AE5A4A9")
        or else Item = B ("D8A7D984D98AD988D985")
        or else Item = B ("E0A486E0A49C")
      then
         return "today";
      elsif Item = "tomorrow" or else Item = "i morgen" or else Item = "morgen"
        or else Item = "demain" or else Item = B ("6D61C3B1616E61")
        or else Item = "domani" or else Item = B ("616D616E68C3A3")
        or else Item = "imorgon" or else Item = "huomenna"
        or else Item = "jutro" or else Item = B ("7AC3AD747261")
        or else Item = "rytoj"
        or else Item = "jutri"
        or else Item = "besok"
        or else Item = "esok"
        or else Item = "ngay mai"
        or else Item = "kesho"
        or else Item = "more"
        or else Item = "holnap"
        or else Item = "zajtra"
        or else Item = B ("6DC3B472")
        or else Item = B ("6D6F726761C5AD")
        or else Item = B ("796172C4B16E") or else Item = B ("796172C4B16E")
        or else Item = B ("6DC3A2696E65")
        or else Item = B ("D0B7D0B0D0B2D182D180D0B0")
        or else Item = B ("D0B7D0B0D0B2D182D180D0B0")
        or else Item = B ("E6988EE697A5")
        or else Item = B ("EB82B4EC9DBC")
        or else Item = B ("E6988EE5A4A9")
        or else Item = B ("D8BAD8AFD98B")
        or else Item = B ("D8BAD8AFD98BD8A7")
        or else Item = B ("E0A495E0A4B2")
      then
         return "tomorrow";
      elsif Item = "yesterday" or else Item = B ("692067C3A572")
        or else Item = "gestern" or else Item = "hier" or else Item = "ayer"
        or else Item = "ieri" or else Item = "ontem" or else Item = "gisteren"
        or else Item = B ("6967C3A572") or else Item = "eilen"
        or else Item = "vakar"
        or else Item = "vceraj"
        or else Item = B ("76C48D6572616A")
        or else Item = "kemarin"
        or else Item = "semalam"
        or else Item = B ("6869657261C5AD")
        or else Item = B ("68696572C483C5AD")
        or else Item = B ("68696572C485C5AD")
        or else Item = B ("68696572C485AD")
        or else Item = "hom qua"
        or else Item = "jana"
        or else Item = "gister"
        or else Item = "tegnap"
        or else Item = "vcera"
        or else Item = "wczoraj" or else Item = B ("76C48D657261")
        or else Item = B ("64C3BC6E")
        or else Item = B ("D0B2D187D0B5D180D0B0")
        or else Item = B ("D0B2D187D0BED180D0B0")
        or else Item = B ("E698A8E697A5")
        or else Item = B ("EC96B4ECA09C")
        or else Item = B ("E698A8E5A4A9")
        or else Item = B ("D8A3D985D8B3")
      then
         return "yesterday";
      elsif Item = "nu" or else Item = "jetzt" or else Item = "maintenant"
        or else Item = "ahora" or else Item = "ora" or else Item = "agora"
        or else Item = "nyt" or else Item = "teraz" or else Item = "nyni"
        or else Item = B ("6E796EC3AD") or else Item = B ("C59F696D6469")
        or else Item = B ("D181D0B5D0B9D187D0B0D181")
        or else Item = B ("D0B7D0B0D180D0B0D0B7")
        or else Item = B ("E4BB8A")
        or else Item = B ("ECA780EAB888")
        or else Item = B ("E78EB0E59CA8")
        or else Item = B ("D8A7D984D8A2D986")
        or else Item = B ("E0A485E0A4ADE0A580")
      then
         return "now";
      elsif Starts_With (Item, "om ") or else Starts_With (Item, "dans ")
        or else Starts_With (Item, "en ") or else Starts_With (Item, "tra ")
        or else Starts_With (Item, "em ") or else Starts_With (Item, "over ")
        or else Starts_With (Item, "za ")
        or else Starts_With (Item, "po ")
        or else Starts_With (Item, "dalam ")
        or else Starts_With (Item, "post ")
        or else Starts_With (Item, "trong ")
        or else Starts_With (Item, "oor ")
        or else Starts_With (Item, "o ")
        or else Starts_With (Item, B ("C3AE6E20"))
        or else Starts_With (Item, B ("C48D657A20"))
        or else Starts_With (Item, B ("D187D0B5D180D0B5D0B720"))
        or else Starts_With (Item, B ("E5868DE8BF8720"))
        or else Starts_With (Item, B ("E38182E381A820"))
        or else Starts_With (Item, B ("D8AED984D8A7D98420"))
      then
         declare
            Space : constant Natural := Find_Substring (Item, " ");
         begin
            return "in " & Item (Space + 1 .. Item'Last);
         end;
      elsif Starts_With (Item, "dentro de ") then
         return "in " & Item (Item'First + 10 .. Item'Last);
      elsif Starts_With (Item, "baada ya ") then
         return "in " & Item (Item'First + 9 .. Item'Last);
      elsif Starts_With (Item, "ennyi ido mulva: ") then
         return "in " & Item (Item'First + 17 .. Item'Last);
      elsif Ends_With (Item, " kuluttua") then
         return "in " & Item (Item'First .. Item'Last - 9);
      elsif Ends_With (Item, " sonra") then
         return "in " & Item (Item'First .. Item'Last - 6);
      elsif Ends_With (Item, B ("20ED9B84")) then
         return "in " & Item (Item'First .. Item'Last - 4);
      elsif Ends_With (Item, B ("20E0A4ACE0A4BEE0A4A6")) then
         return "in " & Item (Item'First .. Item'Last - 10);
      elsif Starts_With (Item, "hace ") then
         return Item (Item'First + 5 .. Item'Last) & " ago";
      elsif Starts_With (Item, "il y a ") then
         return Item (Item'First + 7 .. Item'Last) & " ago";
      elsif Starts_With (Item, B ("68C3A120")) then
         return Item (Item'First + 4 .. Item'Last) & " ago";
      elsif Starts_With (Item, "vor ") then
         return Item (Item'First + 4 .. Item'Last) & " ago";
      elsif Starts_With (Item, "for ") and then Ends_With (Item, " siden") then
         return Item (Item'First + 4 .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, " siden") then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, B ("20C3AE6E2075726DC483")) then
         return Item (Item'First .. Item'Last - 9) & " ago";
      elsif Ends_With (Item, B ("2070726965C5A1")) then
         return Item (Item'First .. Item'Last - 7) & " ago";
      elsif Ends_With (Item, " nazaj") then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, " yang lalu") then
         return Item (Item'First .. Item'Last - 10) & " ago";
      elsif Ends_With (Item, " iliyopita") then
         return Item (Item'First .. Item'Last - 10) & " ago";
      elsif Ends_With (Item, B ("20616E7461C5AD65")) then
         return Item (Item'First .. Item'Last - 8) & " ago";
      elsif Ends_With (Item, " truoc") then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, " sedan") then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, " sitten") then
         return Item (Item'First .. Item'Last - 7) & " ago";
      elsif Ends_With (Item, B ("20C3B66E6365")) then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, " geleden") then
         return Item (Item'First .. Item'Last - 8) & " ago";
      elsif Ends_With (Item, " gelede") then
         return Item (Item'First .. Item'Last - 7) & " ago";
      elsif Ends_With (Item, " ezelott") then
         return Item (Item'First .. Item'Last - 8) & " ago";
      elsif Starts_With (Item, "pred ") then
         return Item (Item'First + 5 .. Item'Last) & " ago";
      elsif Ends_With (Item, " dozadu") then
         return Item (Item'First .. Item'Last - 7) & " ago";
      elsif Ends_With (Item, " temu") then
         return Item (Item'First .. Item'Last - 5) & " ago";
      elsif Ends_With (Item, " fa") then
         return Item (Item'First .. Item'Last - 3) & " ago";
      elsif Ends_With (Item, B ("20D0BDD0B0D0B7D0B0D0B4")) then
         return Item (Item'First .. Item'Last - 11) & " ago";
      elsif Ends_With (Item, B ("207A70C49B74")) then
         return Item (Item'First .. Item'Last - 6) & " ago";
      elsif Ends_With (Item, B ("20D182D0BED0BCD183")) then
         return Item (Item'First .. Item'Last - 9) & " ago";
      elsif Ends_With (Item, B ("E5898D")) then
         return Item (Item'First .. Item'Last - 3) & " ago";
      elsif Ends_With (Item, B ("20ECA084")) then
         return Item (Item'First .. Item'Last - 4) & " ago";
      elsif Ends_With (Item, B ("20D985D986D8B0")) then
         return Item (Item'First .. Item'Last - 7) & " ago";
      elsif Ends_With (Item, B ("20E0A4AAE0A4B9E0A4B2E0A587")) then
         return Item (Item'First .. Item'Last - 13) & " ago";
      else
         return Rendered_Natural_Date_Canonical (Item);
      end if;
end Canonical_Natural_Date_Text;
