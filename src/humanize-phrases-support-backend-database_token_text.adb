separate (Humanize.Phrases.Support.Backend)
function Database_Token_Text (Locale, Token : String) return String is
begin
      if Locale = "da" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "forringet";
         end if;
         if Token = "MIGRATING" then
            return "migrerer";
         end if;
         if Token = "MIGRATION" then
            return "migrering";
         end if;
         if Token = "REPLICATING" then
            return "replikerer";
         end if;
         if Token = "REPLICATION" then
            return "replikering";
         end if;
         if Token = "LAGGING" then
            return "forsinket";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "koerer";
         end if;
      elsif Locale = "es" then
         if Token = "DATABASE" then
            return "base de datos";
         end if;
         if Token = "ONLINE" then
            return "en linea";
         end if;
         if Token = "OFFLINE" then
            return "sin conexion";
         end if;
         if Token = "DEGRADED" then
            return "degradada";
         end if;
         if Token = "MIGRATING" then
            return "migrando";
         end if;
         if Token = "MIGRATION" then
            return "migracion";
         end if;
         if Token = "REPLICATING" then
            return "replicando";
         end if;
         if Token = "REPLICATION" then
            return "replicacion";
         end if;
         if Token = "LAGGING" then
            return "retrasada";
         end if;
         if Token = "BACKUP" then
            return "copia de seguridad";
         end if;
         if Token = "RUNNING" then
            return "en ejecucion";
         end if;
      elsif Locale = "it" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "degradato";
         end if;
         if Token = "MIGRATING" then
            return "migrazione";
         end if;
         if Token = "MIGRATION" then
            return "migrazione";
         end if;
         if Token = "REPLICATING" then
            return "replica";
         end if;
         if Token = "REPLICATION" then
            return "replica";
         end if;
         if Token = "LAGGING" then
            return "in ritardo";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "in corso";
         end if;
      elsif Locale = "pt" then
         if Token = "DATABASE" then
            return "banco de dados";
         end if;
         if Token = "DEGRADED" then
            return "degradado";
         end if;
         if Token = "MIGRATING" then
            return "migrando";
         end if;
         if Token = "MIGRATION" then
            return B ("6D69677261C3A7C3A36F");
         end if;
         if Token = "REPLICATING" then
            return "replicando";
         end if;
         if Token = "REPLICATION" then
            return B ("7265706C696361C3A7C3A36F");
         end if;
         if Token = "LAGGING" then
            return "atrasada";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "em execucao";
         end if;
      elsif Locale = "nl" then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "verminderd";
         end if;
         if Token = "MIGRATING" then
            return "migreert";
         end if;
         if Token = "MIGRATION" then
            return "migratie";
         end if;
         if Token = "REPLICATING" then
            return "repliceert";
         end if;
         if Token = "REPLICATION" then
            return "replicatie";
         end if;
         if Token = "LAGGING" then
            return "vertraagd";
         end if;
         if Token = "BACKUP" then
            return "back-up";
         end if;
         if Token = "RUNNING" then
            return "actief";
         end if;
      elsif Locale = "sv" or else Is_Norwegian (Locale) then
         if Token = "DATABASE" then
            return "database";
         end if;
         if Token = "DEGRADED" then
            return "nedsatt";
         end if;
         if Token = "MIGRATING" then
            return "migrerer";
         end if;
         if Token = "MIGRATION" then
            return "migrering";
         end if;
         if Token = "REPLICATING" then
            return "replikerer";
         end if;
         if Token = "REPLICATION" then
            return "replikering";
         end if;
         if Token = "LAGGING" then
            return "forsinket";
         end if;
         if Token = "BACKUP" then
            return "backup";
         end if;
         if Token = "RUNNING" then
            return "koerer";
         end if;
      elsif Locale = "fi" then
         if Token = "DATABASE" then
            return "tietokanta";
         end if;
         if Token = "DEGRADED" then
            return "heikentynyt";
         end if;
         if Token = "MIGRATING" then
            return "siirtyy";
         end if;
         if Token = "MIGRATION" then
            return "siirto";
         end if;
         if Token = "REPLICATING" then
            return "replikoi";
         end if;
         if Token = "REPLICATION" then
            return "replikointi";
         end if;
         if Token = "LAGGING" then
            return "viiveella";
         end if;
         if Token = "BACKUP" then
            return "varmuuskopio";
         end if;
         if Token = "RUNNING" then
            return "kaynnissa";
         end if;
      elsif Locale = "pl" then
         if Token = "DATABASE" then
            return "baza danych";
         end if;
         if Token = "DEGRADED" then
            return "zdegradowana";
         end if;
         if Token = "MIGRATING" then
            return "migruje";
         end if;
         if Token = "MIGRATION" then
            return "migracja";
         end if;
         if Token = "REPLICATING" then
            return "replikuje";
         end if;
         if Token = "REPLICATION" then
            return "replikacja";
         end if;
         if Token = "LAGGING" then
            return "opozniona";
         end if;
         if Token = "BACKUP" then
            return "kopia zapasowa";
         end if;
         if Token = "RUNNING" then
            return "uruchomiona";
         end if;
      elsif Locale = "cs" then
         if Token = "DATABASE" then
            return "databaze";
         end if;
         if Token = "DEGRADED" then
            return "degradovana";
         end if;
         if Token = "MIGRATING" then
            return "migruje";
         end if;
         if Token = "MIGRATION" then
            return "migrace";
         end if;
         if Token = "REPLICATING" then
            return "replikuje";
         end if;
         if Token = "REPLICATION" then
            return "replikace";
         end if;
         if Token = "LAGGING" then
            return "zpozdena";
         end if;
         if Token = "BACKUP" then
            return "zaloha";
         end if;
         if Token = "RUNNING" then
            return "bezi";
         end if;
      elsif Locale = "tr" then
         if Token = "DATABASE" then
            return "veritabani";
         end if;
         if Token = "ONLINE" then
            return "cevrimici";
         end if;
         if Token = "OFFLINE" then
            return "cevrimdisi";
         end if;
         if Token = "DEGRADED" then
            return "bozulmus";
         end if;
         if Token = "MIGRATING" then
            return "tasiniyor";
         end if;
         if Token = "MIGRATION" then
            return "tasima";
         end if;
         if Token = "REPLICATING" then
            return "cogaliyor";
         end if;
         if Token = "REPLICATION" then
            return "cogaltma";
         end if;
         if Token = "LAGGING" then
            return "gecikiyor";
         end if;
         if Token = "BACKUP" then
            return "yedekleme";
         end if;
         if Token = "RUNNING" then
            return "calisiyor";
         end if;
      elsif Locale = "ru" then
         if Token = "DATABASE" then
            return B ("D0B1D0B0D0B7D0B020D0B4D0B0D0BDD0BDD18BD185");
         end if;
         if Token = "ONLINE" then
            return B ("D0B2D0BAD0BBD18ED187D0B5D0BDD0B0");
         end if;
         if Token = "OFFLINE" then
            return B ("D0BDD0B5D0B4D0BED181D182D183D0BFD0BDD0B0");
         end if;
         if Token = "DEGRADED" then
            return B ("D0B4D0B5D0B3D180D0B0D0B4D0B8D180D0BED0B2D0B0D0BDD0B0");
         end if;
         if Token = "MIGRATING" then
            return B ("D0BCD0B8D0B3D180D0B8D180D183D0B5D182");
         end if;
         if Token = "MIGRATION" then
            return B ("D0BCD0B8D0B3D180D0B0D186D0B8D18F");
         end if;
         if Token = "REPLICATING" then
            return B ("D180D0B5D0BFD0BBD0B8D186D0B8D180D183D0B5D182D181D18F");
         end if;
         if Token = "REPLICATION" then
            return B ("D180D0B5D0BFD0BBD0B8D0BAD0B0D186D0B8D18F");
         end if;
         if Token = "LAGGING" then
            return B ("D0BED182D181D182D0B0D0B5D182");
         end if;
         if Token = "BACKUP" then
            return B
              ("D180D0B5D0B7D0B5D180D0B2D0BDD0BED0B520D0BA"
               & "D0BED0BFD0B8D180D0BED0B2D0B0D0BDD0B8D0B5");
         end if;
         if Token = "RUNNING" then
            return B ("D0B2D18BD0BFD0BED0BBD0BDD18FD0B5D182D181D18F");
         end if;
      elsif Locale = "uk" then
         if Token = "DATABASE" then
            return B ("D0B1D0B0D0B7D0B020D0B4D0B0D0BDD0B8D185");
         end if;
         if Token = "ONLINE" then
            return B ("D0B4D0BED181D182D183D0BFD0BDD0B0");
         end if;
         if Token = "OFFLINE" then
            return B ("D0BDD0B5D0B4D0BED181D182D183D0BFD0BDD0B0");
         end if;
         if Token = "DEGRADED" then
            return B ("D0B4D0B5D0B3D180D0B0D0B4D0BED0B2D0B0D0BDD0B0");
         end if;
         if Token = "MIGRATING" then
            return B ("D0BCD196D0B3D180D183D194");
         end if;
         if Token = "MIGRATION" then
            return B ("D0BCD196D0B3D180D0B0D186D196D18F");
         end if;
         if Token = "REPLICATING" then
            return B ("D180D0B5D0BFD0BBD196D0BAD183D194D182D18CD181D18F");
         end if;
         if Token = "REPLICATION" then
            return B ("D180D0B5D0BFD0BBD196D0BAD0B0D186D196D18F");
         end if;
         if Token = "LAGGING" then
            return B ("D0B2D196D0B4D181D182D0B0D194");
         end if;
         if Token = "BACKUP" then
            return B
              ("D180D0B5D0B7D0B5D180D0B2D0BDD0B520D0BA"
               & "D0BED0BFD196D18ED0B2D0B0D0BDD0BDD18F");
         end if;
         if Token = "RUNNING" then
            return B ("D0B2D0B8D0BAD0BED0BDD183D194D182D18CD181D18F");
         end if;
      elsif Locale = "ja" then
         if Token = "DATABASE" then
            return B ("E38387E383BCE382BFE38399E383BCE382B9");
         end if;
         if Token = "ONLINE" then
            return B ("E382AAE383B3E383A9E382A4E383B3");
         end if;
         if Token = "OFFLINE" then
            return B ("E382AAE38395E383A9E382A4E383B3");
         end if;
         if Token = "DEGRADED" then
            return B ("E58AA3E58C96");
         end if;
         if Token = "MIGRATING" then
            return B ("E7A7BBE8A18CE4B8AD");
         end if;
         if Token = "MIGRATION" then
            return B ("E7A7BBE8A18C");
         end if;
         if Token = "REPLICATING" then
            return B ("E383ACE38397E383AAE382B1E383BCE38388E4B8AD");
         end if;
         if Token = "REPLICATION" then
            return B ("E383ACE38397E383AAE382B1E383BCE382B7E383A7E383B3");
         end if;
         if Token = "LAGGING" then
            return B ("E98185E5BBB6");
         end if;
         if Token = "BACKUP" then
            return B ("E38390E38383E382AFE382A2E38383E38397");
         end if;
         if Token = "RUNNING" then
            return B ("E5AE9FE8A18CE4B8AD");
         end if;
      elsif Locale = "ko" then
         if Token = "DATABASE" then
            return B ("EB8DB0EC9DB4ED84B0EBB2A0EC9DB4EC8AA4");
         end if;
         if Token = "ONLINE" then
            return B ("EC98A8EB9DBCEC9DB8");
         end if;
         if Token = "OFFLINE" then
            return B ("EC98A4ED9484EB9DBCEC9DB8");
         end if;
         if Token = "DEGRADED" then
            return B ("EC8000ED9598EB90A8");
         end if;
         if Token = "MIGRATING" then
            return B ("ECA09CEC9DB4EAB7B8EBA088EC9DB4EC8598E4B8AD");
         end if;
         if Token = "MIGRATION" then
            return B ("EBA788EC9DB4EAB7B8EBA088EC9DB4EC8598");
         end if;
         if Token = "REPLICATING" then
            return B ("EBA088ED948CEB9FACEBA6ACEC9DB4ECBC80EC9DB4EC8598E4B8AD");
         end if;
         if Token = "REPLICATION" then
            return B ("EBA088ED948CEB9FACEBA6ACEC9DB4ECBC80EC9DB4EC8598");
         end if;
         if Token = "LAGGING" then
            return B ("ECA780EC97B0");
         end if;
         if Token = "BACKUP" then
            return B ("EBB0B1EC9785");
         end if;
         if Token = "RUNNING" then
            return B ("EC8BA4ED9689E4B8AD");
         end if;
      elsif Locale = "zh" then
         if Token = "DATABASE" then
            return B ("E695B0E68DAEE5BA93");
         end if;
         if Token = "ONLINE" then
            return B ("E59CA8E7BABF");
         end if;
         if Token = "OFFLINE" then
            return B ("E7A6BBE7BABF");
         end if;
         if Token = "DEGRADED" then
            return B ("E9998DE7BAA7");
         end if;
         if Token = "MIGRATING" then
            return B ("E8BF81E7A7BBE4B8AD");
         end if;
         if Token = "MIGRATION" then
            return B ("E8BF81E7A7BB");
         end if;
         if Token = "REPLICATING" then
            return B ("E5A48DE588B6E4B8AD");
         end if;
         if Token = "REPLICATION" then
            return B ("E5A48DE588B6");
         end if;
         if Token = "LAGGING" then
            return B ("E6BB9EE5908E");
         end if;
         if Token = "BACKUP" then
            return B ("E5A487E4BBBD");
         end if;
         if Token = "RUNNING" then
            return B ("E8BF90E8A18CE4B8AD");
         end if;
      elsif Locale = "ar" then
         if Token = "DATABASE" then
            return B ("D982D8A7D8B9D8AFD8A920D8A8D98AD8A7D986D8A7D8AA");
         end if;
         if Token = "ONLINE" then
            return B ("D985D8AAD8B5D984D8A9");
         end if;
         if Token = "OFFLINE" then
            return B ("D8BAD98AD8B120D985D8AAD8B5D984D8A9");
         end if;
         if Token = "DEGRADED" then
            return B ("D985D8AAD8AFD987D988D8B1D8A9");
         end if;
         if Token = "MIGRATING" then
            return B ("D982D98AD8AF20D8A7D984D8AAD8B1D8ADD98AD984");
         end if;
         if Token = "MIGRATION" then
            return B ("D8AAD8B1D8ADD98AD984");
         end if;
         if Token = "REPLICATING" then
            return B ("D982D98AD8AF20D8A7D984D986D8B3D8AE");
         end if;
         if Token = "REPLICATION" then
            return B ("D986D8B3D8AE");
         end if;
         if Token = "LAGGING" then
            return B ("D985D8AAD8A3D8AED8B1");
         end if;
         if Token = "BACKUP" then
            return B ("D986D8B3D8AE20D8A7D8ADD8AAD98AD8A7D8B7D98A");
         end if;
         if Token = "RUNNING" then
            return B ("D982D98AD8AF20D8A7D984D8AAD986D981D98AD8B0");
         end if;
      elsif Locale = "hi" then
         if Token = "DATABASE" then
            return B ("E0A4A1E0A587E0A49FE0A4BEE0A4ACE0A587E0A4B8");
         end if;
         if Token = "ONLINE" then
            return B ("E0A491E0A4A8E0A4B2E0A4BEE0A487E0A4A8");
         end if;
         if Token = "OFFLINE" then
            return B ("E0A491E0A4ABE0A4B2E0A4BEE0A487E0A4A8");
         end if;
         if Token = "DEGRADED" then
            return B ("E0A485E0A4B5E0A4A8E0A4A4");
         end if;
         if Token = "MIGRATING" then
            return B ("E0A4AAE0A58DE0A4B0E0A4B5E0A4BEE0A4B8E0A4BFE0A4A4");
         end if;
         if Token = "MIGRATION" then
            return B ("E0A4AAE0A58DE0A4B0E0A4B5E0A4BEE0A4B8");
         end if;
         if Token = "REPLICATING" then
            return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BFE0A495E0A583E0A4A4");
         end if;
         if Token = "REPLICATION" then
            return B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BFE0A495E0A583E0A4A4E0A4BF");
         end if;
         if Token = "LAGGING" then
            return B ("E0A4AAE0A580E0A49BE0A587");
         end if;
         if Token = "BACKUP" then
            return B ("E0A4ACE0A588E0A495E0A485E0A4AA");
         end if;
         if Token = "RUNNING" then
            return B ("E0A49AE0A4B2E0A4B0E0A4B9E0A4BE");
         end if;
      end if;

      return Lower (Token);
end Database_Token_Text;
