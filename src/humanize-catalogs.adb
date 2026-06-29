package body Humanize.Catalogs is

   LF : constant String := [1 => ASCII.LF];

   --  UTF-8 byte sequence for the Danish letter 'å' (U+00E5). Written as
   --  explicit bytes so the catalog is UTF-8 regardless of how the compiler
   --  interprets the source encoding for String literals.
   AA : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);

   --  UTF-8 byte sequence for the French letter 'e' with grave accent (U+00E8).
   EGRAVE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);

   --  UTF-8 byte sequences for Spanish/Italian letters: 'n' tilde (U+00F1),
   --  'i' acute (U+00ED), and the masculine ordinal indicator (U+00BA).
   NTILDE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B1#);
   IACUTE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AD#);
   OACUTE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);
   ORDM   : constant String :=
     Character'Val (16#C2#) & Character'Val (16#BA#);
   --  Feminine ordinal indicator (U+00AA).
   FEMORD : constant String :=
     Character'Val (16#C2#) & Character'Val (16#AA#);

   --  English catalog fragment. Catalog values are unquoted; i18n trims the
   --  text after the first '=' separator.
   English : constant String :=
     "en.humanize.datetime.now = now" & LF
     & "en.humanize.datetime.day.previous = yesterday" & LF
     & "en.humanize.datetime.day.current = today" & LF
     & "en.humanize.datetime.day.next = tomorrow" & LF
     & "en.humanize.datetime.relative.second.past = "
     & "{count, plural, one {{value} second ago} other {{value} seconds ago}}" & LF
     & "en.humanize.datetime.relative.second.future = "
     & "{count, plural, one {in {value} second} other {in {value} seconds}}" & LF
     & "en.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {{value} minute ago} other {{value} minutes ago}}" & LF
     & "en.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {in {value} minute} other {in {value} minutes}}" & LF
     & "en.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {{value} hour ago} other {{value} hours ago}}" & LF
     & "en.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {in {value} hour} other {in {value} hours}}" & LF
     & "en.humanize.datetime.relative.day.past = "
     & "{count, plural, one {{value} day ago} other {{value} days ago}}" & LF
     & "en.humanize.datetime.relative.day.future = "
     & "{count, plural, one {in {value} day} other {in {value} days}}" & LF
     & "en.humanize.datetime.relative.week.past = "
     & "{count, plural, one {{value} week ago} other {{value} weeks ago}}" & LF
     & "en.humanize.datetime.relative.week.future = "
     & "{count, plural, one {in {value} week} other {in {value} weeks}}" & LF
     & "en.humanize.datetime.relative.month.past = "
     & "{count, plural, one {{value} month ago} other {{value} months ago}}" & LF
     & "en.humanize.datetime.relative.month.future = "
     & "{count, plural, one {in {value} month} other {in {value} months}}" & LF
     & "en.humanize.datetime.relative.year.past = "
     & "{count, plural, one {{value} year ago} other {{value} years ago}}" & LF
     & "en.humanize.datetime.relative.year.future = "
     & "{count, plural, one {in {value} year} other {in {value} years}}" & LF
     & "en.humanize.duration.unit.second = "
     & "{count, plural, one {{value} second} other {{value} seconds}}" & LF
     & "en.humanize.duration.unit.minute = "
     & "{count, plural, one {{value} minute} other {{value} minutes}}" & LF
     & "en.humanize.duration.unit.hour = "
     & "{count, plural, one {{value} hour} other {{value} hours}}" & LF
     & "en.humanize.duration.unit.day = "
     & "{count, plural, one {{value} day} other {{value} days}}" & LF
     & "en.humanize.bytes.byte = "
     & "{count, plural, one {{value} byte} other {{value} bytes}}" & LF
     & "en.humanize.bytes.kb = {value} kB" & LF
     & "en.humanize.bytes.mb = {value} MB" & LF
     & "en.humanize.bytes.gb = {value} GB" & LF
     & "en.humanize.bytes.tb = {value} TB" & LF
     & "en.humanize.bytes.kib = {value} KiB" & LF
     & "en.humanize.bytes.mib = {value} MiB" & LF
     & "en.humanize.bytes.gib = {value} GiB" & LF
     & "en.humanize.bytes.tib = {value} TiB" & LF
     & "en.humanize.number.ordinal = "
     & "{count, selectordinal, one {{value}st} two {{value}nd} few {{value}rd} other {{value}th}}" & LF
     & "en.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, one {{value}st} two {{value}nd} few {{value}rd} other {{value}th}}" & LF
     & "en.humanize.number.compact.plain = {value}" & LF
     & "en.humanize.number.compact.thousand = {value}K" & LF
     & "en.humanize.number.compact.million = {value}M" & LF
     & "en.humanize.number.compact.billion = {value}B" & LF
     & "en.humanize.number.compact.trillion = {value}T" & LF
     & "en.humanize.unit.meter = "
     & "{count, plural, one {{value} meter} other {{value} meters}}" & LF
     & "en.humanize.unit.kilometer = "
     & "{count, plural, one {{value} kilometer} other {{value} kilometers}}" & LF
     & "en.humanize.unit.gram = "
     & "{count, plural, one {{value} gram} other {{value} grams}}" & LF
     & "en.humanize.unit.kilogram = "
     & "{count, plural, one {{value} kilogram} other {{value} kilograms}}" & LF
     & "en.humanize.unit.liter = "
     & "{count, plural, one {{value} liter} other {{value} liters}}" & LF
     & "en.humanize.list.and = and" & LF;

   --  Danish catalog fragment. 'å' is spliced via AA to keep UTF-8 output.
   Danish : constant String :=
     "da.humanize.datetime.now = nu" & LF
     & "da.humanize.datetime.day.previous = i g" & AA & "r" & LF
     & "da.humanize.datetime.day.current = i dag" & LF
     & "da.humanize.datetime.day.next = i morgen" & LF
     & "da.humanize.datetime.relative.second.past = "
     & "{count, plural, one {for {value} sekund siden} "
     & "other {for {value} sekunder siden}}" & LF
     & "da.humanize.datetime.relative.second.future = "
     & "{count, plural, one {om {value} sekund} other {om {value} sekunder}}" & LF
     & "da.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {for {value} minut siden} "
     & "other {for {value} minutter siden}}" & LF
     & "da.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {om {value} minut} other {om {value} minutter}}" & LF
     & "da.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {for {value} time siden} other {for {value} timer siden}}" & LF
     & "da.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {om {value} time} other {om {value} timer}}" & LF
     & "da.humanize.datetime.relative.day.past = "
     & "{count, plural, one {for {value} dag siden} other {for {value} dage siden}}" & LF
     & "da.humanize.datetime.relative.day.future = "
     & "{count, plural, one {om {value} dag} other {om {value} dage}}" & LF
     & "da.humanize.datetime.relative.week.past = "
     & "{count, plural, one {for {value} uge siden} other {for {value} uger siden}}" & LF
     & "da.humanize.datetime.relative.week.future = "
     & "{count, plural, one {om {value} uge} other {om {value} uger}}" & LF
     & "da.humanize.datetime.relative.month.past = "
     & "{count, plural, one {for {value} m" & AA & "ned siden} "
     & "other {for {value} m" & AA & "neder siden}}" & LF
     & "da.humanize.datetime.relative.month.future = "
     & "{count, plural, one {om {value} m" & AA & "ned} "
     & "other {om {value} m" & AA & "neder}}" & LF
     & "da.humanize.datetime.relative.year.past = "
     & "{count, plural, one {for {value} " & AA & "r siden} "
     & "other {for {value} " & AA & "r siden}}" & LF
     & "da.humanize.datetime.relative.year.future = "
     & "{count, plural, one {om {value} " & AA & "r} other {om {value} " & AA & "r}}" & LF
     & "da.humanize.duration.unit.second = "
     & "{count, plural, one {{value} sekund} other {{value} sekunder}}" & LF
     & "da.humanize.duration.unit.minute = "
     & "{count, plural, one {{value} minut} other {{value} minutter}}" & LF
     & "da.humanize.duration.unit.hour = "
     & "{count, plural, one {{value} time} other {{value} timer}}" & LF
     & "da.humanize.duration.unit.day = "
     & "{count, plural, one {{value} dag} other {{value} dage}}" & LF
     & "da.humanize.bytes.byte = "
     & "{count, plural, one {{value} byte} other {{value} bytes}}" & LF
     & "da.humanize.bytes.kb = {value} kB" & LF
     & "da.humanize.bytes.mb = {value} MB" & LF
     & "da.humanize.bytes.gb = {value} GB" & LF
     & "da.humanize.bytes.tb = {value} TB" & LF
     & "da.humanize.bytes.kib = {value} KiB" & LF
     & "da.humanize.bytes.mib = {value} MiB" & LF
     & "da.humanize.bytes.gib = {value} GiB" & LF
     & "da.humanize.bytes.tib = {value} TiB" & LF
     & "da.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value}.}}" & LF
     & "da.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value}.}}" & LF
     & "da.humanize.number.compact.plain = {value}" & LF
     & "da.humanize.number.compact.thousand = {value} t" & LF
     & "da.humanize.number.compact.million = {value} mio." & LF
     & "da.humanize.number.compact.billion = {value} mia." & LF
     & "da.humanize.number.compact.trillion = {value} bio." & LF
     & "da.humanize.unit.meter = "
     & "{count, plural, one {{value} meter} other {{value} meter}}" & LF
     & "da.humanize.unit.kilometer = "
     & "{count, plural, one {{value} kilometer} other {{value} kilometer}}" & LF
     & "da.humanize.unit.gram = "
     & "{count, plural, one {{value} gram} other {{value} gram}}" & LF
     & "da.humanize.unit.kilogram = "
     & "{count, plural, one {{value} kilogram} other {{value} kilogram}}" & LF
     & "da.humanize.unit.liter = "
     & "{count, plural, one {{value} liter} other {{value} liter}}" & LF
     & "da.humanize.list.and = og" & LF;

   --  German catalog fragment (pure ASCII: no umlauts in these words).
   German : constant String :=
     "de.humanize.datetime.now = jetzt" & LF
     & "de.humanize.datetime.day.previous = gestern" & LF
     & "de.humanize.datetime.day.current = heute" & LF
     & "de.humanize.datetime.day.next = morgen" & LF
     & "de.humanize.datetime.relative.second.past = "
     & "{count, plural, one {vor {value} Sekunde} other {vor {value} Sekunden}}" & LF
     & "de.humanize.datetime.relative.second.future = "
     & "{count, plural, one {in {value} Sekunde} other {in {value} Sekunden}}" & LF
     & "de.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {vor {value} Minute} other {vor {value} Minuten}}" & LF
     & "de.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {in {value} Minute} other {in {value} Minuten}}" & LF
     & "de.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {vor {value} Stunde} other {vor {value} Stunden}}" & LF
     & "de.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {in {value} Stunde} other {in {value} Stunden}}" & LF
     & "de.humanize.datetime.relative.day.past = "
     & "{count, plural, one {vor {value} Tag} other {vor {value} Tagen}}" & LF
     & "de.humanize.datetime.relative.day.future = "
     & "{count, plural, one {in {value} Tag} other {in {value} Tagen}}" & LF
     & "de.humanize.datetime.relative.week.past = "
     & "{count, plural, one {vor {value} Woche} other {vor {value} Wochen}}" & LF
     & "de.humanize.datetime.relative.week.future = "
     & "{count, plural, one {in {value} Woche} other {in {value} Wochen}}" & LF
     & "de.humanize.datetime.relative.month.past = "
     & "{count, plural, one {vor {value} Monat} other {vor {value} Monaten}}" & LF
     & "de.humanize.datetime.relative.month.future = "
     & "{count, plural, one {in {value} Monat} other {in {value} Monaten}}" & LF
     & "de.humanize.datetime.relative.year.past = "
     & "{count, plural, one {vor {value} Jahr} other {vor {value} Jahren}}" & LF
     & "de.humanize.datetime.relative.year.future = "
     & "{count, plural, one {in {value} Jahr} other {in {value} Jahren}}" & LF
     & "de.humanize.duration.unit.second = "
     & "{count, plural, one {{value} Sekunde} other {{value} Sekunden}}" & LF
     & "de.humanize.duration.unit.minute = "
     & "{count, plural, one {{value} Minute} other {{value} Minuten}}" & LF
     & "de.humanize.duration.unit.hour = "
     & "{count, plural, one {{value} Stunde} other {{value} Stunden}}" & LF
     & "de.humanize.duration.unit.day = "
     & "{count, plural, one {{value} Tag} other {{value} Tage}}" & LF
     & "de.humanize.bytes.byte = "
     & "{count, plural, one {{value} Byte} other {{value} Bytes}}" & LF
     & "de.humanize.bytes.kb = {value} kB" & LF
     & "de.humanize.bytes.mb = {value} MB" & LF
     & "de.humanize.bytes.gb = {value} GB" & LF
     & "de.humanize.bytes.tb = {value} TB" & LF
     & "de.humanize.bytes.kib = {value} KiB" & LF
     & "de.humanize.bytes.mib = {value} MiB" & LF
     & "de.humanize.bytes.gib = {value} GiB" & LF
     & "de.humanize.bytes.tib = {value} TiB" & LF
     & "de.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value}.}}" & LF
     & "de.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value}.}}" & LF
     & "de.humanize.number.compact.plain = {value}" & LF
     & "de.humanize.number.compact.thousand = {value} Tsd." & LF
     & "de.humanize.number.compact.million = {value} Mio." & LF
     & "de.humanize.number.compact.billion = {value} Mrd." & LF
     & "de.humanize.number.compact.trillion = {value} Bio." & LF
     & "de.humanize.unit.meter = "
     & "{count, plural, one {{value} Meter} other {{value} Meter}}" & LF
     & "de.humanize.unit.kilometer = "
     & "{count, plural, one {{value} Kilometer} other {{value} Kilometer}}" & LF
     & "de.humanize.unit.gram = "
     & "{count, plural, one {{value} Gramm} other {{value} Gramm}}" & LF
     & "de.humanize.unit.kilogram = "
     & "{count, plural, one {{value} Kilogramm} other {{value} Kilogramm}}" & LF
     & "de.humanize.unit.liter = "
     & "{count, plural, one {{value} Liter} other {{value} Liter}}" & LF
     & "de.humanize.list.and = und" & LF;

   --  French catalog fragment (pure ASCII; French plural "one" covers 0 and 1).
   --  "byte" is "octet"; unit symbols stay international (kB/KiB).
   French : constant String :=
     "fr.humanize.datetime.now = maintenant" & LF
     & "fr.humanize.datetime.day.previous = hier" & LF
     & "fr.humanize.datetime.day.current = aujourd'hui" & LF
     & "fr.humanize.datetime.day.next = demain" & LF
     & "fr.humanize.datetime.relative.second.past = "
     & "{count, plural, one {il y a {value} seconde} "
     & "other {il y a {value} secondes}}" & LF
     & "fr.humanize.datetime.relative.second.future = "
     & "{count, plural, one {dans {value} seconde} other {dans {value} secondes}}" & LF
     & "fr.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {il y a {value} minute} other {il y a {value} minutes}}" & LF
     & "fr.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {dans {value} minute} other {dans {value} minutes}}" & LF
     & "fr.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {il y a {value} heure} other {il y a {value} heures}}" & LF
     & "fr.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {dans {value} heure} other {dans {value} heures}}" & LF
     & "fr.humanize.datetime.relative.day.past = "
     & "{count, plural, one {il y a {value} jour} other {il y a {value} jours}}" & LF
     & "fr.humanize.datetime.relative.day.future = "
     & "{count, plural, one {dans {value} jour} other {dans {value} jours}}" & LF
     & "fr.humanize.datetime.relative.week.past = "
     & "{count, plural, one {il y a {value} semaine} "
     & "other {il y a {value} semaines}}" & LF
     & "fr.humanize.datetime.relative.week.future = "
     & "{count, plural, one {dans {value} semaine} other {dans {value} semaines}}" & LF
     & "fr.humanize.datetime.relative.month.past = "
     & "{count, plural, one {il y a {value} mois} other {il y a {value} mois}}" & LF
     & "fr.humanize.datetime.relative.month.future = "
     & "{count, plural, one {dans {value} mois} other {dans {value} mois}}" & LF
     & "fr.humanize.datetime.relative.year.past = "
     & "{count, plural, one {il y a {value} an} other {il y a {value} ans}}" & LF
     & "fr.humanize.datetime.relative.year.future = "
     & "{count, plural, one {dans {value} an} other {dans {value} ans}}" & LF
     & "fr.humanize.duration.unit.second = "
     & "{count, plural, one {{value} seconde} other {{value} secondes}}" & LF
     & "fr.humanize.duration.unit.minute = "
     & "{count, plural, one {{value} minute} other {{value} minutes}}" & LF
     & "fr.humanize.duration.unit.hour = "
     & "{count, plural, one {{value} heure} other {{value} heures}}" & LF
     & "fr.humanize.duration.unit.day = "
     & "{count, plural, one {{value} jour} other {{value} jours}}" & LF
     & "fr.humanize.bytes.byte = "
     & "{count, plural, one {{value} octet} other {{value} octets}}" & LF
     & "fr.humanize.bytes.kb = {value} kB" & LF
     & "fr.humanize.bytes.mb = {value} MB" & LF
     & "fr.humanize.bytes.gb = {value} GB" & LF
     & "fr.humanize.bytes.tb = {value} TB" & LF
     & "fr.humanize.bytes.kib = {value} KiB" & LF
     & "fr.humanize.bytes.mib = {value} MiB" & LF
     & "fr.humanize.bytes.gib = {value} GiB" & LF
     & "fr.humanize.bytes.tib = {value} TiB" & LF
     & "fr.humanize.number.ordinal = "
     & "{count, selectordinal, one {{value}er} other {{value}e}}" & LF
     & "fr.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, one {{value}re} other {{value}e}}" & LF
     & "fr.humanize.number.compact.plain = {value}" & LF
     & "fr.humanize.number.compact.thousand = {value} k" & LF
     & "fr.humanize.number.compact.million = {value} M" & LF
     & "fr.humanize.number.compact.billion = {value} Md" & LF
     & "fr.humanize.number.compact.trillion = {value} Bn" & LF
     & "fr.humanize.unit.meter = "
     & "{count, plural, one {{value} m" & EGRAVE & "tre} "
     & "other {{value} m" & EGRAVE & "tres}}" & LF
     & "fr.humanize.unit.kilometer = "
     & "{count, plural, one {{value} kilom" & EGRAVE & "tre} "
     & "other {{value} kilom" & EGRAVE & "tres}}" & LF
     & "fr.humanize.unit.gram = "
     & "{count, plural, one {{value} gramme} other {{value} grammes}}" & LF
     & "fr.humanize.unit.kilogram = "
     & "{count, plural, one {{value} kilogramme} "
     & "other {{value} kilogrammes}}" & LF
     & "fr.humanize.unit.liter = "
     & "{count, plural, one {{value} litre} other {{value} litres}}" & LF
     & "fr.humanize.list.and = et" & LF;

   --  Spanish catalog fragment. 'n'-tilde, 'i'/'o'-acute and the ordinal
   --  indicator are spliced as UTF-8 bytes.
   Spanish : constant String :=
     "es.humanize.datetime.now = ahora" & LF
     & "es.humanize.datetime.day.previous = ayer" & LF
     & "es.humanize.datetime.day.current = hoy" & LF
     & "es.humanize.datetime.day.next = ma" & NTILDE & "ana" & LF
     & "es.humanize.datetime.relative.second.past = "
     & "{count, plural, one {hace {value} segundo} "
     & "other {hace {value} segundos}}" & LF
     & "es.humanize.datetime.relative.second.future = "
     & "{count, plural, one {dentro de {value} segundo} "
     & "other {dentro de {value} segundos}}" & LF
     & "es.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {hace {value} minuto} "
     & "other {hace {value} minutos}}" & LF
     & "es.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {dentro de {value} minuto} "
     & "other {dentro de {value} minutos}}" & LF
     & "es.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {hace {value} hora} "
     & "other {hace {value} horas}}" & LF
     & "es.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {dentro de {value} hora} "
     & "other {dentro de {value} horas}}" & LF
     & "es.humanize.datetime.relative.day.past = "
     & "{count, plural, one {hace {value} d" & IACUTE & "a} "
     & "other {hace {value} d" & IACUTE & "as}}" & LF
     & "es.humanize.datetime.relative.day.future = "
     & "{count, plural, one {dentro de {value} d" & IACUTE & "a} "
     & "other {dentro de {value} d" & IACUTE & "as}}" & LF
     & "es.humanize.datetime.relative.week.past = "
     & "{count, plural, one {hace {value} semana} "
     & "other {hace {value} semanas}}" & LF
     & "es.humanize.datetime.relative.week.future = "
     & "{count, plural, one {dentro de {value} semana} "
     & "other {dentro de {value} semanas}}" & LF
     & "es.humanize.datetime.relative.month.past = "
     & "{count, plural, one {hace {value} mes} "
     & "other {hace {value} meses}}" & LF
     & "es.humanize.datetime.relative.month.future = "
     & "{count, plural, one {dentro de {value} mes} "
     & "other {dentro de {value} meses}}" & LF
     & "es.humanize.datetime.relative.year.past = "
     & "{count, plural, one {hace {value} a" & NTILDE & "o} "
     & "other {hace {value} a" & NTILDE & "os}}" & LF
     & "es.humanize.datetime.relative.year.future = "
     & "{count, plural, one {dentro de {value} a" & NTILDE & "o} "
     & "other {dentro de {value} a" & NTILDE & "os}}" & LF
     & "es.humanize.duration.unit.second = "
     & "{count, plural, one {{value} segundo} other {{value} segundos}}" & LF
     & "es.humanize.duration.unit.minute = "
     & "{count, plural, one {{value} minuto} other {{value} minutos}}" & LF
     & "es.humanize.duration.unit.hour = "
     & "{count, plural, one {{value} hora} other {{value} horas}}" & LF
     & "es.humanize.duration.unit.day = "
     & "{count, plural, one {{value} d" & IACUTE & "a} "
     & "other {{value} d" & IACUTE & "as}}" & LF
     & "es.humanize.bytes.byte = "
     & "{count, plural, one {{value} byte} other {{value} bytes}}" & LF
     & "es.humanize.bytes.kb = {value} kB" & LF
     & "es.humanize.bytes.mb = {value} MB" & LF
     & "es.humanize.bytes.gb = {value} GB" & LF
     & "es.humanize.bytes.tb = {value} TB" & LF
     & "es.humanize.bytes.kib = {value} KiB" & LF
     & "es.humanize.bytes.mib = {value} MiB" & LF
     & "es.humanize.bytes.gib = {value} GiB" & LF
     & "es.humanize.bytes.tib = {value} TiB" & LF
     & "es.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value}." & ORDM & "}}" & LF
     & "es.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value}." & FEMORD & "}}" & LF
     & "es.humanize.number.compact.plain = {value}" & LF
     & "es.humanize.number.compact.thousand = {value} mil" & LF
     & "es.humanize.number.compact.million = {value} M" & LF
     & "es.humanize.number.compact.billion = {value} mil M" & LF
     & "es.humanize.number.compact.trillion = {value} B" & LF
     & "es.humanize.unit.meter = "
     & "{count, plural, one {{value} metro} other {{value} metros}}" & LF
     & "es.humanize.unit.kilometer = "
     & "{count, plural, one {{value} kil" & OACUTE & "metro} "
     & "other {{value} kil" & OACUTE & "metros}}" & LF
     & "es.humanize.unit.gram = "
     & "{count, plural, one {{value} gramo} other {{value} gramos}}" & LF
     & "es.humanize.unit.kilogram = "
     & "{count, plural, one {{value} kilogramo} other {{value} kilogramos}}" & LF
     & "es.humanize.unit.liter = "
     & "{count, plural, one {{value} litro} other {{value} litros}}" & LF
     & "es.humanize.list.and = y" & LF;

   --  Italian catalog fragment (the ordinal indicator is spliced as UTF-8).
   Italian : constant String :=
     "it.humanize.datetime.now = adesso" & LF
     & "it.humanize.datetime.day.previous = ieri" & LF
     & "it.humanize.datetime.day.current = oggi" & LF
     & "it.humanize.datetime.day.next = domani" & LF
     & "it.humanize.datetime.relative.second.past = "
     & "{count, plural, one {{value} secondo fa} other {{value} secondi fa}}"
     & LF
     & "it.humanize.datetime.relative.second.future = "
     & "{count, plural, one {tra {value} secondo} other {tra {value} secondi}}"
     & LF
     & "it.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {{value} minuto fa} other {{value} minuti fa}}" & LF
     & "it.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {tra {value} minuto} other {tra {value} minuti}}"
     & LF
     & "it.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {{value} ora fa} other {{value} ore fa}}" & LF
     & "it.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {tra {value} ora} other {tra {value} ore}}" & LF
     & "it.humanize.datetime.relative.day.past = "
     & "{count, plural, one {{value} giorno fa} other {{value} giorni fa}}" & LF
     & "it.humanize.datetime.relative.day.future = "
     & "{count, plural, one {tra {value} giorno} other {tra {value} giorni}}"
     & LF
     & "it.humanize.datetime.relative.week.past = "
     & "{count, plural, one {{value} settimana fa} "
     & "other {{value} settimane fa}}" & LF
     & "it.humanize.datetime.relative.week.future = "
     & "{count, plural, one {tra {value} settimana} "
     & "other {tra {value} settimane}}" & LF
     & "it.humanize.datetime.relative.month.past = "
     & "{count, plural, one {{value} mese fa} other {{value} mesi fa}}" & LF
     & "it.humanize.datetime.relative.month.future = "
     & "{count, plural, one {tra {value} mese} other {tra {value} mesi}}" & LF
     & "it.humanize.datetime.relative.year.past = "
     & "{count, plural, one {{value} anno fa} other {{value} anni fa}}" & LF
     & "it.humanize.datetime.relative.year.future = "
     & "{count, plural, one {tra {value} anno} other {tra {value} anni}}" & LF
     & "it.humanize.duration.unit.second = "
     & "{count, plural, one {{value} secondo} other {{value} secondi}}" & LF
     & "it.humanize.duration.unit.minute = "
     & "{count, plural, one {{value} minuto} other {{value} minuti}}" & LF
     & "it.humanize.duration.unit.hour = "
     & "{count, plural, one {{value} ora} other {{value} ore}}" & LF
     & "it.humanize.duration.unit.day = "
     & "{count, plural, one {{value} giorno} other {{value} giorni}}" & LF
     & "it.humanize.bytes.byte = "
     & "{count, plural, one {{value} byte} other {{value} byte}}" & LF
     & "it.humanize.bytes.kb = {value} kB" & LF
     & "it.humanize.bytes.mb = {value} MB" & LF
     & "it.humanize.bytes.gb = {value} GB" & LF
     & "it.humanize.bytes.tb = {value} TB" & LF
     & "it.humanize.bytes.kib = {value} KiB" & LF
     & "it.humanize.bytes.mib = {value} MiB" & LF
     & "it.humanize.bytes.gib = {value} GiB" & LF
     & "it.humanize.bytes.tib = {value} TiB" & LF
     & "it.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value}" & ORDM & "}}" & LF
     & "it.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value}" & FEMORD & "}}" & LF
     & "it.humanize.number.compact.plain = {value}" & LF
     & "it.humanize.number.compact.thousand = {value} mila" & LF
     & "it.humanize.number.compact.million = {value} Mln" & LF
     & "it.humanize.number.compact.billion = {value} Mld" & LF
     & "it.humanize.number.compact.trillion = {value} Bln" & LF
     & "it.humanize.unit.meter = "
     & "{count, plural, one {{value} metro} other {{value} metri}}" & LF
     & "it.humanize.unit.kilometer = "
     & "{count, plural, one {{value} chilometro} other {{value} chilometri}}"
     & LF
     & "it.humanize.unit.gram = "
     & "{count, plural, one {{value} grammo} other {{value} grammi}}" & LF
     & "it.humanize.unit.kilogram = "
     & "{count, plural, one {{value} chilogrammo} "
     & "other {{value} chilogrammi}}" & LF
     & "it.humanize.unit.liter = "
     & "{count, plural, one {{value} litro} other {{value} litri}}" & LF
     & "it.humanize.list.and = e" & LF;

   procedure Load_Defaults
     (Runtime : in out I18N.Runtime.Instance;
      Result  : out I18N.Runtime.Load_Result;
      Policy  : I18N.Runtime.Duplicate_Policy :=
        I18N.Runtime.Reject_Duplicates)
   is
   begin
      I18N.Runtime.Load_Text
        (Item        => Runtime,
         Source_Name => "humanize.builtin.catalog",
         Text        =>
           English & Danish & German & French & Spanish & Italian,
         Result      => Result,
         Policy      => Policy);
   end Load_Defaults;

end Humanize.Catalogs;
