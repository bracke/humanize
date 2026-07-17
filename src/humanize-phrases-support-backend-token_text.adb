separate (Humanize.Phrases.Support.Backend)
function Token_Text (Locale, Token : String) return String is
begin
      if Token in "DATABASE" | "ONLINE" | "OFFLINE" | "DEGRADED"
        | "MIGRATING" | "MIGRATION" | "REPLICATING" | "REPLICATION"
        | "LAGGING" | "BACKUP" | "RUNNING"
      then
         return Database_Token_Text (Locale, Token);
      end if;

      if Locale = "da" then
         if Token = "EMPTY" then
            return "tom";
         end if;
         if Token = "LOADING" then
            return "indlaeser";
         end if;
         if Token = "SAVING" then
            return "gemmer";
         end if;
         if Token = "SAVED" then
            return "gemt";
         end if;
         if Token = "FAILED" then
            return "mislykket";
         end if;
         if Token = "PERMISSION" then
            return "adgang";
         end if;
         if Token = "DENIED" then
            return B ("6EC3A667746574");
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betaling";
         end if;
         if Token = "REQUIRES" then
            return B ("6B72C3A6766572");
         end if;
         if Token = "ACTION" then
            return "handling";
         end if;
      elsif Locale = "es" then
         if Token = "EMPTY" then
            return B ("766163C3AD6F");
         end if;
         if Token = "LOADING" then
            return "cargando";
         end if;
         if Token = "SAVING" then
            return "guardando";
         end if;
         if Token = "SAVED" then
            return "guardado";
         end if;
         if Token = "FAILED" then
            return "fallido";
         end if;
         if Token = "PERMISSION" then
            return "permiso";
         end if;
         if Token = "DENIED" then
            return "denegado";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "pago";
         end if;
         if Token = "REQUIRES" then
            return "requiere";
         end if;
         if Token = "ACTION" then
            return B ("61636369C3B36E");
         end if;
      elsif Locale = "it" then
         if Token = "EMPTY" then
            return "vuoto";
         end if;
         if Token = "LOADING" then
            return "caricamento";
         end if;
         if Token = "SAVING" then
            return "salvataggio";
         end if;
         if Token = "SAVED" then
            return "salvato";
         end if;
         if Token = "FAILED" then
            return "fallito";
         end if;
         if Token = "PERMISSION" then
            return "permesso";
         end if;
         if Token = "DENIED" then
            return "negato";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "pagamento";
         end if;
         if Token = "REQUIRES" then
            return "richiede";
         end if;
         if Token = "ACTION" then
            return "azione";
         end if;
      elsif Locale = "pt" then
         if Token = "EMPTY" then
            return "vazio";
         end if;
         if Token = "LOADING" then
            return "carregando";
         end if;
         if Token = "SAVING" then
            return "salvando";
         end if;
         if Token = "SAVED" then
            return "salvo";
         end if;
         if Token = "FAILED" then
            return "falhou";
         end if;
         if Token = "PERMISSION" then
            return B ("7065726D697373C3A36F");
         end if;
         if Token = "DENIED" then
            return "negada";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "pagamento";
         end if;
         if Token = "REQUIRES" then
            return "requer";
         end if;
         if Token = "ACTION" then
            return B ("61C3A7C3A36F");
         end if;
      elsif Locale = "nl" then
         if Token = "EMPTY" then
            return "leeg";
         end if;
         if Token = "LOADING" then
            return "laden";
         end if;
         if Token = "SAVING" then
            return "opslaan";
         end if;
         if Token = "SAVED" then
            return "opgeslagen";
         end if;
         if Token = "FAILED" then
            return "mislukt";
         end if;
         if Token = "PERMISSION" then
            return "toegang";
         end if;
         if Token = "DENIED" then
            return "geweigerd";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betaling";
         end if;
         if Token = "REQUIRES" then
            return "vereist";
         end if;
         if Token = "ACTION" then
            return "actie";
         end if;
      elsif Locale = "sv" then
         if Token = "EMPTY" then
            return "tom";
         end if;
         if Token = "LOADING" then
            return "laddar";
         end if;
         if Token = "SAVING" then
            return "sparar";
         end if;
         if Token = "SAVED" then
            return "sparad";
         end if;
         if Token = "FAILED" then
            return "misslyckades";
         end if;
         if Token = "PERMISSION" then
            return B ("C3A5746B6F6D7374");
         end if;
         if Token = "DENIED" then
            return "nekad";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betalning";
         end if;
         if Token = "REQUIRES" then
            return B ("6B72C3A4766572");
         end if;
         if Token = "ACTION" then
            return B ("C3A57467C3A47264");
         end if;
      elsif Is_Norwegian (Locale) then
         if Token = "EMPTY" then
            return "tom";
         end if;
         if Token = "LOADING" then
            return "laster";
         end if;
         if Token = "SAVING" then
            return "lagrer";
         end if;
         if Token = "SAVED" then
            return "lagret";
         end if;
         if Token = "FAILED" then
            return "mislyktes";
         end if;
         if Token = "PERMISSION" then
            return "tilgang";
         end if;
         if Token = "DENIED" then
            return "nektet";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "betaling";
         end if;
         if Token = "REQUIRES" then
            return "krever";
         end if;
         if Token = "ACTION" then
            return "handling";
         end if;
      elsif Locale = "fi" then
         if Token = "EMPTY" then
            return B ("7479686AC3A4");
         end if;
         if Token = "LOADING" then
            return "ladataan";
         end if;
         if Token = "SAVING" then
            return "tallennetaan";
         end if;
         if Token = "SAVED" then
            return "tallennettu";
         end if;
         if Token = "FAILED" then
            return "epaonnistui";
         end if;
         if Token = "PERMISSION" then
            return "lupa";
         end if;
         if Token = "DENIED" then
            return "estetty";
         end if;
         if Token = "PIPELINE" then
            return "putki";
         end if;
         if Token = "PAYMENT" then
            return "maksu";
         end if;
         if Token = "REQUIRES" then
            return "vaatii";
         end if;
         if Token = "ACTION" then
            return "toimen";
         end if;
      elsif Locale = "pl" then
         if Token = "EMPTY" then
            return "pusty";
         end if;
         if Token = "LOADING" then
            return "ladowanie";
         end if;
         if Token = "SAVING" then
            return "zapisywanie";
         end if;
         if Token = "SAVED" then
            return "zapisano";
         end if;
         if Token = "FAILED" then
            return "niepowodzenie";
         end if;
         if Token = "PERMISSION" then
            return "uprawnienie";
         end if;
         if Token = "DENIED" then
            return "odmowa";
         end if;
         if Token = "PIPELINE" then
            return "potok";
         end if;
         if Token = "PAYMENT" then
            return B ("70C58261746E6FC59BC487");
         end if;
         if Token = "REQUIRES" then
            return "wymaga";
         end if;
         if Token = "ACTION" then
            return "dzialania";
         end if;
      elsif Locale = "cs" then
         if Token = "EMPTY" then
            return B ("7072C3A17A646EC3BD");
         end if;
         if Token = "LOADING" then
            return B ("6E61C48D6974C3A16EC3AD");
         end if;
         if Token = "SAVING" then
            return B ("756B6CC3A164C3A16EC3AD");
         end if;
         if Token = "SAVED" then
            return B ("756C6FC5BE656E6F");
         end if;
         if Token = "FAILED" then
            return "selhalo";
         end if;
         if Token = "PERMISSION" then
            return B ("6F7072C3A1766EC49B6EC3AD");
         end if;
         if Token = "DENIED" then
            return "odmitnuto";
         end if;
         if Token = "PIPELINE" then
            return "pipeline";
         end if;
         if Token = "PAYMENT" then
            return "platba";
         end if;
         if Token = "REQUIRES" then
            return B ("7679C5BE6164756A65");
         end if;
         if Token = "ACTION" then
            return "akci";
         end if;
      elsif Locale = "tr" then
         if Token = "EMPTY" then
            return B ("626FC59F");
         end if;
         if Token = "LOADING" then
            return B ("79C3BC6B6C656E69796F72");
         end if;
         if Token = "SAVING" then
            return "kaydediliyor";
         end if;
         if Token = "SAVED" then
            return "kaydedildi";
         end if;
         if Token = "FAILED" then
            return B ("6261C59F6172C4B173C4B17A");
         end if;
         if Token = "PERMISSION" then
            return "izin";
         end if;
         if Token = "DENIED" then
            return "reddedildi";
         end if;
         if Token = "PIPELINE" then
            return "hat";
         end if;
         if Token = "PAYMENT" then
            return B ("C3B664656D65");
         end if;
         if Token = "REQUIRES" then
            return "gerektirir";
         end if;
         if Token = "ACTION" then
            return "eylem";
         end if;
      elsif Locale = "ru" then
         if Token = "EMPTY" then
            return B ("D0BFD183D181D182D0BE");
         end if;
         if Token = "LOADING" then
            return B ("D0B7D0B0D0B3D180D183D0B7D0BAD0B0");
         end if;
         if Token = "SAVING" then
            return B ("D181D0BED185D180D0B0D0BDD0B5D0BDD0B8D0B5");
         end if;
         if Token = "SAVED" then
            return B ("D181D0BED185D180D0B0D0BDD0B5D0BDD0BE");
         end if;
         if Token = "FAILED" then
            return B ("D181D0B1D0BED0B9");
         end if;
         if Token = "PERMISSION" then
            return B ("D0B4D0BED181D182D183D0BF");
         end if;
         if Token = "DENIED" then
            return B ("D0B7D0B0D0BFD180D0B5D189D0B5D0BD");
         end if;
         if Token = "PIPELINE" then
            return B ("D0BAD0BED0BDD0B2D0B5D0B9D0B5D180");
         end if;
         if Token = "PAYMENT" then
            return B ("D0BFD0BBD0B0D182D0B5D0B6");
         end if;
         if Token = "REQUIRES" then
            return B ("D182D180D0B5D0B1D183D0B5D182");
         end if;
         if Token = "ACTION" then
            return B ("D0B4D0B5D0B9D181D182D0B2D0B8D0B5");
         end if;
      elsif Locale = "uk" then
         if Token = "EMPTY" then
            return B ("D0BFD183D181D182D0BE");
         end if;
         if Token = "LOADING" then
            return B ("D0B7D0B0D0B2D0B0D0BDD182D0B0D0B6D0B5D0BDD0BDD18F");
         end if;
         if Token = "SAVING" then
            return B ("D0B7D0B1D0B5D180D0B5D0B6D0B5D0BDD0BDD18F");
         end if;
         if Token = "SAVED" then
            return B ("D0B7D0B1D0B5D180D0B5D0B6D0B5D0BDD0BE");
         end if;
         if Token = "FAILED" then
            return B ("D0B7D0B1D196D0B9");
         end if;
         if Token = "PERMISSION" then
            return B ("D0B4D0BED181D182D183D0BF");
         end if;
         if Token = "DENIED" then
            return B ("D0B7D0B0D0B1D0BED180D0BED0BDD0B5D0BDD0BE");
         end if;
         if Token = "PIPELINE" then
            return B ("D0BAD0BED0BDD0B2D0B5D194D180");
         end if;
         if Token = "PAYMENT" then
            return B ("D0BFD0BBD0B0D182D196D0B6");
         end if;
         if Token = "REQUIRES" then
            return B ("D0BFD0BED182D180D0B5D0B1D183D194");
         end if;
         if Token = "ACTION" then
            return B ("D0B4D196D197");
         end if;
      elsif Locale = "ja" then
         if Token = "EMPTY" then
            return B ("E7A9BA");
         end if;
         if Token = "LOADING" then
            return B ("E8AAADE381BFE8BEBCE381BFE4B8AD");
         end if;
         if Token = "SAVING" then
            return B ("E4BF9DE5AD98E4B8AD");
         end if;
         if Token = "SAVED" then
            return B ("E4BF9DE5AD98E6B888E381BF");
         end if;
         if Token = "FAILED" then
            return B ("E5A4B1E69597");
         end if;
         if Token = "PERMISSION" then
            return B ("E6A8A9E99990");
         end if;
         if Token = "DENIED" then
            return B ("E68B92E590A6");
         end if;
         if Token = "PIPELINE" then
            return B ("E38391E382A4E38397E383A9E382A4E383B3");
         end if;
         if Token = "PAYMENT" then
            return B ("E694AFE68995E38184");
         end if;
         if Token = "REQUIRES" then
            return B ("E8A681");
         end if;
         if Token = "ACTION" then
            return B ("E5AFBEE5BF9C");
         end if;
      elsif Locale = "ko" then
         if Token = "EMPTY" then
            return B ("EBB984EC9684EC9E88EC9D8C");
         end if;
         if Token = "LOADING" then
            return B ("EBA19CEB939CE4B8AD");
         end if;
         if Token = "SAVING" then
            return B ("ECB880EC9EA5E4B8AD");
         end if;
         if Token = "SAVED" then
            return B ("ECB880EC9EA5EB90A8");
         end if;
         if Token = "FAILED" then
            return B ("EC8BA4ED8CA8");
         end if;
         if Token = "PERMISSION" then
            return B ("EAB68CEB8F84");
         end if;
         if Token = "DENIED" then
            return B ("EAB1B0EBB680EB90A8");
         end if;
         if Token = "PIPELINE" then
            return B ("ED8C8CEC9DB4ED948CEB9DBC");
         end if;
         if Token = "PAYMENT" then
            return B ("EAB2B0ECA09C");
         end if;
         if Token = "REQUIRES" then
            return B ("ED9584EC9A94");
         end if;
         if Token = "ACTION" then
            return B ("ECA791EC9785");
         end if;
      elsif Locale = "zh" then
         if Token = "EMPTY" then
            return B ("E7A9BA");
         end if;
         if Token = "LOADING" then
            return B ("E58AA0E8BDBDE4B8AD");
         end if;
         if Token = "SAVING" then
            return B ("E4BF9DE5AD98E4B8AD");
         end if;
         if Token = "SAVED" then
            return B ("E5B7B2E4BF9DE5AD98");
         end if;
         if Token = "FAILED" then
            return B ("E5A4B1E8B4A5");
         end if;
         if Token = "PERMISSION" then
            return B ("E69D83E99990");
         end if;
         if Token = "DENIED" then
            return B ("E8A2ABE68B92");
         end if;
         if Token = "PIPELINE" then
            return B ("E6B581E6B0B4E7BABF");
         end if;
         if Token = "PAYMENT" then
            return B ("E694AFE4BB98");
         end if;
         if Token = "REQUIRES" then
            return B ("E99C80E8A681");
         end if;
         if Token = "ACTION" then
            return B ("E6938DE4BD9C");
         end if;
      elsif Locale = "ar" then
         if Token = "EMPTY" then
            return B ("D981D8A7D8B1D8BA");
         end if;
         if Token = "LOADING" then
            return B ("D8ACD8A7D8B120D8A7D984D8AAD8ADD985D98AD984");
         end if;
         if Token = "SAVING" then
            return B ("D8ACD8A7D8B120D8A7D984D8ADD981D8B8");
         end if;
         if Token = "SAVED" then
            return B ("D985D8ADD981D988D8B8");
         end if;
         if Token = "FAILED" then
            return B ("D981D8B4D984");
         end if;
         if Token = "PERMISSION" then
            return B ("D8A5D8B0D986");
         end if;
         if Token = "DENIED" then
            return B ("D985D8B1D981D988D8B6");
         end if;
         if Token = "PIPELINE" then
            return B ("D8AED8B720D8A7D984D8AAD986D981D98AD8B0");
         end if;
         if Token = "PAYMENT" then
            return B ("D8AFD981D8B9");
         end if;
         if Token = "REQUIRES" then
            return B ("D98AD8AAD8B7D984D8A8");
         end if;
         if Token = "ACTION" then
            return B ("D8A5D8ACD8B1D8A7D8A1");
         end if;
      elsif Locale = "hi" then
         if Token = "EMPTY" then
            return B ("E0A496E0A4BEE0A4B2E0A580");
         end if;
         if Token = "LOADING" then
            return B ("E0A4B2E0A58BE0A4A120E0A4B9E0A58B20E0A4B0E0A4B9E0A4BE");
         end if;
         if Token = "SAVING" then
            return B ("E0A4B8E0A4B9E0A587E0A49CE0A4BE20E0A49CE0A4BE20E0A4B0E0A4B9E0A4BE");
         end if;
         if Token = "SAVED" then
            return B ("E0A4B8E0A4B9E0A587E0A49CE0A4BE20E0A497E0A4AFE0A4BE");
         end if;
         if Token = "FAILED" then
            return B ("E0A485E0A4B8E0A4ABE0A4B2");
         end if;
         if Token = "PERMISSION" then
            return B ("E0A485E0A4A8E0A581E0A4AEE0A4A4E0A4BF");
         end if;
         if Token = "DENIED" then
            return B ("E0A485E0A4B8E0A58DE0A4B5E0A580E0A495E0A583E0A4A4");
         end if;
         if Token = "PIPELINE" then
            return B ("E0A4AAE0A4BEE0A487E0A4AAE0A4B2E0A4BEE0A487E0A4A8");
         end if;
         if Token = "PAYMENT" then
            return B ("E0A4ADE0A581E0A497E0A4A4E0A4BEE0A4A8");
         end if;
         if Token = "REQUIRES" then
            return B ("E0A486E0A4B5E0A4B6E0A58DE0A4AFE0A495");
         end if;
         if Token = "ACTION" then
            return B ("E0A495E0A4BEE0A4B0E0A58DE0A4B0E0A4B5E0A4BEE0A488");
         end if;
      end if;

      return Lower (Token);
end Token_Text;
