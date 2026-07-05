with Ada.Strings.Unbounded;

package body Humanize.Catalogs is

   use Ada.Strings.Unbounded;

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

   --  UTF-8 byte sequences for Portuguese letters: 'a' tilde (U+00E3), 'o'
   --  tilde (U+00F5), 'a' acute (U+00E1), and 'e' circumflex (U+00EA).
   ATILDE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A3#);
   OTILDE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B5#);
   AACUTE : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A1#);
   ECIRC  : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AA#);

   --  English catalog fragment. Catalog values are unquoted; i18n trims the
   --  text after the first '=' separator.
   English : constant String :=
     "en.humanize.datetime.now = now" & LF
     & "en.humanize.datetime.day.previous = yesterday" & LF
     & "en.humanize.datetime.day.current = today" & LF
     & "en.humanize.datetime.day.next = tomorrow" & LF
     & "en.humanize.datetime.relative.second.past = "
     & "{count, plural, one {{value, number} second ago} other {{value, number} seconds ago}}" & LF
     & "en.humanize.datetime.relative.second.future = "
     & "{count, plural, one {in {value, number} second} other {in {value, number} seconds}}" & LF
     & "en.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {{value, number} minute ago} other {{value, number} minutes ago}}" & LF
     & "en.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {in {value, number} minute} other {in {value, number} minutes}}" & LF
     & "en.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {{value, number} hour ago} other {{value, number} hours ago}}" & LF
     & "en.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {in {value, number} hour} other {in {value, number} hours}}" & LF
     & "en.humanize.datetime.relative.day.past = "
     & "{count, plural, one {{value, number} day ago} other {{value, number} days ago}}" & LF
     & "en.humanize.datetime.relative.day.future = "
     & "{count, plural, one {in {value, number} day} other {in {value, number} days}}" & LF
     & "en.humanize.datetime.relative.week.past = "
     & "{count, plural, one {{value, number} week ago} other {{value, number} weeks ago}}" & LF
     & "en.humanize.datetime.relative.week.future = "
     & "{count, plural, one {in {value, number} week} other {in {value, number} weeks}}" & LF
     & "en.humanize.datetime.relative.month.past = "
     & "{count, plural, one {{value, number} month ago} other {{value, number} months ago}}" & LF
     & "en.humanize.datetime.relative.month.future = "
     & "{count, plural, one {in {value, number} month} other {in {value, number} months}}" & LF
     & "en.humanize.datetime.relative.year.past = "
     & "{count, plural, one {{value, number} year ago} other {{value, number} years ago}}" & LF
     & "en.humanize.datetime.relative.year.future = "
     & "{count, plural, one {in {value, number} year} other {in {value, number} years}}" & LF
     & "en.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} second} other {{value, number} seconds}}" & LF
     & "en.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} minute} other {{value, number} minutes}}" & LF
     & "en.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} hour} other {{value, number} hours}}" & LF
     & "en.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} day} other {{value, number} days}}" & LF
     & "en.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} byte} other {{value, number} bytes}}" & LF
     & "en.humanize.bytes.kb = {value, number} kB" & LF
     & "en.humanize.bytes.mb = {value, number} MB" & LF
     & "en.humanize.bytes.gb = {value, number} GB" & LF
     & "en.humanize.bytes.tb = {value, number} TB" & LF
     & "en.humanize.bytes.kib = {value, number} KiB" & LF
     & "en.humanize.bytes.mib = {value, number} MiB" & LF
     & "en.humanize.bytes.gib = {value, number} GiB" & LF
     & "en.humanize.bytes.tib = {value, number} TiB" & LF
     & "en.humanize.number.ordinal = "
     & "{count, selectordinal, one {{value, number}st} "
     & "two {{value, number}nd} few {{value, number}rd} "
     & "other {{value, number}th}}" & LF
     & "en.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, one {{value, number}st} "
     & "two {{value, number}nd} few {{value, number}rd} "
     & "other {{value, number}th}}" & LF
     & "en.humanize.number.compact.plain = {value, number}" & LF
     & "en.humanize.number.compact.thousand = {value, number}K" & LF
     & "en.humanize.number.compact.million = {value, number}M" & LF
     & "en.humanize.number.compact.billion = {value, number}B" & LF
     & "en.humanize.number.compact.trillion = {value, number}T" & LF
     & "en.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} thousand} other {{value, number} thousand}}" & LF
     & "en.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} million} other {{value, number} million}}" & LF
     & "en.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} billion} other {{value, number} billion}}" & LF
     & "en.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} trillion} other {{value, number} trillion}}" & LF
     & "en.humanize.unit.meter = "
     & "{count, plural, one {{value, number} meter} other {{value, number} meters}}" & LF
     & "en.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} kilometer} other {{value, number} kilometers}}" & LF
     & "en.humanize.unit.gram = "
     & "{count, plural, one {{value, number} gram} other {{value, number} grams}}" & LF
     & "en.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} kilogram} other {{value, number} kilograms}}" & LF
     & "en.humanize.unit.liter = "
     & "{count, plural, one {{value, number} liter} other {{value, number} liters}}" & LF
     & "en.humanize.number.percent = {value, number}%" & LF
     & "en.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} centimeter} other {{value, number} centimeters}}" & LF
     & "en.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} millimeter} other {{value, number} millimeters}}" & LF
     & "en.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} milligram} other {{value, number} milligrams}}" & LF
     & "en.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} milliliter} other {{value, number} milliliters}}" & LF
     & "en.humanize.list.and = and" & LF;

   --  Danish catalog fragment. 'å' is spliced via AA to keep UTF-8 output.
   Danish : constant String :=
     "da.humanize.datetime.now = nu" & LF
     & "da.humanize.datetime.day.previous = i g" & AA & "r" & LF
     & "da.humanize.datetime.day.current = i dag" & LF
     & "da.humanize.datetime.day.next = i morgen" & LF
     & "da.humanize.datetime.relative.second.past = "
     & "{count, plural, one {for {value, number} sekund siden} "
     & "other {for {value, number} sekunder siden}}" & LF
     & "da.humanize.datetime.relative.second.future = "
     & "{count, plural, one {om {value, number} sekund} other {om {value, number} sekunder}}" & LF
     & "da.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {for {value, number} minut siden} "
     & "other {for {value, number} minutter siden}}" & LF
     & "da.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {om {value, number} minut} other {om {value, number} minutter}}" & LF
     & "da.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {for {value, number} time siden} other {for {value, number} timer siden}}" & LF
     & "da.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {om {value, number} time} other {om {value, number} timer}}" & LF
     & "da.humanize.datetime.relative.day.past = "
     & "{count, plural, one {for {value, number} dag siden} other {for {value, number} dage siden}}" & LF
     & "da.humanize.datetime.relative.day.future = "
     & "{count, plural, one {om {value, number} dag} other {om {value, number} dage}}" & LF
     & "da.humanize.datetime.relative.week.past = "
     & "{count, plural, one {for {value, number} uge siden} other {for {value, number} uger siden}}" & LF
     & "da.humanize.datetime.relative.week.future = "
     & "{count, plural, one {om {value, number} uge} other {om {value, number} uger}}" & LF
     & "da.humanize.datetime.relative.month.past = "
     & "{count, plural, one {for {value, number} m" & AA & "ned siden} "
     & "other {for {value, number} m" & AA & "neder siden}}" & LF
     & "da.humanize.datetime.relative.month.future = "
     & "{count, plural, one {om {value, number} m" & AA & "ned} "
     & "other {om {value, number} m" & AA & "neder}}" & LF
     & "da.humanize.datetime.relative.year.past = "
     & "{count, plural, one {for {value, number} " & AA & "r siden} "
     & "other {for {value, number} " & AA & "r siden}}" & LF
     & "da.humanize.datetime.relative.year.future = "
     & "{count, plural, one {om {value, number} " & AA & "r} other {om {value, number} " & AA & "r}}" & LF
     & "da.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} sekund} other {{value, number} sekunder}}" & LF
     & "da.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} minut} other {{value, number} minutter}}" & LF
     & "da.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} time} other {{value, number} timer}}" & LF
     & "da.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} dag} other {{value, number} dage}}" & LF
     & "da.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} byte} other {{value, number} bytes}}" & LF
     & "da.humanize.bytes.kb = {value, number} kB" & LF
     & "da.humanize.bytes.mb = {value, number} MB" & LF
     & "da.humanize.bytes.gb = {value, number} GB" & LF
     & "da.humanize.bytes.tb = {value, number} TB" & LF
     & "da.humanize.bytes.kib = {value, number} KiB" & LF
     & "da.humanize.bytes.mib = {value, number} MiB" & LF
     & "da.humanize.bytes.gib = {value, number} GiB" & LF
     & "da.humanize.bytes.tib = {value, number} TiB" & LF
     & "da.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value, number}.}}" & LF
     & "da.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value, number}.}}" & LF
     & "da.humanize.number.compact.plain = {value, number}" & LF
     & "da.humanize.number.compact.thousand = {value, number} t" & LF
     & "da.humanize.number.compact.million = {value, number} mio." & LF
     & "da.humanize.number.compact.billion = {value, number} mia." & LF
     & "da.humanize.number.compact.trillion = {value, number} bio." & LF
     & "da.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} tusind} other {{value, number} tusind}}" & LF
     & "da.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} million} other {{value, number} millioner}}" & LF
     & "da.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} milliard} other {{value, number} milliarder}}" & LF
     & "da.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} billion} other {{value, number} billioner}}" & LF
     & "da.humanize.unit.meter = "
     & "{count, plural, one {{value, number} meter} other {{value, number} meter}}" & LF
     & "da.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} kilometer} other {{value, number} kilometer}}" & LF
     & "da.humanize.unit.gram = "
     & "{count, plural, one {{value, number} gram} other {{value, number} gram}}" & LF
     & "da.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} kilogram} other {{value, number} kilogram}}" & LF
     & "da.humanize.unit.liter = "
     & "{count, plural, one {{value, number} liter} other {{value, number} liter}}" & LF
     & "da.humanize.number.percent = {value, number}%" & LF
     & "da.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} centimeter} other {{value, number} centimeter}}" & LF
     & "da.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} millimeter} other {{value, number} millimeter}}" & LF
     & "da.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} milligram} other {{value, number} milligram}}" & LF
     & "da.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} milliliter} other {{value, number} milliliter}}" & LF
     & "da.humanize.list.and = og" & LF;

   --  German catalog fragment (pure ASCII: no umlauts in these words).
   German : constant String :=
     "de.humanize.datetime.now = jetzt" & LF
     & "de.humanize.datetime.day.previous = gestern" & LF
     & "de.humanize.datetime.day.current = heute" & LF
     & "de.humanize.datetime.day.next = morgen" & LF
     & "de.humanize.datetime.relative.second.past = "
     & "{count, plural, one {vor {value, number} Sekunde} other {vor {value, number} Sekunden}}" & LF
     & "de.humanize.datetime.relative.second.future = "
     & "{count, plural, one {in {value, number} Sekunde} other {in {value, number} Sekunden}}" & LF
     & "de.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {vor {value, number} Minute} other {vor {value, number} Minuten}}" & LF
     & "de.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {in {value, number} Minute} other {in {value, number} Minuten}}" & LF
     & "de.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {vor {value, number} Stunde} other {vor {value, number} Stunden}}" & LF
     & "de.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {in {value, number} Stunde} other {in {value, number} Stunden}}" & LF
     & "de.humanize.datetime.relative.day.past = "
     & "{count, plural, one {vor {value, number} Tag} other {vor {value, number} Tagen}}" & LF
     & "de.humanize.datetime.relative.day.future = "
     & "{count, plural, one {in {value, number} Tag} other {in {value, number} Tagen}}" & LF
     & "de.humanize.datetime.relative.week.past = "
     & "{count, plural, one {vor {value, number} Woche} other {vor {value, number} Wochen}}" & LF
     & "de.humanize.datetime.relative.week.future = "
     & "{count, plural, one {in {value, number} Woche} other {in {value, number} Wochen}}" & LF
     & "de.humanize.datetime.relative.month.past = "
     & "{count, plural, one {vor {value, number} Monat} other {vor {value, number} Monaten}}" & LF
     & "de.humanize.datetime.relative.month.future = "
     & "{count, plural, one {in {value, number} Monat} other {in {value, number} Monaten}}" & LF
     & "de.humanize.datetime.relative.year.past = "
     & "{count, plural, one {vor {value, number} Jahr} other {vor {value, number} Jahren}}" & LF
     & "de.humanize.datetime.relative.year.future = "
     & "{count, plural, one {in {value, number} Jahr} other {in {value, number} Jahren}}" & LF
     & "de.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} Sekunde} other {{value, number} Sekunden}}" & LF
     & "de.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} Minute} other {{value, number} Minuten}}" & LF
     & "de.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} Stunde} other {{value, number} Stunden}}" & LF
     & "de.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} Tag} other {{value, number} Tage}}" & LF
     & "de.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} Byte} other {{value, number} Bytes}}" & LF
     & "de.humanize.bytes.kb = {value, number} kB" & LF
     & "de.humanize.bytes.mb = {value, number} MB" & LF
     & "de.humanize.bytes.gb = {value, number} GB" & LF
     & "de.humanize.bytes.tb = {value, number} TB" & LF
     & "de.humanize.bytes.kib = {value, number} KiB" & LF
     & "de.humanize.bytes.mib = {value, number} MiB" & LF
     & "de.humanize.bytes.gib = {value, number} GiB" & LF
     & "de.humanize.bytes.tib = {value, number} TiB" & LF
     & "de.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value, number}.}}" & LF
     & "de.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value, number}.}}" & LF
     & "de.humanize.number.compact.plain = {value, number}" & LF
     & "de.humanize.number.compact.thousand = {value, number} Tsd." & LF
     & "de.humanize.number.compact.million = {value, number} Mio." & LF
     & "de.humanize.number.compact.billion = {value, number} Mrd." & LF
     & "de.humanize.number.compact.trillion = {value, number} Bio." & LF
     & "de.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} Tausend} other {{value, number} Tausend}}" & LF
     & "de.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} Million} other {{value, number} Millionen}}" & LF
     & "de.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} Milliarde} other {{value, number} Milliarden}}" & LF
     & "de.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} Billion} other {{value, number} Billionen}}" & LF
     & "de.humanize.unit.meter = "
     & "{count, plural, one {{value, number} Meter} other {{value, number} Meter}}" & LF
     & "de.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} Kilometer} other {{value, number} Kilometer}}" & LF
     & "de.humanize.unit.gram = "
     & "{count, plural, one {{value, number} Gramm} other {{value, number} Gramm}}" & LF
     & "de.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} Kilogramm} other {{value, number} Kilogramm}}" & LF
     & "de.humanize.unit.liter = "
     & "{count, plural, one {{value, number} Liter} other {{value, number} Liter}}" & LF
     & "de.humanize.number.percent = {value, number}%" & LF
     & "de.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} Zentimeter} other {{value, number} Zentimeter}}" & LF
     & "de.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} Millimeter} other {{value, number} Millimeter}}" & LF
     & "de.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} Milligramm} other {{value, number} Milligramm}}" & LF
     & "de.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} Milliliter} other {{value, number} Milliliter}}" & LF
     & "de.humanize.list.and = und" & LF;

   --  French catalog fragment (pure ASCII; French plural "one" covers 0 and 1).
   --  "byte" is "octet"; unit symbols stay international (kB/KiB).
   French : constant String :=
     "fr.humanize.datetime.now = maintenant" & LF
     & "fr.humanize.datetime.day.previous = hier" & LF
     & "fr.humanize.datetime.day.current = aujourd'hui" & LF
     & "fr.humanize.datetime.day.next = demain" & LF
     & "fr.humanize.datetime.relative.second.past = "
     & "{count, plural, one {il y a {value, number} seconde} "
     & "other {il y a {value, number} secondes}}" & LF
     & "fr.humanize.datetime.relative.second.future = "
     & "{count, plural, one {dans {value, number} seconde} other {dans {value, number} secondes}}" & LF
     & "fr.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {il y a {value, number} minute} other {il y a {value, number} minutes}}" & LF
     & "fr.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {dans {value, number} minute} other {dans {value, number} minutes}}" & LF
     & "fr.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {il y a {value, number} heure} other {il y a {value, number} heures}}" & LF
     & "fr.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {dans {value, number} heure} other {dans {value, number} heures}}" & LF
     & "fr.humanize.datetime.relative.day.past = "
     & "{count, plural, one {il y a {value, number} jour} other {il y a {value, number} jours}}" & LF
     & "fr.humanize.datetime.relative.day.future = "
     & "{count, plural, one {dans {value, number} jour} other {dans {value, number} jours}}" & LF
     & "fr.humanize.datetime.relative.week.past = "
     & "{count, plural, one {il y a {value, number} semaine} "
     & "other {il y a {value, number} semaines}}" & LF
     & "fr.humanize.datetime.relative.week.future = "
     & "{count, plural, one {dans {value, number} semaine} other {dans {value, number} semaines}}" & LF
     & "fr.humanize.datetime.relative.month.past = "
     & "{count, plural, one {il y a {value, number} mois} other {il y a {value, number} mois}}" & LF
     & "fr.humanize.datetime.relative.month.future = "
     & "{count, plural, one {dans {value, number} mois} other {dans {value, number} mois}}" & LF
     & "fr.humanize.datetime.relative.year.past = "
     & "{count, plural, one {il y a {value, number} an} other {il y a {value, number} ans}}" & LF
     & "fr.humanize.datetime.relative.year.future = "
     & "{count, plural, one {dans {value, number} an} other {dans {value, number} ans}}" & LF
     & "fr.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} seconde} other {{value, number} secondes}}" & LF
     & "fr.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} minute} other {{value, number} minutes}}" & LF
     & "fr.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} heure} other {{value, number} heures}}" & LF
     & "fr.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} jour} other {{value, number} jours}}" & LF
     & "fr.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} octet} other {{value, number} octets}}" & LF
     & "fr.humanize.bytes.kb = {value, number} kB" & LF
     & "fr.humanize.bytes.mb = {value, number} MB" & LF
     & "fr.humanize.bytes.gb = {value, number} GB" & LF
     & "fr.humanize.bytes.tb = {value, number} TB" & LF
     & "fr.humanize.bytes.kib = {value, number} KiB" & LF
     & "fr.humanize.bytes.mib = {value, number} MiB" & LF
     & "fr.humanize.bytes.gib = {value, number} GiB" & LF
     & "fr.humanize.bytes.tib = {value, number} TiB" & LF
     & "fr.humanize.number.ordinal = "
     & "{count, selectordinal, one {{value, number}er} other {{value, number}e}}" & LF
     & "fr.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, one {{value, number}re} other {{value, number}e}}" & LF
     & "fr.humanize.number.compact.plain = {value, number}" & LF
     & "fr.humanize.number.compact.thousand = {value, number} k" & LF
     & "fr.humanize.number.compact.million = {value, number} M" & LF
     & "fr.humanize.number.compact.billion = {value, number} Md" & LF
     & "fr.humanize.number.compact.trillion = {value, number} Bn" & LF
     & "fr.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} millier} other {{value, number} milliers}}" & LF
     & "fr.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} million} other {{value, number} millions}}" & LF
     & "fr.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} milliard} other {{value, number} milliards}}" & LF
     & "fr.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} billion} other {{value, number} billions}}" & LF
     & "fr.humanize.unit.meter = "
     & "{count, plural, one {{value, number} m" & EGRAVE & "tre} "
     & "other {{value, number} m" & EGRAVE & "tres}}" & LF
     & "fr.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} kilom" & EGRAVE & "tre} "
     & "other {{value, number} kilom" & EGRAVE & "tres}}" & LF
     & "fr.humanize.unit.gram = "
     & "{count, plural, one {{value, number} gramme} other {{value, number} grammes}}" & LF
     & "fr.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} kilogramme} "
     & "other {{value, number} kilogrammes}}" & LF
     & "fr.humanize.unit.liter = "
     & "{count, plural, one {{value, number} litre} other {{value, number} litres}}" & LF
     & "fr.humanize.number.percent = {value, number} %" & LF
     & "fr.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} centim" & EGRAVE & "tre} "
     & "other {{value, number} centim" & EGRAVE & "tres}}" & LF
     & "fr.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} millim" & EGRAVE & "tre} "
     & "other {{value, number} millim" & EGRAVE & "tres}}" & LF
     & "fr.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} milligramme} other {{value, number} milligrammes}}" & LF
     & "fr.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} millilitre} other {{value, number} millilitres}}" & LF
     & "fr.humanize.list.and = et" & LF;

   --  Spanish catalog fragment. 'n'-tilde, 'i'/'o'-acute and the ordinal
   --  indicator are spliced as UTF-8 bytes.
   Spanish : constant String :=
     "es.humanize.datetime.now = ahora" & LF
     & "es.humanize.datetime.day.previous = ayer" & LF
     & "es.humanize.datetime.day.current = hoy" & LF
     & "es.humanize.datetime.day.next = ma" & NTILDE & "ana" & LF
     & "es.humanize.datetime.relative.second.past = "
     & "{count, plural, one {hace {value, number} segundo} "
     & "other {hace {value, number} segundos}}" & LF
     & "es.humanize.datetime.relative.second.future = "
     & "{count, plural, one {dentro de {value, number} segundo} "
     & "other {dentro de {value, number} segundos}}" & LF
     & "es.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {hace {value, number} minuto} "
     & "other {hace {value, number} minutos}}" & LF
     & "es.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {dentro de {value, number} minuto} "
     & "other {dentro de {value, number} minutos}}" & LF
     & "es.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {hace {value, number} hora} "
     & "other {hace {value, number} horas}}" & LF
     & "es.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {dentro de {value, number} hora} "
     & "other {dentro de {value, number} horas}}" & LF
     & "es.humanize.datetime.relative.day.past = "
     & "{count, plural, one {hace {value, number} d" & IACUTE & "a} "
     & "other {hace {value, number} d" & IACUTE & "as}}" & LF
     & "es.humanize.datetime.relative.day.future = "
     & "{count, plural, one {dentro de {value, number} d" & IACUTE & "a} "
     & "other {dentro de {value, number} d" & IACUTE & "as}}" & LF
     & "es.humanize.datetime.relative.week.past = "
     & "{count, plural, one {hace {value, number} semana} "
     & "other {hace {value, number} semanas}}" & LF
     & "es.humanize.datetime.relative.week.future = "
     & "{count, plural, one {dentro de {value, number} semana} "
     & "other {dentro de {value, number} semanas}}" & LF
     & "es.humanize.datetime.relative.month.past = "
     & "{count, plural, one {hace {value, number} mes} "
     & "other {hace {value, number} meses}}" & LF
     & "es.humanize.datetime.relative.month.future = "
     & "{count, plural, one {dentro de {value, number} mes} "
     & "other {dentro de {value, number} meses}}" & LF
     & "es.humanize.datetime.relative.year.past = "
     & "{count, plural, one {hace {value, number} a" & NTILDE & "o} "
     & "other {hace {value, number} a" & NTILDE & "os}}" & LF
     & "es.humanize.datetime.relative.year.future = "
     & "{count, plural, one {dentro de {value, number} a" & NTILDE & "o} "
     & "other {dentro de {value, number} a" & NTILDE & "os}}" & LF
     & "es.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} segundo} other {{value, number} segundos}}" & LF
     & "es.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} minuto} other {{value, number} minutos}}" & LF
     & "es.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} hora} other {{value, number} horas}}" & LF
     & "es.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} d" & IACUTE & "a} "
     & "other {{value, number} d" & IACUTE & "as}}" & LF
     & "es.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} byte} other {{value, number} bytes}}" & LF
     & "es.humanize.bytes.kb = {value, number} kB" & LF
     & "es.humanize.bytes.mb = {value, number} MB" & LF
     & "es.humanize.bytes.gb = {value, number} GB" & LF
     & "es.humanize.bytes.tb = {value, number} TB" & LF
     & "es.humanize.bytes.kib = {value, number} KiB" & LF
     & "es.humanize.bytes.mib = {value, number} MiB" & LF
     & "es.humanize.bytes.gib = {value, number} GiB" & LF
     & "es.humanize.bytes.tib = {value, number} TiB" & LF
     & "es.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value, number}." & ORDM & "}}" & LF
     & "es.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value, number}." & FEMORD & "}}" & LF
     & "es.humanize.number.compact.plain = {value, number}" & LF
     & "es.humanize.number.compact.thousand = {value, number} mil" & LF
     & "es.humanize.number.compact.million = {value, number} M" & LF
     & "es.humanize.number.compact.billion = {value, number} mil M" & LF
     & "es.humanize.number.compact.trillion = {value, number} B" & LF
     & "es.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} mil} other {{value, number} mil}}" & LF
     & "es.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} mill" & OACUTE & "n} "
     & "other {{value, number} millones}}" & LF
     & "es.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} mil millones} "
     & "other {{value, number} mil millones}}" & LF
     & "es.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} bill" & OACUTE & "n} "
     & "other {{value, number} billones}}" & LF
     & "es.humanize.unit.meter = "
     & "{count, plural, one {{value, number} metro} other {{value, number} metros}}" & LF
     & "es.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} kil" & OACUTE & "metro} "
     & "other {{value, number} kil" & OACUTE & "metros}}" & LF
     & "es.humanize.unit.gram = "
     & "{count, plural, one {{value, number} gramo} other {{value, number} gramos}}" & LF
     & "es.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} kilogramo} other {{value, number} kilogramos}}" & LF
     & "es.humanize.unit.liter = "
     & "{count, plural, one {{value, number} litro} other {{value, number} litros}}" & LF
     & "es.humanize.number.percent = {value, number}%" & LF
     & "es.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} cent" & IACUTE & "metro} "
     & "other {{value, number} cent" & IACUTE & "metros}}" & LF
     & "es.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} mil" & IACUTE & "metro} "
     & "other {{value, number} mil" & IACUTE & "metros}}" & LF
     & "es.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} miligramo} other {{value, number} miligramos}}" & LF
     & "es.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} mililitro} other {{value, number} mililitros}}" & LF
     & "es.humanize.list.and = y" & LF;

   --  Italian catalog fragment (the ordinal indicator is spliced as UTF-8).
   Italian : constant String :=
     "it.humanize.datetime.now = adesso" & LF
     & "it.humanize.datetime.day.previous = ieri" & LF
     & "it.humanize.datetime.day.current = oggi" & LF
     & "it.humanize.datetime.day.next = domani" & LF
     & "it.humanize.datetime.relative.second.past = "
     & "{count, plural, one {{value, number} secondo fa} other {{value, number} secondi fa}}"
     & LF
     & "it.humanize.datetime.relative.second.future = "
     & "{count, plural, one {tra {value, number} secondo} other {tra {value, number} secondi}}"
     & LF
     & "it.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {{value, number} minuto fa} other {{value, number} minuti fa}}" & LF
     & "it.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {tra {value, number} minuto} other {tra {value, number} minuti}}"
     & LF
     & "it.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {{value, number} ora fa} other {{value, number} ore fa}}" & LF
     & "it.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {tra {value, number} ora} other {tra {value, number} ore}}" & LF
     & "it.humanize.datetime.relative.day.past = "
     & "{count, plural, one {{value, number} giorno fa} other {{value, number} giorni fa}}" & LF
     & "it.humanize.datetime.relative.day.future = "
     & "{count, plural, one {tra {value, number} giorno} other {tra {value, number} giorni}}"
     & LF
     & "it.humanize.datetime.relative.week.past = "
     & "{count, plural, one {{value, number} settimana fa} "
     & "other {{value, number} settimane fa}}" & LF
     & "it.humanize.datetime.relative.week.future = "
     & "{count, plural, one {tra {value, number} settimana} "
     & "other {tra {value, number} settimane}}" & LF
     & "it.humanize.datetime.relative.month.past = "
     & "{count, plural, one {{value, number} mese fa} other {{value, number} mesi fa}}" & LF
     & "it.humanize.datetime.relative.month.future = "
     & "{count, plural, one {tra {value, number} mese} other {tra {value, number} mesi}}" & LF
     & "it.humanize.datetime.relative.year.past = "
     & "{count, plural, one {{value, number} anno fa} other {{value, number} anni fa}}" & LF
     & "it.humanize.datetime.relative.year.future = "
     & "{count, plural, one {tra {value, number} anno} other {tra {value, number} anni}}" & LF
     & "it.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} secondo} other {{value, number} secondi}}" & LF
     & "it.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} minuto} other {{value, number} minuti}}" & LF
     & "it.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} ora} other {{value, number} ore}}" & LF
     & "it.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} giorno} other {{value, number} giorni}}" & LF
     & "it.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} byte} other {{value, number} byte}}" & LF
     & "it.humanize.bytes.kb = {value, number} kB" & LF
     & "it.humanize.bytes.mb = {value, number} MB" & LF
     & "it.humanize.bytes.gb = {value, number} GB" & LF
     & "it.humanize.bytes.tb = {value, number} TB" & LF
     & "it.humanize.bytes.kib = {value, number} KiB" & LF
     & "it.humanize.bytes.mib = {value, number} MiB" & LF
     & "it.humanize.bytes.gib = {value, number} GiB" & LF
     & "it.humanize.bytes.tib = {value, number} TiB" & LF
     & "it.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value, number}" & ORDM & "}}" & LF
     & "it.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value, number}" & FEMORD & "}}" & LF
     & "it.humanize.number.compact.plain = {value, number}" & LF
     & "it.humanize.number.compact.thousand = {value, number} mila" & LF
     & "it.humanize.number.compact.million = {value, number} Mln" & LF
     & "it.humanize.number.compact.billion = {value, number} Mld" & LF
     & "it.humanize.number.compact.trillion = {value, number} Bln" & LF
     & "it.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} mille} other {{value, number} mila}}" & LF
     & "it.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} milione} other {{value, number} milioni}}" & LF
     & "it.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} miliardo} other {{value, number} miliardi}}" & LF
     & "it.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} bilione} other {{value, number} bilioni}}" & LF
     & "it.humanize.unit.meter = "
     & "{count, plural, one {{value, number} metro} other {{value, number} metri}}" & LF
     & "it.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} chilometro} other {{value, number} chilometri}}"
     & LF
     & "it.humanize.unit.gram = "
     & "{count, plural, one {{value, number} grammo} other {{value, number} grammi}}" & LF
     & "it.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} chilogrammo} "
     & "other {{value, number} chilogrammi}}" & LF
     & "it.humanize.unit.liter = "
     & "{count, plural, one {{value, number} litro} other {{value, number} litri}}" & LF
     & "it.humanize.number.percent = {value, number}%" & LF
     & "it.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} centimetro} other {{value, number} centimetri}}" & LF
     & "it.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} millimetro} other {{value, number} millimetri}}" & LF
     & "it.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} milligrammo} other {{value, number} milligrammi}}" & LF
     & "it.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} millilitro} other {{value, number} millilitri}}" & LF
     & "it.humanize.list.and = e" & LF;

   --  Portuguese catalog fragment (one iff i in {0,1}; accents spliced).
   Portuguese : constant String :=
     "pt.humanize.datetime.now = " & "agora" & LF
     & "pt.humanize.datetime.day.previous = " & "ontem" & LF
     & "pt.humanize.datetime.day.current = " & "hoje" & LF
     & "pt.humanize.datetime.day.next = " & "amanh" & ATILDE & LF
     & "pt.humanize.datetime.relative.second.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} segundo} "
     & "other {h" & AACUTE & " {value, number} segundos}}" & LF
     & "pt.humanize.datetime.relative.second.future = "
     & "{count, plural, one {dentro de {value, number} segundo} "
     & "other {dentro de {value, number} segundos}}" & LF
     & "pt.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} minuto} "
     & "other {h" & AACUTE & " {value, number} minutos}}" & LF
     & "pt.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {dentro de {value, number} minuto} "
     & "other {dentro de {value, number} minutos}}" & LF
     & "pt.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} hora} "
     & "other {h" & AACUTE & " {value, number} horas}}" & LF
     & "pt.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {dentro de {value, number} hora} "
     & "other {dentro de {value, number} horas}}" & LF
     & "pt.humanize.datetime.relative.day.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} dia} "
     & "other {h" & AACUTE & " {value, number} dias}}" & LF
     & "pt.humanize.datetime.relative.day.future = "
     & "{count, plural, one {dentro de {value, number} dia} "
     & "other {dentro de {value, number} dias}}" & LF
     & "pt.humanize.datetime.relative.week.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} semana} "
     & "other {h" & AACUTE & " {value, number} semanas}}" & LF
     & "pt.humanize.datetime.relative.week.future = "
     & "{count, plural, one {dentro de {value, number} semana} "
     & "other {dentro de {value, number} semanas}}" & LF
     & "pt.humanize.datetime.relative.month.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} m" & ECIRC
     & "s} other {h" & AACUTE & " {value, number} meses}}" & LF
     & "pt.humanize.datetime.relative.month.future = "
     & "{count, plural, one {dentro de {value, number} m" & ECIRC
     & "s} other {dentro de {value, number} meses}}" & LF
     & "pt.humanize.datetime.relative.year.past = "
     & "{count, plural, one {h" & AACUTE & " {value, number} ano} "
     & "other {h" & AACUTE & " {value, number} anos}}" & LF
     & "pt.humanize.datetime.relative.year.future = "
     & "{count, plural, one {dentro de {value, number} ano} "
     & "other {dentro de {value, number} anos}}" & LF
     & "pt.humanize.duration.unit.second = "
     & "{count, plural, one {{value, number} segundo} "
     & "other {{value, number} segundos}}" & LF
     & "pt.humanize.duration.unit.minute = "
     & "{count, plural, one {{value, number} minuto} "
     & "other {{value, number} minutos}}" & LF
     & "pt.humanize.duration.unit.hour = "
     & "{count, plural, one {{value, number} hora} "
     & "other {{value, number} horas}}" & LF
     & "pt.humanize.duration.unit.day = "
     & "{count, plural, one {{value, number} dia} "
     & "other {{value, number} dias}}" & LF
     & "pt.humanize.bytes.byte = "
     & "{count, plural, one {{value, number} byte} "
     & "other {{value, number} bytes}}" & LF
     & "pt.humanize.bytes.kb = " & "{value, number} kB" & LF
     & "pt.humanize.bytes.mb = " & "{value, number} MB" & LF
     & "pt.humanize.bytes.gb = " & "{value, number} GB" & LF
     & "pt.humanize.bytes.tb = " & "{value, number} TB" & LF
     & "pt.humanize.bytes.kib = " & "{value, number} KiB" & LF
     & "pt.humanize.bytes.mib = " & "{value, number} MiB" & LF
     & "pt.humanize.bytes.gib = " & "{value, number} GiB" & LF
     & "pt.humanize.bytes.tib = " & "{value, number} TiB" & LF
     & "pt.humanize.number.ordinal = "
     & "{count, selectordinal, other {{value, number}." & ORDM & "}}" & LF
     & "pt.humanize.number.ordinal.feminine = "
     & "{count, selectordinal, other {{value, number}."
     & FEMORD & "}}" & LF
     & "pt.humanize.number.compact.plain = " & "{value, number}" & LF
     & "pt.humanize.number.compact.thousand = " & "{value, number} mil" & LF
     & "pt.humanize.number.compact.million = " & "{value, number} mi" & LF
     & "pt.humanize.number.compact.billion = " & "{value, number} bi" & LF
     & "pt.humanize.number.compact.trillion = " & "{value, number} tri" & LF
     & "pt.humanize.number.compact.long.thousand = "
     & "{count, plural, one {{value, number} mil} "
     & "other {{value, number} mil}}" & LF
     & "pt.humanize.number.compact.long.million = "
     & "{count, plural, one {{value, number} milh" & ATILDE
     & "o} other {{value, number} milh" & OTILDE & "es}}" & LF
     & "pt.humanize.number.compact.long.billion = "
     & "{count, plural, one {{value, number} mil milh" & OTILDE
     & "es} other {{value, number} mil milh" & OTILDE & "es}}" & LF
     & "pt.humanize.number.compact.long.trillion = "
     & "{count, plural, one {{value, number} bili" & ATILDE
     & "o} other {{value, number} bili" & OTILDE & "es}}" & LF
     & "pt.humanize.number.percent = " & "{value, number}%" & LF
     & "pt.humanize.unit.meter = "
     & "{count, plural, one {{value, number} metro} "
     & "other {{value, number} metros}}" & LF
     & "pt.humanize.unit.kilometer = "
     & "{count, plural, one {{value, number} quil" & OACUTE
     & "metro} other {{value, number} quil" & OACUTE & "metros}}" & LF
     & "pt.humanize.unit.centimeter = "
     & "{count, plural, one {{value, number} cent" & IACUTE
     & "metro} other {{value, number} cent" & IACUTE & "metros}}" & LF
     & "pt.humanize.unit.millimeter = "
     & "{count, plural, one {{value, number} mil" & IACUTE
     & "metro} other {{value, number} mil" & IACUTE & "metros}}" & LF
     & "pt.humanize.unit.gram = "
     & "{count, plural, one {{value, number} grama} "
     & "other {{value, number} gramas}}" & LF
     & "pt.humanize.unit.kilogram = "
     & "{count, plural, one {{value, number} quilograma} "
     & "other {{value, number} quilogramas}}" & LF
     & "pt.humanize.unit.milligram = "
     & "{count, plural, one {{value, number} miligrama} "
     & "other {{value, number} miligramas}}" & LF
     & "pt.humanize.unit.liter = "
     & "{count, plural, one {{value, number} litro} "
     & "other {{value, number} litros}}" & LF
     & "pt.humanize.unit.milliliter = "
     & "{count, plural, one {{value, number} mililitro} "
     & "other {{value, number} mililitros}}" & LF
     & "pt.humanize.list.and = " & "e" & LF;

   function Unit_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      return
        Locale & ".humanize.unit." & Key & " = "
        & "{count, plural, one {{value, number} " & Singular & "} "
        & "other {{value, number} " & Plural & "}}" & LF;
   end Unit_Line;

   function Added_Unit_Keys (Locale : String) return String is
   begin
      if Locale = "da" then
         return
           Unit_Line (Locale, "celsius", "grad Celsius", "grader Celsius")
           & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grader Fahrenheit")
           & Unit_Line (Locale, "square_meter", "kvadratmeter", "kvadratmeter")
           & Unit_Line (Locale, "hectare", "hektar", "hektar")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer i timen", "kilometer i timen")
           & Unit_Line (Locale, "meter_per_second", "meter i sekundet", "meter i sekundet")
           & Unit_Line (Locale, "pascal", "pascal", "pascal")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
           & Unit_Line (Locale, "joule", "joule", "joule")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
           & Unit_Line (Locale, "watt", "watt", "watt")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "grad", "grader")
           & Unit_Line (Locale, "mile", "mile", "miles")
           & Unit_Line (Locale, "yard", "yard", "yards")
           & Unit_Line (Locale, "foot", "fod", "fod")
           & Unit_Line (Locale, "inch", "tomme", "tommer")
           & Unit_Line (Locale, "gallon", "gallon", "gallons")
           & Unit_Line (Locale, "pound", "pund", "pund")
           & Unit_Line (Locale, "ounce", "ounce", "ounces");
      elsif Locale = "de" then
         return
           Unit_Line (Locale, "celsius", "Grad Celsius", "Grad Celsius")
           & Unit_Line (Locale, "fahrenheit", "Grad Fahrenheit", "Grad Fahrenheit")
           & Unit_Line (Locale, "square_meter", "Quadratmeter", "Quadratmeter")
           & Unit_Line (Locale, "hectare", "Hektar", "Hektar")
           & Unit_Line (Locale, "kilometer_per_hour", "Kilometer pro Stunde", "Kilometer pro Stunde")
           & Unit_Line (Locale, "meter_per_second", "Meter pro Sekunde", "Meter pro Sekunde")
           & Unit_Line (Locale, "pascal", "Pascal", "Pascal")
           & Unit_Line (Locale, "kilopascal", "Kilopascal", "Kilopascal")
           & Unit_Line (Locale, "joule", "Joule", "Joule")
           & Unit_Line (Locale, "kilojoule", "Kilojoule", "Kilojoule")
           & Unit_Line (Locale, "watt", "Watt", "Watt")
           & Unit_Line (Locale, "kilowatt", "Kilowatt", "Kilowatt")
           & Unit_Line (Locale, "hertz", "Hertz", "Hertz")
           & Unit_Line (Locale, "kilohertz", "Kilohertz", "Kilohertz")
           & Unit_Line (Locale, "degree", "Grad", "Grad")
           & Unit_Line (Locale, "mile", "Meile", "Meilen")
           & Unit_Line (Locale, "yard", "Yard", "Yards")
           & Unit_Line (Locale, "foot", "Fuss", "Fuss")
           & Unit_Line (Locale, "inch", "Zoll", "Zoll")
           & Unit_Line (Locale, "gallon", "Gallone", "Gallonen")
           & Unit_Line (Locale, "pound", "Pfund", "Pfund")
           & Unit_Line (Locale, "ounce", "Unze", "Unzen");
      elsif Locale = "fr" then
         return
           Unit_Line (Locale, "celsius", "degre Celsius", "degres Celsius")
           & Unit_Line (Locale, "fahrenheit", "degre Fahrenheit", "degres Fahrenheit")
           & Unit_Line (Locale, "square_meter", "metre carre", "metres carres")
           & Unit_Line (Locale, "hectare", "hectare", "hectares")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometre par heure", "kilometres par heure")
           & Unit_Line (Locale, "meter_per_second", "metre par seconde", "metres par seconde")
           & Unit_Line (Locale, "pascal", "pascal", "pascals")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascals")
           & Unit_Line (Locale, "joule", "joule", "joules")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoules")
           & Unit_Line (Locale, "watt", "watt", "watts")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatts")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "degre", "degres")
           & Unit_Line (Locale, "mile", "mille", "milles")
           & Unit_Line (Locale, "yard", "yard", "yards")
           & Unit_Line (Locale, "foot", "pied", "pieds")
           & Unit_Line (Locale, "inch", "pouce", "pouces")
           & Unit_Line (Locale, "gallon", "gallon", "gallons")
           & Unit_Line (Locale, "pound", "livre", "livres")
           & Unit_Line (Locale, "ounce", "once", "onces");
      elsif Locale = "es" then
         return
           Unit_Line (Locale, "celsius", "grado Celsius", "grados Celsius")
           & Unit_Line (Locale, "fahrenheit", "grado Fahrenheit", "grados Fahrenheit")
           & Unit_Line (Locale, "square_meter", "metro cuadrado", "metros cuadrados")
           & Unit_Line (Locale, "hectare", "hectarea", "hectareas")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometro por hora", "kilometros por hora")
           & Unit_Line (Locale, "meter_per_second", "metro por segundo", "metros por segundo")
           & Unit_Line (Locale, "pascal", "pascal", "pascales")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascales")
           & Unit_Line (Locale, "joule", "julio", "julios")
           & Unit_Line (Locale, "kilojoule", "kilojulio", "kilojulios")
           & Unit_Line (Locale, "watt", "vatio", "vatios")
           & Unit_Line (Locale, "kilowatt", "kilovatio", "kilovatios")
           & Unit_Line (Locale, "hertz", "hercio", "hercios")
           & Unit_Line (Locale, "kilohertz", "kilohercio", "kilohercios")
           & Unit_Line (Locale, "degree", "grado", "grados")
           & Unit_Line (Locale, "mile", "milla", "millas")
           & Unit_Line (Locale, "yard", "yarda", "yardas")
           & Unit_Line (Locale, "foot", "pie", "pies")
           & Unit_Line (Locale, "inch", "pulgada", "pulgadas")
           & Unit_Line (Locale, "gallon", "galon", "galones")
           & Unit_Line (Locale, "pound", "libra", "libras")
           & Unit_Line (Locale, "ounce", "onza", "onzas");
      elsif Locale = "it" then
         return
           Unit_Line (Locale, "celsius", "grado Celsius", "gradi Celsius")
           & Unit_Line (Locale, "fahrenheit", "grado Fahrenheit", "gradi Fahrenheit")
           & Unit_Line (Locale, "square_meter", "metro quadrato", "metri quadrati")
           & Unit_Line (Locale, "hectare", "ettaro", "ettari")
           & Unit_Line (Locale, "kilometer_per_hour", "chilometro all'ora", "chilometri all'ora")
           & Unit_Line (Locale, "meter_per_second", "metro al secondo", "metri al secondo")
           & Unit_Line (Locale, "pascal", "pascal", "pascal")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
           & Unit_Line (Locale, "joule", "joule", "joule")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
           & Unit_Line (Locale, "watt", "watt", "watt")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "grado", "gradi")
           & Unit_Line (Locale, "mile", "miglio", "miglia")
           & Unit_Line (Locale, "yard", "iarda", "iarde")
           & Unit_Line (Locale, "foot", "piede", "piedi")
           & Unit_Line (Locale, "inch", "pollice", "pollici")
           & Unit_Line (Locale, "gallon", "gallone", "galloni")
           & Unit_Line (Locale, "pound", "libbra", "libbre")
           & Unit_Line (Locale, "ounce", "oncia", "once");
      elsif Locale = "pt" then
         return
           Unit_Line (Locale, "celsius", "grau Celsius", "graus Celsius")
           & Unit_Line (Locale, "fahrenheit", "grau Fahrenheit", "graus Fahrenheit")
           & Unit_Line (Locale, "square_meter", "metro quadrado", "metros quadrados")
           & Unit_Line (Locale, "hectare", "hectare", "hectares")
           & Unit_Line (Locale, "kilometer_per_hour", "quilometro por hora", "quilometros por hora")
           & Unit_Line (Locale, "meter_per_second", "metro por segundo", "metros por segundo")
           & Unit_Line (Locale, "pascal", "pascal", "pascais")
           & Unit_Line (Locale, "kilopascal", "quilopascal", "quilopascais")
           & Unit_Line (Locale, "joule", "joule", "joules")
           & Unit_Line (Locale, "kilojoule", "quilojoule", "quilojoules")
           & Unit_Line (Locale, "watt", "watt", "watts")
           & Unit_Line (Locale, "kilowatt", "quilowatt", "quilowatts")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "quilohertz", "quilohertz")
           & Unit_Line (Locale, "degree", "grau", "graus")
           & Unit_Line (Locale, "mile", "milha", "milhas")
           & Unit_Line (Locale, "yard", "jarda", "jardas")
           & Unit_Line (Locale, "foot", "pe", "pes")
           & Unit_Line (Locale, "inch", "polegada", "polegadas")
           & Unit_Line (Locale, "gallon", "galao", "galoes")
           & Unit_Line (Locale, "pound", "libra", "libras")
           & Unit_Line (Locale, "ounce", "onca", "oncas");
      else
         return
           Unit_Line (Locale, "celsius", "degree Celsius", "degrees Celsius")
           & Unit_Line (Locale, "fahrenheit", "degree Fahrenheit", "degrees Fahrenheit")
           & Unit_Line (Locale, "square_meter", "square meter", "square meters")
           & Unit_Line (Locale, "hectare", "hectare", "hectares")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer per hour", "kilometers per hour")
           & Unit_Line (Locale, "meter_per_second", "meter per second", "meters per second")
           & Unit_Line (Locale, "pascal", "pascal", "pascals")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascals")
           & Unit_Line (Locale, "joule", "joule", "joules")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoules")
           & Unit_Line (Locale, "watt", "watt", "watts")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatts")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "degree", "degrees")
           & Unit_Line (Locale, "mile", "mile", "miles")
           & Unit_Line (Locale, "yard", "yard", "yards")
           & Unit_Line (Locale, "foot", "foot", "feet")
           & Unit_Line (Locale, "inch", "inch", "inches")
           & Unit_Line (Locale, "gallon", "gallon", "gallons")
           & Unit_Line (Locale, "pound", "pound", "pounds")
           & Unit_Line (Locale, "ounce", "ounce", "ounces");
      end if;
   end Added_Unit_Keys;

   function Extra_Unit_Keys (Locale : String) return String is
   begin
      if Locale = "da" then
         return
           Unit_Line (Locale, "nautical_mile", "somil", "somil")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line (Locale, "square_kilometer", "kvadratkilometer", "kvadratkilometer")
           & Unit_Line (Locale, "cubic_meter", "kubikmeter", "kubikmeter")
           & Unit_Line (Locale, "teaspoon", "teske", "teskeer")
           & Unit_Line (Locale, "tablespoon", "spiseske", "spiseskeer")
           & Unit_Line (Locale, "cup", "kop", "kopper")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton", "ton")
           & Unit_Line (Locale, "ton", "ton", "ton");
      elsif Locale = "de" then
         return
           Unit_Line (Locale, "nautical_mile", "Seemeile", "Seemeilen")
           & Unit_Line (Locale, "acre", "Acre", "Acres")
           & Unit_Line (Locale, "square_kilometer", "Quadratkilometer", "Quadratkilometer")
           & Unit_Line (Locale, "cubic_meter", "Kubikmeter", "Kubikmeter")
           & Unit_Line (Locale, "teaspoon", "Teeloffel", "Teeloffel")
           & Unit_Line (Locale, "tablespoon", "Essloffel", "Essloffel")
           & Unit_Line (Locale, "cup", "Tasse", "Tassen")
           & Unit_Line (Locale, "stone", "Stone", "Stone")
           & Unit_Line (Locale, "tonne", "Tonne", "Tonnen")
           & Unit_Line (Locale, "ton", "Tonne", "Tonnen");
      elsif Locale = "fr" then
         return
           Unit_Line (Locale, "nautical_mile", "mille marin", "milles marins")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line (Locale, "square_kilometer", "kilometre carre", "kilometres carres")
           & Unit_Line (Locale, "cubic_meter", "metre cube", "metres cubes")
           & Unit_Line (Locale, "teaspoon", "cuillere a cafe", "cuilleres a cafe")
           & Unit_Line (Locale, "tablespoon", "cuillere a soupe", "cuilleres a soupe")
           & Unit_Line (Locale, "cup", "tasse", "tasses")
           & Unit_Line (Locale, "stone", "stone", "stones")
           & Unit_Line (Locale, "tonne", "tonne", "tonnes")
           & Unit_Line (Locale, "ton", "tonne courte", "tonnes courtes");
      elsif Locale = "es" then
         return
           Unit_Line (Locale, "nautical_mile", "milla nautica", "millas nauticas")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line (Locale, "square_kilometer", "kilometro cuadrado", "kilometros cuadrados")
           & Unit_Line (Locale, "cubic_meter", "metro cubico", "metros cubicos")
           & Unit_Line (Locale, "teaspoon", "cucharadita", "cucharaditas")
           & Unit_Line (Locale, "tablespoon", "cucharada", "cucharadas")
           & Unit_Line (Locale, "cup", "taza", "tazas")
           & Unit_Line (Locale, "stone", "stone", "stones")
           & Unit_Line (Locale, "tonne", "tonelada", "toneladas")
           & Unit_Line (Locale, "ton", "tonelada corta", "toneladas cortas");
      elsif Locale = "it" then
         return
           Unit_Line (Locale, "nautical_mile", "miglio nautico", "miglia nautiche")
           & Unit_Line (Locale, "acre", "acro", "acri")
           & Unit_Line (Locale, "square_kilometer", "chilometro quadrato", "chilometri quadrati")
           & Unit_Line (Locale, "cubic_meter", "metro cubo", "metri cubi")
           & Unit_Line (Locale, "teaspoon", "cucchiaino", "cucchiaini")
           & Unit_Line (Locale, "tablespoon", "cucchiaio", "cucchiai")
           & Unit_Line (Locale, "cup", "tazza", "tazze")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonnellata", "tonnellate")
           & Unit_Line (Locale, "ton", "tonnellata corta", "tonnellate corte");
      elsif Locale = "pt" then
         return
           Unit_Line (Locale, "nautical_mile", "milha nautica", "milhas nauticas")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line (Locale, "square_kilometer", "quilometro quadrado", "quilometros quadrados")
           & Unit_Line (Locale, "cubic_meter", "metro cubico", "metros cubicos")
           & Unit_Line (Locale, "teaspoon", "colher de cha", "colheres de cha")
           & Unit_Line (Locale, "tablespoon", "colher de sopa", "colheres de sopa")
           & Unit_Line (Locale, "cup", "xicara", "xicaras")
           & Unit_Line (Locale, "stone", "stone", "stones")
           & Unit_Line (Locale, "tonne", "tonelada", "toneladas")
           & Unit_Line (Locale, "ton", "tonelada curta", "toneladas curtas");
      elsif Locale = "nl" then
         return
           Unit_Line (Locale, "nautical_mile", "zeemijl", "zeemijl")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line (Locale, "square_kilometer", "vierkante kilometer", "vierkante kilometer")
           & Unit_Line (Locale, "cubic_meter", "kubieke meter", "kubieke meter")
           & Unit_Line (Locale, "teaspoon", "theelepel", "theelepels")
           & Unit_Line (Locale, "tablespoon", "eetlepel", "eetlepels")
           & Unit_Line (Locale, "cup", "kop", "koppen")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton", "ton")
           & Unit_Line (Locale, "ton", "short ton", "short tons");
      else
         return
           Unit_Line (Locale, "nautical_mile", "nautical mile", "nautical miles")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line
               (Locale, "square_kilometer",
                "square kilometer", "square kilometers")
           & Unit_Line (Locale, "cubic_meter", "cubic meter", "cubic meters")
           & Unit_Line (Locale, "teaspoon", "teaspoon", "teaspoons")
           & Unit_Line (Locale, "tablespoon", "tablespoon", "tablespoons")
           & Unit_Line (Locale, "cup", "cup", "cups")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonne", "tonnes")
           & Unit_Line (Locale, "ton", "ton", "tons");
      end if;
   end Extra_Unit_Keys;

   function Symbol_Unit_Keys (Locale : String) return String is
   begin
      return
        Unit_Line (Locale, "celsius", "deg C", "deg C")
        & Unit_Line (Locale, "fahrenheit", "deg F", "deg F")
        & Unit_Line (Locale, "square_meter", "m2", "m2")
        & Unit_Line (Locale, "hectare", "ha", "ha")
        & Unit_Line (Locale, "kilometer_per_hour", "km/h", "km/h")
        & Unit_Line (Locale, "meter_per_second", "m/s", "m/s")
        & Unit_Line (Locale, "pascal", "Pa", "Pa")
        & Unit_Line (Locale, "kilopascal", "kPa", "kPa")
        & Unit_Line (Locale, "joule", "J", "J")
        & Unit_Line (Locale, "kilojoule", "kJ", "kJ")
        & Unit_Line (Locale, "watt", "W", "W")
        & Unit_Line (Locale, "kilowatt", "kW", "kW")
        & Unit_Line (Locale, "hertz", "Hz", "Hz")
        & Unit_Line (Locale, "kilohertz", "kHz", "kHz")
        & Unit_Line (Locale, "degree", "deg", "deg")
        & Unit_Line (Locale, "mile", "mi", "mi")
        & Unit_Line (Locale, "yard", "yd", "yd")
        & Unit_Line (Locale, "foot", "ft", "ft")
        & Unit_Line (Locale, "inch", "in", "in")
        & Unit_Line (Locale, "gallon", "gal", "gal")
        & Unit_Line (Locale, "pound", "lb", "lb")
        & Unit_Line (Locale, "ounce", "oz", "oz")
        & Unit_Line (Locale, "nautical_mile", "nmi", "nmi")
        & Unit_Line (Locale, "acre", "ac", "ac")
        & Unit_Line (Locale, "square_kilometer", "km2", "km2")
        & Unit_Line (Locale, "cubic_meter", "m3", "m3")
        & Unit_Line (Locale, "teaspoon", "tsp", "tsp")
        & Unit_Line (Locale, "tablespoon", "tbsp", "tbsp")
        & Unit_Line (Locale, "cup", "cup", "cup")
        & Unit_Line (Locale, "stone", "st", "st")
        & Unit_Line (Locale, "tonne", "t", "t")
        & Unit_Line (Locale, "ton", "ton", "ton");
   end Symbol_Unit_Keys;

   function Added_Keys (Locale : String) return String is
   begin
      return
        Locale & ".humanize.duration.unit.millisecond = "
        & "{count, plural, one {{value, number} millisecond} other {{value, number} milliseconds}}" & LF
        & Locale & ".humanize.duration.unit.microsecond = "
        & "{count, plural, one {{value, number} microsecond} other {{value, number} microseconds}}" & LF
        & Locale & ".humanize.duration.unit.week = "
        & "{count, plural, one {{value, number} week} other {{value, number} weeks}}" & LF
        & Locale & ".humanize.duration.unit.month = "
        & "{count, plural, one {{value, number} month} other {{value, number} months}}" & LF
        & Locale & ".humanize.duration.unit.year = "
        & "{count, plural, one {{value, number} year} other {{value, number} years}}" & LF
        & Locale & ".humanize.frequency.never = never" & LF
        & Locale & ".humanize.frequency.once = once" & LF
        & Locale & ".humanize.frequency.twice = twice" & LF
        & Locale & ".humanize.frequency.times = "
        & "{count, plural, one {{value, number} time} other {{value, number} times}}" & LF
        & Locale & ".humanize.rate.per.second = approximately {value} per second" & LF
        & Locale & ".humanize.rate.per.minute = approximately {value} per minute" & LF
        & Locale & ".humanize.rate.per.hour = approximately {value} per hour" & LF
        & Locale & ".humanize.rate.per.day = approximately {value} per day" & LF
        & Locale & ".humanize.rate.per.week = approximately {value} per week" & LF
        & Locale & ".humanize.rate.less_than.per.second = less than {value} per second" & LF
        & Locale & ".humanize.rate.less_than.per.minute = less than {value} per minute" & LF
        & Locale & ".humanize.rate.less_than.per.hour = less than {value} per hour" & LF
        & Locale & ".humanize.rate.less_than.per.day = less than {value} per day" & LF
        & Locale & ".humanize.rate.less_than.per.week = less than {value} per week" & LF
        & Locale & ".humanize.number.bounded = {value, number}{suffix}" & LF
        & Added_Unit_Keys (Locale)
        & Extra_Unit_Keys (Locale)
        & Locale & ".humanize.list.other = {value, number} other" & LF
        & Locale & ".humanize.list.others = {value, number} others" & LF;
   end Added_Keys;

   function Dutch_Added_Keys return String is
   begin
      return
        "nl.humanize.duration.unit.millisecond = "
        & "{count, plural, one {{value, number} milliseconde} other {{value, number} milliseconden}}" & LF
        & "nl.humanize.duration.unit.microsecond = "
        & "{count, plural, one {{value, number} microseconde} other {{value, number} microseconden}}" & LF
        & "nl.humanize.duration.unit.week = "
        & "{count, plural, one {{value, number} week} other {{value, number} weken}}" & LF
        & "nl.humanize.duration.unit.month = "
        & "{count, plural, one {{value, number} maand} other {{value, number} maanden}}" & LF
        & "nl.humanize.duration.unit.year = "
        & "{count, plural, one {{value, number} jaar} other {{value, number} jaar}}" & LF
        & "nl.humanize.frequency.never = nooit" & LF
        & "nl.humanize.frequency.once = eenmaal" & LF
        & "nl.humanize.frequency.twice = tweemaal" & LF
        & "nl.humanize.frequency.times = "
        & "{count, plural, one {{value, number} keer} other {{value, number} keer}}" & LF
        & "nl.humanize.rate.per.second = ongeveer {value} per seconde" & LF
        & "nl.humanize.rate.per.minute = ongeveer {value} per minuut" & LF
        & "nl.humanize.rate.per.hour = ongeveer {value} per uur" & LF
        & "nl.humanize.rate.per.day = ongeveer {value} per dag" & LF
        & "nl.humanize.rate.per.week = ongeveer {value} per week" & LF
        & "nl.humanize.rate.less_than.per.second = minder dan {value} per seconde" & LF
        & "nl.humanize.rate.less_than.per.minute = minder dan {value} per minuut" & LF
        & "nl.humanize.rate.less_than.per.hour = minder dan {value} per uur" & LF
        & "nl.humanize.rate.less_than.per.day = minder dan {value} per dag" & LF
        & "nl.humanize.rate.less_than.per.week = minder dan {value} per week" & LF
        & "nl.humanize.number.bounded = {value, number}{suffix}" & LF
        & "nl.humanize.unit.celsius = "
        & "{count, plural, one {{value, number} graad Celsius} "
        & "other {{value, number} graden Celsius}}" & LF
        & "nl.humanize.unit.fahrenheit = "
        & "{count, plural, one {{value, number} graad Fahrenheit} "
        & "other {{value, number} graden Fahrenheit}}" & LF
        & "nl.humanize.unit.square_meter = "
        & "{count, plural, one {{value, number} vierkante meter} "
        & "other {{value, number} vierkante meter}}" & LF
        & "nl.humanize.unit.hectare = "
        & "{count, plural, one {{value, number} hectare} "
        & "other {{value, number} hectares}}" & LF
        & "nl.humanize.unit.kilometer_per_hour = "
        & "{count, plural, one {{value, number} kilometer per uur} "
        & "other {{value, number} kilometer per uur}}" & LF
        & "nl.humanize.unit.meter_per_second = "
        & "{count, plural, one {{value, number} meter per seconde} "
        & "other {{value, number} meter per seconde}}" & LF
        & "nl.humanize.unit.pascal = "
        & "{count, plural, one {{value, number} pascal} "
        & "other {{value, number} pascals}}" & LF
        & "nl.humanize.unit.kilopascal = "
        & "{count, plural, one {{value, number} kilopascal} "
        & "other {{value, number} kilopascals}}" & LF
        & "nl.humanize.unit.joule = "
        & "{count, plural, one {{value, number} joule} "
        & "other {{value, number} joules}}" & LF
        & "nl.humanize.unit.kilojoule = "
        & "{count, plural, one {{value, number} kilojoule} "
        & "other {{value, number} kilojoules}}" & LF
        & "nl.humanize.unit.watt = "
        & "{count, plural, one {{value, number} watt} "
        & "other {{value, number} watts}}" & LF
        & "nl.humanize.unit.kilowatt = "
        & "{count, plural, one {{value, number} kilowatt} "
        & "other {{value, number} kilowatts}}" & LF
        & "nl.humanize.unit.hertz = "
        & "{count, plural, one {{value, number} hertz} "
        & "other {{value, number} hertz}}" & LF
        & "nl.humanize.unit.kilohertz = "
        & "{count, plural, one {{value, number} kilohertz} "
        & "other {{value, number} kilohertz}}" & LF
        & "nl.humanize.unit.degree = "
        & "{count, plural, one {{value, number} graad} "
        & "other {{value, number} graden}}" & LF
        & "nl.humanize.unit.mile = "
        & "{count, plural, one {{value, number} mijl} "
        & "other {{value, number} mijl}}" & LF
        & "nl.humanize.unit.yard = "
        & "{count, plural, one {{value, number} yard} "
        & "other {{value, number} yards}}" & LF
        & "nl.humanize.unit.foot = "
        & "{count, plural, one {{value, number} voet} "
        & "other {{value, number} voet}}" & LF
        & "nl.humanize.unit.inch = "
        & "{count, plural, one {{value, number} inch} "
        & "other {{value, number} inches}}" & LF
        & "nl.humanize.unit.gallon = "
        & "{count, plural, one {{value, number} gallon} "
        & "other {{value, number} gallons}}" & LF
        & "nl.humanize.unit.pound = "
        & "{count, plural, one {{value, number} pond} "
        & "other {{value, number} pond}}" & LF
        & "nl.humanize.unit.ounce = "
        & "{count, plural, one {{value, number} ounce} "
        & "other {{value, number} ounce}}" & LF
        & Extra_Unit_Keys ("nl")
        & "nl.humanize.list.other = {value, number} andere" & LF
        & "nl.humanize.list.others = {value, number} anderen" & LF;
   end Dutch_Added_Keys;

   function Reprefix_Catalog
     (Text   : String;
      Prefix : String)
      return String
   is
      Result        : Unbounded_String;
      At_Line_Start : Boolean := True;
      Index         : Natural := Text'First;
   begin
      while Index <= Text'Last loop
         if At_Line_Start
           and then Index + 2 <= Text'Last
           and then Text (Index .. Index + 2) = "en."
         then
            Append (Result, Prefix & ".");
            Index := Index + 3;
            At_Line_Start := False;
         else
            Append (Result, Text (Index));
            At_Line_Start := Text (Index) = ASCII.LF;
            Index := Index + 1;
         end if;
      end loop;

      return To_String (Result);
   end Reprefix_Catalog;

   function B (Hex : String) return String;

   function Slavic_Many_Form
     (Locale   : String;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Locale = "pl" then
         if Singular = "godzina" then
            return "godzin";
         elsif Singular = "metr" then
            return B ("6D657472C3B377");
         elsif Singular = "kilogram" then
            return B ("6B696C6F6772616DC3B377");
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = "raz" then
            return "razy";
         end if;
      elsif Locale = "cs" then
         if Singular = "hodina" then
            return "hodin";
         elsif Singular = "metr" then
            return B ("6D657472C5AF");
         elsif Singular = "kilogram" then
            return B ("6B696C6F6772616DC5AF");
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = B ("6B72C3A174") then
            return B ("6B72C3A174");
         end if;
      elsif Locale = "ru" then
         if Singular = B ("D187D0B0D181") then
            return B ("D187D0B0D181D0BED0B2");
         elsif Singular = B ("D0BCD0B5D182D180") then
            return B ("D0BCD0B5D182D180D0BED0B2");
         elsif Singular = B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BC") then
            return B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0BED0B2");
         elsif Singular = B ("D181D0B5D0BAD183D0BDD0B4D0B0") then
            return B ("D181D0B5D0BAD183D0BDD0B4");
         elsif Singular = B ("D0BCD0B8D0BDD183D182D0B0") then
            return B ("D0BCD0B8D0BDD183D182");
         elsif Singular = B ("D180D0B0D0B7") then
            return B ("D180D0B0D0B7");
         end if;
      elsif Locale = "uk" then
         if Singular = B ("D0B3D0BED0B4D0B8D0BDD0B0") then
            return B ("D0B3D0BED0B4D0B8D0BD");
         elsif Singular = B ("D0BCD0B5D182D180") then
            return B ("D0BCD0B5D182D180D196D0B2");
         elsif Singular = B ("D0BAD196D0BBD0BED0B3D180D0B0D0BC") then
            return B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD196D0B2");
         elsif Singular = B ("D181D0B5D0BAD183D0BDD0B4D0B0") then
            return B ("D181D0B5D0BAD183D0BDD0B4");
         elsif Singular = B ("D185D0B2D0B8D0BBD0B8D0BDD0B0") then
            return B ("D185D0B2D0B8D0BBD0B8D0BD");
         elsif Singular = B ("D180D0B0D0B7") then
            return B ("D180D0B0D0B7D196D0B2");
         end if;
      end if;

      return Plural;
   end Slavic_Many_Form;

   function Count_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String)
      return String
   is
   begin
      if Locale = "pl"
        or else Locale = "cs"
        or else Locale = "ru"
        or else Locale = "uk"
      then
         return
           Locale & "." & Key & " = "
           & "{count, plural, one {{value, number} " & Singular & "} "
           & "few {{value, number} " & Plural & "} "
           & "many {{value, number} "
           & Slavic_Many_Form (Locale, Singular, Plural) & "} "
           & "other {{value, number} " & Plural & "}}" & LF;
      end if;

      return
        Locale & "." & Key & " = "
        & "{count, plural, one {{value, number} " & Singular & "} "
        & "other {{value, number} " & Plural & "}}" & LF;
   end Count_Line;

   function Relative_Line
     (Locale   : String;
      Key      : String;
      Singular : String;
      Plural   : String;
      Prefix   : String;
      Suffix   : String)
      return String
   is
   begin
      if Locale = "pl"
        or else Locale = "cs"
        or else Locale = "ru"
        or else Locale = "uk"
      then
         return
           Locale & "." & Key & " = "
           & "{count, plural, one {" & Prefix & "{value, number} "
           & Singular & Suffix & "} few {" & Prefix & "{value, number} "
           & Plural & Suffix & "} many {" & Prefix & "{value, number} "
           & Slavic_Many_Form (Locale, Singular, Plural) & Suffix
           & "} other {" & Prefix & "{value, number} " & Plural & Suffix
           & "}}" & LF;
      end if;

      return
        Locale & "." & Key & " = "
        & "{count, plural, one {" & Prefix & "{value, number} "
        & Singular & Suffix & "} other {" & Prefix & "{value, number} "
        & Plural & Suffix & "}}" & LF;
   end Relative_Line;

   function Core_Locale_Catalog
     (Locale            : String;
      Now_Text          : String;
      Yesterday_Text    : String;
      Today_Text        : String;
      Tomorrow_Text     : String;
      Past_Suffix       : String;
      Future_Prefix     : String;
      Second_Singular   : String;
      Second_Plural     : String;
      Minute_Singular   : String;
      Minute_Plural     : String;
      Hour_Singular     : String;
      Hour_Plural       : String;
      Day_Singular      : String;
      Day_Plural        : String;
      Week_Singular     : String;
      Week_Plural       : String;
      Month_Singular    : String;
      Month_Plural      : String;
      Year_Singular     : String;
      Year_Plural       : String;
      Byte_Singular     : String;
      Byte_Plural       : String;
      Thousand_Short    : String;
      Million_Short     : String;
      Billion_Short     : String;
      Trillion_Short    : String;
      Thousand_Long     : String;
      Million_Long      : String;
      Billion_Long      : String;
      Trillion_Long     : String;
      Meter_Singular    : String;
      Meter_Plural      : String;
      Kilometer_Sing    : String;
      Kilometer_Plural  : String;
      Gram_Singular     : String;
      Gram_Plural       : String;
      Kilogram_Sing     : String;
      Kilogram_Plural   : String;
      Liter_Singular    : String;
      Liter_Plural      : String;
      Centimeter_Sing   : String;
      Centimeter_Plural : String;
      Millimeter_Sing   : String;
      Millimeter_Plural : String;
      Milligram_Sing    : String;
      Milligram_Plural  : String;
      Milliliter_Sing   : String;
      Milliliter_Plural : String;
      And_Text          : String)
      return String
   is
   begin
      return
        Locale & ".humanize.datetime.now = " & Now_Text & LF
        & Locale & ".humanize.datetime.day.previous = " & Yesterday_Text & LF
        & Locale & ".humanize.datetime.day.current = " & Today_Text & LF
        & Locale & ".humanize.datetime.day.next = " & Tomorrow_Text & LF
        & Relative_Line
            (Locale, "humanize.datetime.relative.second.past",
             Second_Singular, Second_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.second.future",
             Second_Singular, Second_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.minute.past",
             Minute_Singular, Minute_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.minute.future",
             Minute_Singular, Minute_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.hour.past",
             Hour_Singular, Hour_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.hour.future",
             Hour_Singular, Hour_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.day.past",
             Day_Singular, Day_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.day.future",
             Day_Singular, Day_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.week.past",
             Week_Singular, Week_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.week.future",
             Week_Singular, Week_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.month.past",
             Month_Singular, Month_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.month.future",
             Month_Singular, Month_Plural, Future_Prefix, "")
        & Relative_Line
            (Locale, "humanize.datetime.relative.year.past",
             Year_Singular, Year_Plural, "", Past_Suffix)
        & Relative_Line
            (Locale, "humanize.datetime.relative.year.future",
             Year_Singular, Year_Plural, Future_Prefix, "")
        & Count_Line
            (Locale, "humanize.duration.unit.second",
             Second_Singular, Second_Plural)
        & Count_Line
            (Locale, "humanize.duration.unit.minute",
             Minute_Singular, Minute_Plural)
        & Count_Line
            (Locale, "humanize.duration.unit.hour",
             Hour_Singular, Hour_Plural)
        & Count_Line
            (Locale, "humanize.duration.unit.day", Day_Singular, Day_Plural)
        & Count_Line (Locale, "humanize.bytes.byte", Byte_Singular, Byte_Plural)
        & Locale & ".humanize.bytes.kb = {value, number} kB" & LF
        & Locale & ".humanize.bytes.mb = {value, number} MB" & LF
        & Locale & ".humanize.bytes.gb = {value, number} GB" & LF
        & Locale & ".humanize.bytes.tb = {value, number} TB" & LF
        & Locale & ".humanize.bytes.kib = {value, number} KiB" & LF
        & Locale & ".humanize.bytes.mib = {value, number} MiB" & LF
        & Locale & ".humanize.bytes.gib = {value, number} GiB" & LF
        & Locale & ".humanize.bytes.tib = {value, number} TiB" & LF
        & Locale & ".humanize.number.ordinal = {value, number}." & LF
        & Locale & ".humanize.number.ordinal.feminine = {value, number}." & LF
        & Locale & ".humanize.number.compact.plain = {value, number}" & LF
        & Locale & ".humanize.number.compact.thousand = {value, number}"
        & Thousand_Short & LF
        & Locale & ".humanize.number.compact.million = {value, number}"
        & Million_Short & LF
        & Locale & ".humanize.number.compact.billion = {value, number}"
        & Billion_Short & LF
        & Locale & ".humanize.number.compact.trillion = {value, number}"
        & Trillion_Short & LF
        & Count_Line
            (Locale, "humanize.number.compact.long.thousand",
             Thousand_Long, Thousand_Long)
        & Count_Line
            (Locale, "humanize.number.compact.long.million",
             Million_Long, Million_Long)
        & Count_Line
            (Locale, "humanize.number.compact.long.billion",
             Billion_Long, Billion_Long)
        & Count_Line
            (Locale, "humanize.number.compact.long.trillion",
             Trillion_Long, Trillion_Long)
        & Unit_Line (Locale, "meter", Meter_Singular, Meter_Plural)
        & Unit_Line (Locale, "kilometer", Kilometer_Sing, Kilometer_Plural)
        & Unit_Line (Locale, "gram", Gram_Singular, Gram_Plural)
        & Unit_Line (Locale, "kilogram", Kilogram_Sing, Kilogram_Plural)
        & Unit_Line (Locale, "liter", Liter_Singular, Liter_Plural)
        & Locale & ".humanize.number.percent = {value, number}%" & LF
        & Unit_Line (Locale, "centimeter", Centimeter_Sing, Centimeter_Plural)
        & Unit_Line (Locale, "millimeter", Millimeter_Sing, Millimeter_Plural)
        & Unit_Line (Locale, "milligram", Milligram_Sing, Milligram_Plural)
        & Unit_Line (Locale, "milliliter", Milliliter_Sing, Milliliter_Plural)
        & Locale & ".humanize.list.and = " & And_Text & LF;
   end Core_Locale_Catalog;

   function Added_Core_Locale_Catalog
     (Locale              : String;
      Millisecond_Sing    : String;
      Millisecond_Plural  : String;
      Microsecond_Sing    : String;
      Microsecond_Plural  : String;
      Week_Singular       : String;
      Week_Plural         : String;
      Month_Singular      : String;
      Month_Plural        : String;
      Year_Singular       : String;
      Year_Plural         : String;
      Never_Text          : String;
      Once_Text           : String;
      Twice_Text          : String;
      Time_Singular       : String;
      Time_Plural         : String;
      Approx_Text         : String;
      Less_Than_Text      : String;
      Per_Second_Text     : String;
      Per_Minute_Text     : String;
      Per_Hour_Text       : String;
      Per_Day_Text        : String;
      Per_Week_Text       : String;
      Other_Singular      : String;
      Other_Plural        : String)
      return String
   is
   begin
      return
        Count_Line
          (Locale, "humanize.duration.unit.millisecond",
           Millisecond_Sing, Millisecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.microsecond",
           Microsecond_Sing, Microsecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.week", Week_Singular, Week_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.month",
           Month_Singular, Month_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.year", Year_Singular, Year_Plural)
        & Locale & ".humanize.frequency.never = " & Never_Text & LF
        & Locale & ".humanize.frequency.once = " & Once_Text & LF
        & Locale & ".humanize.frequency.twice = " & Twice_Text & LF
        & Count_Line
          (Locale, "humanize.frequency.times", Time_Singular, Time_Plural)
        & Locale & ".humanize.rate.per.second = " & Approx_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.per.minute = " & Approx_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.per.hour = " & Approx_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.per.day = " & Approx_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.per.week = " & Approx_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.rate.less_than.per.second = " & Less_Than_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.less_than.per.minute = " & Less_Than_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.less_than.per.hour = " & Less_Than_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.less_than.per.day = " & Less_Than_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.less_than.per.week = " & Less_Than_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.number.bounded = {value, number}{suffix}" & LF
        & Symbol_Unit_Keys (Locale)
        & Locale & ".humanize.list.other = {value, number} "
        & Other_Singular & LF
        & Locale & ".humanize.list.others = {value, number} "
        & Other_Plural & LF;
   end Added_Core_Locale_Catalog;

   function Native_Added_Keys
     (Locale              : String;
      Millisecond_Sing    : String;
      Millisecond_Plural  : String;
      Microsecond_Sing    : String;
      Microsecond_Plural  : String;
      Week_Singular       : String;
      Week_Plural         : String;
      Month_Singular      : String;
      Month_Plural        : String;
      Year_Singular       : String;
      Year_Plural         : String;
      Never_Text          : String;
      Once_Text           : String;
      Twice_Text          : String;
      Time_Singular       : String;
      Time_Plural         : String;
      Approx_Text         : String;
      Less_Than_Text      : String;
      Per_Second_Text     : String;
      Per_Minute_Text     : String;
      Per_Hour_Text       : String;
      Per_Day_Text        : String;
      Per_Week_Text       : String;
      Other_Singular      : String;
      Other_Plural        : String)
      return String
   is
   begin
      return
        Count_Line
          (Locale, "humanize.duration.unit.millisecond",
           Millisecond_Sing, Millisecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.microsecond",
           Microsecond_Sing, Microsecond_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.week", Week_Singular, Week_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.month",
           Month_Singular, Month_Plural)
        & Count_Line
          (Locale, "humanize.duration.unit.year", Year_Singular, Year_Plural)
        & Locale & ".humanize.frequency.never = " & Never_Text & LF
        & Locale & ".humanize.frequency.once = " & Once_Text & LF
        & Locale & ".humanize.frequency.twice = " & Twice_Text & LF
        & Count_Line
          (Locale, "humanize.frequency.times", Time_Singular, Time_Plural)
        & Locale & ".humanize.rate.per.second = " & Approx_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.per.minute = " & Approx_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.per.hour = " & Approx_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.per.day = " & Approx_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.per.week = " & Approx_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.rate.less_than.per.second = " & Less_Than_Text
        & " {value} " & Per_Second_Text & LF
        & Locale & ".humanize.rate.less_than.per.minute = " & Less_Than_Text
        & " {value} " & Per_Minute_Text & LF
        & Locale & ".humanize.rate.less_than.per.hour = " & Less_Than_Text
        & " {value} " & Per_Hour_Text & LF
        & Locale & ".humanize.rate.less_than.per.day = " & Less_Than_Text
        & " {value} " & Per_Day_Text & LF
        & Locale & ".humanize.rate.less_than.per.week = " & Less_Than_Text
        & " {value} " & Per_Week_Text & LF
        & Locale & ".humanize.number.bounded = {value, number}{suffix}" & LF
        & Added_Unit_Keys (Locale)
        & Extra_Unit_Keys (Locale)
        & Locale & ".humanize.list.other = {value, number} "
        & Other_Singular & LF
        & Locale & ".humanize.list.others = {value, number} "
        & Other_Plural & LF;
   end Native_Added_Keys;

   function Dutch_Core_Catalog return String is
   begin
      return
        Core_Locale_Catalog
          ("nl",
           "nu",
           "gisteren",
           "vandaag",
           "morgen",
           " geleden",
           "over ",
           "seconde",
           "seconden",
           "minuut",
           "minuten",
           "uur",
           "uur",
           "dag",
           "dagen",
           "week",
           "weken",
           "maand",
           "maanden",
           "jaar",
           "jaar",
           "byte",
           "bytes",
           "K",
           " mln.",
           " mld.",
           " bln.",
           "duizend",
           "miljoen",
           "miljard",
           "biljoen",
           "meter",
           "meters",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "en");
   end Dutch_Core_Catalog;

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   function New_Locale_Catalogs return String is
   begin
      return
        Core_Locale_Catalog
          ("sv",
           "nu",
           B ("6967C3A572"),
           "idag",
           "imorgon",
           " sedan",
           "om ",
           "sekund",
           "sekunder",
           "minut",
           "minuter",
           "timme",
           "timmar",
           "dag",
           "dagar",
           "vecka",
           "veckor",
           B ("6DC3A56E6164"),
           B ("6DC3A56E61646572"),
           B ("C3A572"),
           B ("C3A572"),
           "byte",
           "byte",
           " tn",
           " mn",
           " md",
           " bn",
           "tusen",
           "miljon",
           "miljard",
           "biljon",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "och")
        & Added_Core_Locale_Catalog
          ("sv",
           "millisekund",
           "millisekunder",
           "mikrosekund",
           "mikrosekunder",
           "vecka",
           "veckor",
           B ("6DC3A56E6164"),
           B ("6DC3A56E61646572"),
           B ("C3A572"),
           B ("C3A572"),
           "aldrig",
           B ("656E2067C3A56E67"),
           B ("7476C3A52067C3A56E676572"),
           B ("67C3A56E67"),
           B ("67C3A56E676572"),
           B ("756E676566C3A472"),
           B ("6D696E64726520C3A46E"),
           "per sekund",
           "per minut",
           "per timme",
           "per dag",
           "per vecka",
           "annan",
           "andra")
        & Core_Locale_Catalog
          ("no",
           B ("6EC3A5"),
           B ("692067C3A572"),
           "i dag",
           "i morgen",
           " siden",
           "om ",
           "sekund",
           "sekunder",
           "minutt",
           "minutter",
           "time",
           "timer",
           "dag",
           "dager",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "byte",
           "byte",
           " k",
           " mill.",
           " mrd.",
           " bill.",
           "tusen",
           "million",
           "milliard",
           "billion",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "og")
        & Added_Core_Locale_Catalog
          ("no",
           "millisekund",
           "millisekunder",
           "mikrosekund",
           "mikrosekunder",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "aldri",
           "en gang",
           "to ganger",
           "gang",
           "ganger",
           "omtrent",
           "mindre enn",
           "per sekund",
           "per minutt",
           "per time",
           "per dag",
           "per uke",
           "annen",
           "andre")
        & Core_Locale_Catalog
          ("nb",
           B ("6EC3A5"),
           B ("692067C3A572"),
           "i dag",
           "i morgen",
           " siden",
           "om ",
           "sekund",
           "sekunder",
           "minutt",
           "minutter",
           "time",
           "timer",
           "dag",
           "dager",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "byte",
           "byte",
           " k",
           " mill.",
           " mrd.",
           " bill.",
           "tusen",
           "million",
           "milliard",
           "billion",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "og")
        & Added_Core_Locale_Catalog
          ("nb",
           "millisekund",
           "millisekunder",
           "mikrosekund",
           "mikrosekunder",
           "uke",
           "uker",
           B ("6DC3A56E6564"),
           B ("6DC3A56E65646572"),
           B ("C3A572"),
           B ("C3A572"),
           "aldri",
           "en gang",
           "to ganger",
           "gang",
           "ganger",
           "omtrent",
           "mindre enn",
           "per sekund",
           "per minutt",
           "per time",
           "per dag",
           "per uke",
           "annen",
           "andre")
        & Core_Locale_Catalog
          ("fi",
           "nyt",
           "eilen",
           B ("74C3A46EC3A4C3A46E"),
           "huomenna",
           " sitten",
           "",
           "sekunti",
           "sekuntia",
           "minuutti",
           "minuuttia",
           "tunti",
           "tuntia",
           B ("70C3A46976C3A4"),
           B ("70C3A46976C3A4C3A4"),
           "viikko",
           "viikkoa",
           "kuukausi",
           "kuukautta",
           "vuosi",
           "vuotta",
           "tavu",
           "tavua",
           " t",
           " milj.",
           " mrd.",
           " bilj.",
           "tuhatta",
           "miljoonaa",
           "miljardia",
           "biljoonaa",
           "metri",
           B ("6D65747269C3A4"),
           "kilometri",
           B ("6B696C6F6D65747269C3A4"),
           "gramma",
           "grammaa",
           "kilogramma",
           "kilogrammaa",
           "litra",
           "litraa",
           "senttimetri",
           B ("73656E7474696D65747269C3A4"),
           "millimetri",
           B ("6D696C6C696D65747269C3A4"),
           "milligramma",
           "milligrammaa",
           "millilitra",
           "millilitraa",
           "ja")
        & Added_Core_Locale_Catalog
          ("fi",
           "millisekunti",
           "millisekuntia",
           "mikrosekunti",
           "mikrosekuntia",
           "viikko",
           "viikkoa",
           "kuukausi",
           "kuukautta",
           "vuosi",
           "vuotta",
           "ei koskaan",
           "kerran",
           "kahdesti",
           "kerta",
           "kertaa",
           "noin",
           "alle",
           "sekunnissa",
           "minuutissa",
           "tunnissa",
           B ("70C3A46976C3A47373C3A4"),
           "viikossa",
           "muu",
           "muuta")
        & Core_Locale_Catalog
          ("pl",
           "teraz",
           "wczoraj",
           B ("647A69C59B"),
           "jutro",
           " temu",
           "za ",
           "sekunda",
           "sekundy",
           "minuta",
           "minuty",
           "godzina",
           "godziny",
           B ("647A6965C584"),
           "dni",
           B ("7479647A6965C584"),
           "tygodnie",
           B ("6D69657369C48563"),
           B ("6D69657369C4856365"),
           "rok",
           "lata",
           "bajt",
           "bajty",
           " tys.",
           " mln",
           " mld",
           " bln",
           B ("74797369C48563"),
           "milion",
           "miliard",
           "bilion",
           "metr",
           "metry",
           "kilometr",
           "kilometry",
           "gram",
           "gramy",
           "kilogram",
           "kilogramy",
           "litr",
           "litry",
           "centymetr",
           "centymetry",
           "milimetr",
           "milimetry",
           "miligram",
           "miligramy",
           "mililitr",
           "mililitry",
           "i")
        & Added_Core_Locale_Catalog
          ("pl",
           "milisekunda",
           "milisekundy",
           "mikrosekunda",
           "mikrosekundy",
           B ("7479647A6965C584"),
           "tygodnie",
           B ("6D69657369C48563"),
           B ("6D69657369C4856365"),
           "rok",
           "lata",
           "nigdy",
           "raz",
           "dwa razy",
           "raz",
           "razy",
           B ("6F6B6FC5826F"),
           B ("6D6E69656A206E69C5BC"),
           B ("6E612073656B756E64C499"),
           B ("6E61206D696E7574C499"),
           B ("6E6120676F647A696EC499"),
           B ("6E6120647A6965C584"),
           B ("6E61207479647A6965C584"),
           "inny",
           "inne")
        & Core_Locale_Catalog
          ("cs",
           B ("6E796EC3AD"),
           B ("76C48D657261"),
           "dnes",
           B ("7AC3AD747261"),
           B ("207A70C49B74"),
           "za ",
           "sekunda",
           "sekundy",
           "minuta",
           "minuty",
           "hodina",
           "hodiny",
           "den",
           "dny",
           B ("74C3BD64656E"),
           B ("74C3BD646E79"),
           B ("6DC49B73C3AD63"),
           B ("6DC49B73C3AD6365"),
           "rok",
           "roky",
           "bajt",
           "bajty",
           " tis.",
           " mil.",
           " mld.",
           " bil.",
           B ("746973C3AD63"),
           "milion",
           "miliarda",
           "bilion",
           "metr",
           "metry",
           "kilometr",
           "kilometry",
           "gram",
           "gramy",
           "kilogram",
           "kilogramy",
           "litr",
           "litry",
           "centimetr",
           "centimetry",
           "milimetr",
           "milimetry",
           "miligram",
           "miligramy",
           "mililitr",
           "mililitry",
           "a")
        & Added_Core_Locale_Catalog
          ("cs",
           "milisekunda",
           "milisekundy",
           "mikrosekunda",
           "mikrosekundy",
           B ("74C3BD64656E"),
           B ("74C3BD646E79"),
           B ("6DC49B73C3AD63"),
           B ("6DC49B73C3AD6365"),
           "rok",
           "roky",
           "nikdy",
           "jednou",
           B ("6476616B72C3A174"),
           B ("6B72C3A174"),
           B ("6B72C3A174"),
           B ("70C59969626C69C5BE6EC49B"),
           B ("6DC3A96EC49B206E65C5BE"),
           "za sekundu",
           "za minutu",
           "za hodinu",
           "za den",
           B ("7A612074C3BD64656E"),
           B ("6A696EC3BD"),
           B ("6A696EC3A9"))
        & Core_Locale_Catalog
          ("tr",
           B ("C59F696D6469"),
           B ("64C3BC6E"),
           B ("627567C3BC6E"),
           B ("796172C4B16E"),
           B ("20C3B66E6365"),
           "",
           "saniye",
           "saniye",
           "dakika",
           "dakika",
           "saat",
           "saat",
           B ("67C3BC6E"),
           B ("67C3BC6E"),
           "hafta",
           "hafta",
           "ay",
           "ay",
           B ("79C4B16C"),
           B ("79C4B16C"),
           "bayt",
           "bayt",
           " B",
           " Mn",
           " Mr",
           " Tn",
           "bin",
           "milyon",
           "milyar",
           "trilyon",
           "metre",
           "metre",
           "kilometre",
           "kilometre",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "litre",
           "litre",
           "santimetre",
           "santimetre",
           "milimetre",
           "milimetre",
           "miligram",
           "miligram",
           "mililitre",
           "mililitre",
           "ve")
        & Added_Core_Locale_Catalog
          ("tr",
           "milisaniye",
           "milisaniye",
           "mikrosaniye",
           "mikrosaniye",
           "hafta",
           "hafta",
           "ay",
           "ay",
           B ("79C4B16C"),
           B ("79C4B16C"),
           "asla",
           "bir kez",
           "iki kez",
           "kez",
           "kez",
           B ("79616B6C61C59FC4B16B"),
           "daha az",
           "saniyede",
           "dakikada",
           "saatte",
           B ("67C3BC6E6465"),
           "haftada",
           B ("6469C49F6572"),
           B ("6469C49F6572"))
        & Core_Locale_Catalog
          ("ru",
           B ("D181D0B5D0B9D187D0B0D181"),
           B ("D0B2D187D0B5D180D0B0"),
           B ("D181D0B5D0B3D0BED0B4D0BDD18F"),
           B ("D0B7D0B0D0B2D182D180D0B0"),
           B ("20D0BDD0B0D0B7D0B0D0B4"),
           B ("D187D0B5D180D0B5D0B720"),
           B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D181D0B5D0BAD183D0BDD0B4D18B"),
           B ("D0BCD0B8D0BDD183D182D0B0"),
           B ("D0BCD0B8D0BDD183D182D18B"),
           B ("D187D0B0D181"),
           B ("D187D0B0D181D0B0"),
           B ("D0B4D0B5D0BDD18C"),
           B ("D0B4D0BDD18F"),
           B ("D0BDD0B5D0B4D0B5D0BBD18F"),
           B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
           B ("D0BCD0B5D181D18FD186"),
           B ("D0BCD0B5D181D18FD186D0B0"),
           B ("D0B3D0BED0B4"),
           B ("D0B3D0BED0B4D0B0"),
           B ("D0B1D0B0D0B9D182"),
           B ("D0B1D0B0D0B9D182D0B0"),
           B ("20D182D18BD1812E"),
           B ("20D0BCD0BBD0BD"),
           B ("20D0BCD0BBD180D0B4"),
           B ("20D182D180D0BBD0BD"),
           B ("D182D18BD181D18FD187D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BED0BD"),
           B ("D0BCD0B8D0BBD0BBD0B8D0B0D180D0B4"),
           B ("D182D180D0B8D0BBD0BBD0B8D0BED0BD"),
           B ("D0BCD0B5D182D180"),
           B ("D0BCD0B5D182D180D0B0"),
           B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180"),
           B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D0B0"),
           B ("D0B3D180D0B0D0BCD0BC"),
           B ("D0B3D180D0B0D0BCD0BCD0B0"),
           B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BC"),
           B ("D0BAD0B8D0BBD0BED0B3D180D0B0D0BCD0BCD0B0"),
           B ("D0BBD0B8D182D180"),
           B ("D0BBD0B8D182D180D0B0"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BCD0B5D182D180D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BC"),
           B ("D0BCD0B8D0BBD0BBD0B8D0B3D180D0B0D0BCD0BCD0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180"),
           B ("D0BCD0B8D0BBD0BBD0B8D0BBD0B8D182D180D0B0"),
           B ("D0B8"))
        & Added_Core_Locale_Catalog
          ("ru",
           B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD0B8D0BBD0BBD0B8D181D0B5D0BAD183D0BDD0B4D18B"),
           B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD0B8D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D18B"),
           B ("D0BDD0B5D0B4D0B5D0BBD18F"),
           B ("D0BDD0B5D0B4D0B5D0BBD0B8"),
           B ("D0BCD0B5D181D18FD186"),
           B ("D0BCD0B5D181D18FD186D0B0"),
           B ("D0B3D0BED0B4"),
           B ("D0B3D0BED0B4D0B0"),
           B ("D0BDD0B8D0BAD0BED0B3D0B4D0B0"),
           B ("D0BED0B4D0B8D0BD20D180D0B0D0B7"),
           B ("D0B4D0B2D0B020D180D0B0D0B7D0B0"),
           B ("D180D0B0D0B7"),
           B ("D180D0B0D0B7D0B0"),
           B ("D0BFD180D0B8D0BCD0B5D180D0BDD0BE"),
           B ("D0BCD0B5D0BDD18CD188D0B520D187D0B5D0BC"),
           B ("D0B220D181D0B5D0BAD183D0BDD0B4D183"),
           B ("D0B220D0BCD0B8D0BDD183D182D183"),
           B ("D0B220D187D0B0D181"),
           B ("D0B220D0B4D0B5D0BDD18C"),
           B ("D0B220D0BDD0B5D0B4D0B5D0BBD18E"),
           B ("D0B4D180D183D0B3D0BED0B9"),
           B ("D0B4D180D183D0B3D0B8D0B5"))
        & Core_Locale_Catalog
          ("uk",
           B ("D0B7D0B0D180D0B0D0B7"),
           B ("D0B2D187D0BED180D0B0"),
           B ("D181D18CD0BED0B3D0BED0B4D0BDD196"),
           B ("D0B7D0B0D0B2D182D180D0B0"),
           B ("20D182D0BED0BCD183"),
           B ("D187D0B5D180D0B5D0B720"),
           B ("D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D181D0B5D0BAD183D0BDD0B4D0B8"),
           B ("D185D0B2D0B8D0BBD0B8D0BDD0B0"),
           B ("D185D0B2D0B8D0BBD0B8D0BDD0B8"),
           B ("D0B3D0BED0B4D0B8D0BDD0B0"),
           B ("D0B3D0BED0B4D0B8D0BDD0B8"),
           B ("D0B4D0B5D0BDD18C"),
           B ("D0B4D0BDD196"),
           B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
           B ("D182D0B8D0B6D0BDD196"),
           B ("D0BCD196D181D18FD186D18C"),
           B ("D0BCD196D181D18FD186D196"),
           B ("D180D196D0BA"),
           B ("D180D0BED0BAD0B8"),
           B ("D0B1D0B0D0B9D182"),
           B ("D0B1D0B0D0B9D182D0B8"),
           B ("20D182D0B8D1812E"),
           B ("20D0BCD0BBD0BD"),
           B ("20D0BCD0BBD180D0B4"),
           B ("20D182D180D0BBD0BD"),
           B ("D182D0B8D181D18FD187D0B0"),
           B ("D0BCD196D0BBD18CD0B9D0BED0BD"),
           B ("D0BCD196D0BBD18CD18FD180D0B4"),
           B ("D182D180D0B8D0BBD18CD0B9D0BED0BD"),
           B ("D0BCD0B5D182D180"),
           B ("D0BCD0B5D182D180D0B8"),
           B ("D0BAD196D0BBD0BED0BCD0B5D182D180"),
           B ("D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"),
           B ("D0B3D180D0B0D0BC"),
           B ("D0B3D180D0B0D0BCD0B8"),
           B ("D0BAD196D0BBD0BED0B3D180D0B0D0BC"),
           B ("D0BAD196D0BBD0BED0B3D180D0B0D0BCD0B8"),
           B ("D0BBD196D182D180"),
           B ("D0BBD196D182D180D0B8"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180"),
           B ("D181D0B0D0BDD182D0B8D0BCD0B5D182D180D0B8"),
           B ("D0BCD196D0BBD196D0BCD0B5D182D180"),
           B ("D0BCD196D0BBD196D0BCD0B5D182D180D0B8"),
           B ("D0BCD196D0BBD196D0B3D180D0B0D0BC"),
           B ("D0BCD196D0BBD196D0B3D180D0B0D0BCD0B8"),
           B ("D0BCD196D0BBD196D0BBD196D182D180"),
           B ("D0BCD196D0BBD196D0BBD196D182D180D0B8"),
           B ("D196"))
        & Added_Core_Locale_Catalog
          ("uk",
           B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD196D0BBD196D181D0B5D0BAD183D0BDD0B4D0B8"),
           B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B0"),
           B ("D0BCD196D0BAD180D0BED181D0B5D0BAD183D0BDD0B4D0B8"),
           B ("D182D0B8D0B6D0B4D0B5D0BDD18C"),
           B ("D182D0B8D0B6D0BDD196"),
           B ("D0BCD196D181D18FD186D18C"),
           B ("D0BCD196D181D18FD186D196"),
           B ("D180D196D0BA"),
           B ("D180D0BED0BAD0B8"),
           B ("D0BDD196D0BAD0BED0BBD0B8"),
           B ("D0BED0B4D0B8D0BD20D180D0B0D0B7"),
           B ("D0B4D0B2D0B020D180D0B0D0B7D0B8"),
           B ("D180D0B0D0B7"),
           B ("D180D0B0D0B7D0B8"),
           B ("D0BFD180D0B8D0B1D0BBD0B8D0B7D0BDD0BE"),
           B ("D0BCD0B5D0BDD188D0B520D0BDD196D0B6"),
           B ("D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"),
           B ("D0B7D0B020D185D0B2D0B8D0BBD0B8D0BDD183"),
           B ("D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"),
           B ("D0B7D0B020D0B4D0B5D0BDD18C"),
           B ("D0B7D0B020D182D0B8D0B6D0B4D0B5D0BDD18C"),
           B ("D196D0BDD188D0B8D0B9"),
           B ("D196D0BDD188D196"))
        & Core_Locale_Catalog
          ("ja",
           B ("E4BB8A"),
           B ("E698A8E697A5"),
           B ("E4BB8AE697A5"),
           B ("E6988EE697A5"),
           B ("E5898D"),
           B ("E38182E381A820"),
           B ("E7A792"),
           B ("E7A792"),
           B ("E58886"),
           B ("E58886"),
           B ("E69982E99693"),
           B ("E69982E99693"),
           B ("E697A5"),
           B ("E697A5"),
           B ("E980B1"),
           B ("E980B1"),
           B ("E3818BE69C88"),
           B ("E3818BE69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E38390E382A4E38388"),
           B ("E38390E382A4E38388"),
           B ("20E58D83"),
           B ("20E4B887"),
           B ("20E58484"),
           B ("20E58586"),
           B ("E58D83"),
           B ("E799BEE4B887"),
           B ("E58D81E58484"),
           B ("E4B880E58586"),
           B ("E383A1E383BCE38388E383AB"),
           B ("E383A1E383BCE38388E383AB"),
           B ("E382ADE383ADE383A1E383BCE38388E383AB"),
           B ("E382ADE383ADE383A1E383BCE38388E383AB"),
           B ("E382B0E383A9E383A0"),
           B ("E382B0E383A9E383A0"),
           B ("E382ADE383ADE382B0E383A9E383A0"),
           B ("E382ADE383ADE382B0E383A9E383A0"),
           B ("E383AAE38383E38388E383AB"),
           B ("E383AAE38383E38388E383AB"),
           B ("E382BBE383B3E38381E383A1E383BCE38388E383AB"),
           B ("E382BBE383B3E38381E383A1E383BCE38388E383AB"),
           B ("E3839FE383AAE383A1E383BCE38388E383AB"),
           B ("E3839FE383AAE383A1E383BCE38388E383AB"),
           B ("E3839FE383AAE382B0E383A9E383A0"),
           B ("E3839FE383AAE382B0E383A9E383A0"),
           B ("E3839FE383AAE383AAE38383E38388E383AB"),
           B ("E3839FE383AAE383AAE38383E38388E383AB"),
           B ("E381A8"))
        & Added_Core_Locale_Catalog
          ("ja",
           B ("E3839FE383AAE7A792"),
           B ("E3839FE383AAE7A792"),
           B ("E3839EE382A4E382AFE383ADE7A792"),
           B ("E3839EE382A4E382AFE383ADE7A792"),
           B ("E980B1"),
           B ("E980B1"),
           B ("E3818BE69C88"),
           B ("E3818BE69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E381AAE38197"),
           B ("31E59B9E"),
           B ("32E59B9E"),
           B ("E59B9E"),
           B ("E59B9E"),
           B ("E7B484"),
           B ("E69CAAE6BA80"),
           B ("E6AF8EE7A792"),
           B ("E6AF8EE58886"),
           B ("E6AF8EE69982"),
           B ("E6AF8EE697A5"),
           B ("E6AF8EE980B1"),
           B ("E3819DE381AEE4BB96"),
           B ("E3819DE381AEE4BB96"))
        & Core_Locale_Catalog
          ("ko",
           B ("ECA780EAB888"),
           B ("EC96B4ECA09C"),
           B ("EC98A4EB8A98"),
           B ("EB82B4EC9DBC"),
           B ("20ECA084"),
           B ("ED9B8420"),
           B ("ECB488"),
           B ("ECB488"),
           B ("EBB684"),
           B ("EBB684"),
           B ("EC8B9CEAB084"),
           B ("EC8B9CEAB084"),
           B ("EC9DBC"),
           B ("EC9DBC"),
           B ("ECA3BC"),
           B ("ECA3BC"),
           B ("EAB09CEC9B94"),
           B ("EAB09CEC9B94"),
           B ("EB8584"),
           B ("EB8584"),
           B ("EBB094EC9DB4ED8AB8"),
           B ("EBB094EC9DB4ED8AB8"),
           B ("20ECB29C"),
           B ("20EBB0B1EBA78C"),
           B ("20EC8BADEC96B5"),
           B ("20ECA1B0"),
           B ("ECB29C"),
           B ("EBB0B1EBA78C"),
           B ("EC8BADEC96B5"),
           B ("ECA1B0"),
           B ("EBAFB8ED84B0"),
           B ("EBAFB8ED84B0"),
           B ("ED82ACEBA19CEBAFB8ED84B0"),
           B ("ED82ACEBA19CEBAFB8ED84B0"),
           B ("EAB7B8EB9EA8"),
           B ("EAB7B8EB9EA8"),
           B ("ED82ACEBA19CEAB7B8EB9EA8"),
           B ("ED82ACEBA19CEAB7B8EB9EA8"),
           B ("EBA6ACED84B0"),
           B ("EBA6ACED84B0"),
           B ("EC84BCED8BB0EBAFB8ED84B0"),
           B ("EC84BCED8BB0EBAFB8ED84B0"),
           B ("EBB080EBA6ACEBAFB8ED84B0"),
           B ("EBB080EBA6ACEBAFB8ED84B0"),
           B ("EBB080EBA6ACEAB7B8EB9EA8"),
           B ("EBB080EBA6ACEAB7B8EB9EA8"),
           B ("EBB080EBA6ACEBA6ACED84B0"),
           B ("EBB080EBA6ACEBA6ACED84B0"),
           B ("EBB08F"))
        & Added_Core_Locale_Catalog
          ("ko",
           B ("EBB080EBA6ACECB488"),
           B ("EBB080EBA6ACECB488"),
           B ("EBA788EC9DB4ED81ACEBA19CECB488"),
           B ("EBA788EC9DB4ED81ACEBA19CECB488"),
           B ("ECA3BC"),
           B ("ECA3BC"),
           B ("EAB09CEC9B94"),
           B ("EAB09CEC9B94"),
           B ("EB8584"),
           B ("EB8584"),
           B ("EC9786EC9D8C"),
           B ("ED959C20EBB288"),
           B ("EB919020EBB288"),
           B ("EBB288"),
           B ("EBB288"),
           B ("EC95BD"),
           B ("EBAFB8EBA78C"),
           B ("ECB488EBA788EB8BA4"),
           B ("EBB684EBA788EB8BA4"),
           B ("EC8B9CEAB084EBA788EB8BA4"),
           B ("EC9DBCEBA788EB8BA4"),
           B ("ECA3BCEBA788EB8BA4"),
           B ("EAB8B0ED8380"),
           B ("EAB8B0ED8380"))
        & Core_Locale_Catalog
          ("zh",
           B ("E78EB0E59CA8"),
           B ("E698A8E5A4A9"),
           B ("E4BB8AE5A4A9"),
           B ("E6988EE5A4A9"),
           B ("E5898D"),
           B ("E5868DE8BF8720"),
           B ("E7A792"),
           B ("E7A792"),
           B ("E58886E9929F"),
           B ("E58886E9929F"),
           B ("E5B08FE697B6"),
           B ("E5B08FE697B6"),
           B ("E5A4A9"),
           B ("E5A4A9"),
           B ("E591A8"),
           B ("E591A8"),
           B ("E69C88"),
           B ("E69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E5AD97E88A82"),
           B ("E5AD97E88A82"),
           B ("20E58D83"),
           B ("20E799BEE4B887"),
           B ("20E58D81E4BABF"),
           B ("20E4B887E4BABF"),
           B ("E58D83"),
           B ("E799BEE4B887"),
           B ("E58D81E4BABF"),
           B ("E4B887E4BABF"),
           B ("E7B1B3"),
           B ("E7B1B3"),
           B ("E58D83E7B1B3"),
           B ("E58D83E7B1B3"),
           B ("E5858B"),
           B ("E5858B"),
           B ("E58D83E5858B"),
           B ("E58D83E5858B"),
           B ("E58D87"),
           B ("E58D87"),
           B ("E58E98E7B1B3"),
           B ("E58E98E7B1B3"),
           B ("E6AFABE7B1B3"),
           B ("E6AFABE7B1B3"),
           B ("E6AFABE5858B"),
           B ("E6AFABE5858B"),
           B ("E6AFABE58D87"),
           B ("E6AFABE58D87"),
           B ("E5928C"))
        & Added_Core_Locale_Catalog
          ("zh",
           B ("E6AFABE7A792"),
           B ("E6AFABE7A792"),
           B ("E5BEAEE7A792"),
           B ("E5BEAEE7A792"),
           B ("E591A8"),
           B ("E591A8"),
           B ("E4B8AAE69C88"),
           B ("E4B8AAE69C88"),
           B ("E5B9B4"),
           B ("E5B9B4"),
           B ("E4BB8EE4B88D"),
           B ("E4B880E6ACA1"),
           B ("E4B8A4E6ACA1"),
           B ("E6ACA1"),
           B ("E6ACA1"),
           B ("E7BAA6"),
           B ("E5B091E4BA8E"),
           B ("E6AF8FE7A792"),
           B ("E6AF8FE58886E9929F"),
           B ("E6AF8FE5B08FE697B6"),
           B ("E6AF8FE5A4A9"),
           B ("E6AF8FE591A8"),
           B ("E585B6E4BB96"),
           B ("E585B6E4BB96"))
        & Core_Locale_Catalog
          ("ar",
           B ("D8A7D984D8A2D986"),
           B ("D8A3D985D8B3"),
           B ("D8A7D984D98AD988D985"),
           B ("D8BAD8AFD98BD8A7"),
           B ("20D985D986D8B0"),
           B ("D8AED984D8A7D98420"),
           B ("D8ABD8A7D986D98AD8A9"),
           B ("D8ABD988D8A7D986D98D"),
           B ("D8AFD982D98AD982D8A9"),
           B ("D8AFD982D8A7D8A6D982"),
           B ("D8B3D8A7D8B9D8A9"),
           B ("D8B3D8A7D8B9D8A7D8AA"),
           B ("D98AD988D985"),
           B ("D8A3D98AD8A7D985"),
           B ("D8A3D8B3D8A8D988D8B9"),
           B ("D8A3D8B3D8A7D8A8D98AD8B9"),
           B ("D8B4D987D8B1"),
           B ("D8A3D8B4D987D8B1"),
           B ("D8B3D986D8A9"),
           B ("D8B3D986D988D8A7D8AA"),
           B ("D8A8D8A7D98AD8AA"),
           B ("D8A8D8A7D98AD8AAD8A7D8AA"),
           B ("20D8A3D984D981"),
           B ("20D985D984D98AD988D986"),
           B ("20D985D984D98AD8A7D8B1"),
           B ("20D8AAD8B1D98AD984D98AD988D986"),
           B ("D8A3D984D981"),
           B ("D985D984D98AD988D986"),
           B ("D985D984D98AD8A7D8B1"),
           B ("D8AAD8B1D98AD984D98AD988D986"),
           B ("D985D8AAD8B1"),
           B ("D8A3D985D8AAD8A7D8B1"),
           B ("D983D98AD984D988D985D8AAD8B1"),
           B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA"),
           B ("D8BAD8B1D8A7D985"),
           B ("D8BAD8B1D8A7D985D8A7D8AA"),
           B ("D983D98AD984D988D8BAD8B1D8A7D985"),
           B ("D983D98AD984D988D8BAD8B1D8A7D985D8A7D8AA"),
           B ("D984D8AAD8B1"),
           B ("D984D8AAD8B1D8A7D8AA"),
           B ("D8B3D986D8AAD98AD985D8AAD8B1"),
           B ("D8B3D986D8AAD98AD985D8AAD8B1D8A7D8AA"),
           B ("D985D984D98AD985D8AAD8B1"),
           B ("D985D984D98AD985D8AAD8B1D8A7D8AA"),
           B ("D985D984D98AD8BAD8B1D8A7D985"),
           B ("D985D984D98AD8BAD8B1D8A7D985D8A7D8AA"),
           B ("D985D984D98AD984D8AAD8B1"),
           B ("D985D984D98AD984D8AAD8B1D8A7D8AA"),
           B ("D988"))
        & Added_Core_Locale_Catalog
          ("ar",
           B ("D985D984D984D98A20D8ABD8A7D986D98AD8A9"),
           B ("D985D984D984D98A20D8ABD988D8A7D986D98D"),
           B ("D985D98AD983D8B1D988D8ABD8A7D986D98AD8A9"),
           B ("D985D98AD983D8B1D988D8ABD988D8A7D986D98D"),
           B ("D8A3D8B3D8A8D988D8B9"),
           B ("D8A3D8B3D8A7D8A8D98AD8B9"),
           B ("D8B4D987D8B1"),
           B ("D8A3D8B4D987D8B1"),
           B ("D8B3D986D8A9"),
           B ("D8B3D986D988D8A7D8AA"),
           B ("D8A3D8A8D8AFD98BD8A7"),
           B ("D985D8B1D8A920D988D8A7D8ADD8AFD8A9"),
           B ("D985D8B1D8AAD98AD986"),
           B ("D985D8B1D8A9"),
           B ("D985D8B1D8A7D8AA"),
           B ("D8AAD982D8B1D98AD8A8D98BD8A7"),
           B ("D8A3D982D98420D985D986"),
           B ("D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"),
           B ("D981D98A20D8A7D984D8AFD982D98AD982D8A9"),
           B ("D981D98A20D8A7D984D8B3D8A7D8B9D8A9"),
           B ("D981D98A20D8A7D984D98AD988D985"),
           B ("D981D98A20D8A7D984D8A3D8B3D8A8D988D8B9"),
           B ("D8A2D8AED8B1"),
           B ("D8A3D8AED8B1D989"))
        & Core_Locale_Catalog
          ("hi",
           B ("E0A485E0A4ADE0A580"),
           B ("E0A495E0A4B2"),
           B ("E0A486E0A49C"),
           B ("E0A495E0A4B2"),
           B ("20E0A4AAE0A4B9E0A4B2E0A587"),
           "",
           B ("E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A4BFE0A4A8E0A49F"),
           B ("E0A4AEE0A4BFE0A4A8E0A49F"),
           B ("E0A498E0A482E0A49FE0A4BE"),
           B ("E0A498E0A482E0A49FE0A587"),
           B ("E0A4A6E0A4BFE0A4A8"),
           B ("E0A4A6E0A4BFE0A4A8"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A4BE"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A587"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A4ACE0A4BEE0A487E0A49F"),
           B ("E0A4ACE0A4BEE0A487E0A49F"),
           B ("20E0A4B9E0A49CE0A4BCE0A4BEE0A4B0"),
           B ("20E0A4B2E0A4BEE0A496"),
           B ("20E0A495E0A4B0E0A58BE0A4A1E0A4BC"),
           B ("20E0A496E0A4B0E0A4AC"),
           B ("E0A4B9E0A49CE0A4BCE0A4BEE0A4B0"),
           B ("E0A4B2E0A4BEE0A496"),
           B ("E0A495E0A4B0E0A58BE0A4A1E0A4BC"),
           B ("E0A496E0A4B0E0A4AC"),
           B ("E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A495E0A4BFE0A4B2E0A58BE0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A4B8E0A587E0A482E0A49FE0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4B8E0A587E0A482E0A49FE0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4AEE0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A497E0A58DE0A4B0E0A4BEE0A4AE"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B2E0A580E0A49FE0A4B0"),
           B ("E0A494E0A4B0"))
        & Added_Core_Locale_Catalog
          ("hi",
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A4BFE0A4B2E0A580E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AEE0A4BEE0A487E0A495E0A58DE0A4B0E0A58BE0A4B8E0A587E0A495E0A4"
              & "82E0A4A1"),
           B ("E0A4AEE0A4BEE0A487E0A495E0A58DE0A4B0E0A58BE0A4B8E0A587E0A495E0A4"
              & "82E0A4A1"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A4BE"),
           B ("E0A4AEE0A4B9E0A580E0A4A8E0A587"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A4B8E0A4BEE0A4B2"),
           B ("E0A495E0A4ADE0A58020E0A4A8E0A4B9E0A580E0A482"),
           B ("E0A48FE0A49520E0A4ACE0A4BEE0A4B0"),
           B ("E0A4A6E0A58B20E0A4ACE0A4BEE0A4B0"),
           B ("E0A4ACE0A4BEE0A4B0"),
           B ("E0A4ACE0A4BEE0A4B0"),
           B ("E0A4B2E0A497E0A4ADE0A497"),
           B ("E0A4B8E0A58720E0A495E0A4AE"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4AEE0A4BFE0A4A8E0A49F"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4A6E0A4BFE0A4A8"),
           B ("E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A4AAE0A58DE0A4A4E0A4BEE0A4B9"),
           B ("E0A485E0A4A8E0A58DE0A4AF"),
           B ("E0A485E0A4A8E0A58DE0A4AF"));
   end New_Locale_Catalogs;

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
           English & Danish & German & French & Spanish & Italian & Portuguese
           & Added_Keys ("en")
           & Native_Added_Keys
             ("da", "millisekund", "millisekunder",
              "mikrosekund", "mikrosekunder",
              "uge", "uger", "m" & AA & "ned", "m" & AA & "neder",
              AA & "r", AA & "r", "aldrig", "en gang", "to gange",
              "gang", "gange", "cirka", "mindre end", "per sekund",
              "per minut", "per time", "per dag", "per uge",
              "anden", "andre")
           & Native_Added_Keys
             ("de", "Millisekunde", "Millisekunden",
              "Mikrosekunde", "Mikrosekunden",
              "Woche", "Wochen", "Monat", "Monate",
              "Jahr", "Jahre", "nie", "einmal", "zweimal",
              "Mal", "Mal", "ungefaehr", "weniger als", "pro Sekunde",
              "pro Minute", "pro Stunde", "pro Tag", "pro Woche",
              "andere", "andere")
           & Native_Added_Keys
             ("fr", "milliseconde", "millisecondes",
              "microseconde", "microsecondes",
              "semaine", "semaines", "mois", "mois",
              "an", "ans", "jamais", "une fois", "deux fois",
              "fois", "fois", "environ", "moins de", "par seconde",
              "par minute", "par heure", "par jour", "par semaine",
              "autre", "autres")
           & Native_Added_Keys
             ("es", "milisegundo", "milisegundos",
              "microsegundo", "microsegundos",
              "semana", "semanas", "mes", "meses",
              "a" & NTILDE & "o", "a" & NTILDE & "os",
              "nunca", "una vez", "dos veces", "vez", "veces",
              "aproximadamente", "menos de", "por segundo", "por minuto",
              "por hora", "por d" & IACUTE & "a", "por semana",
              "otro", "otros")
           & Native_Added_Keys
             ("it", "millisecondo", "millisecondi",
              "microsecondo", "microsecondi",
              "settimana", "settimane", "mese", "mesi",
              "anno", "anni", "mai", "una volta", "due volte",
              "volta", "volte", "circa", "meno di", "al secondo",
              "al minuto", "all'ora", "al giorno", "alla settimana",
              "altro", "altri")
           & Native_Added_Keys
             ("pt", "milissegundo", "milissegundos",
              "microssegundo", "microssegundos",
              "semana", "semanas", "m" & ECIRC & "s", "meses",
              "ano", "anos", "nunca", "uma vez", "duas vezes",
              "vez", "vezes", "aproximadamente", "menos de",
              "por segundo", "por minuto", "por hora", "por dia",
              "por semana", "outro", "outros")
           & Dutch_Core_Catalog
           & Dutch_Added_Keys
           & New_Locale_Catalogs,
         Result      => Result,
         Policy      => Policy);
   end Load_Defaults;

end Humanize.Catalogs;
