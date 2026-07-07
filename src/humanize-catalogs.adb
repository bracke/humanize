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

   function B (Hex : String) return String;

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

   function Added_Unit_Non_Latin_Tail (Locale : String) return String;

   function Extra_Unit_Non_Latin_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String;

   function Added_Unit_Keys_With_Tail
     (Locale                    : String;
      Celsius_Sing              : String;
      Celsius_Plural            : String;
      Fahrenheit_Sing           : String;
      Fahrenheit_Plural         : String;
      Square_Meter_Sing         : String;
      Square_Meter_Plural       : String;
      Hectare_Sing              : String;
      Hectare_Plural            : String;
      Kilometer_Per_Hour_Sing   : String;
      Kilometer_Per_Hour_Plural : String;
      Meter_Per_Second_Sing     : String;
      Meter_Per_Second_Plural   : String)
      return String
   is
   begin
      return
        Unit_Line (Locale, "celsius", Celsius_Sing, Celsius_Plural)
        & Unit_Line
            (Locale, "fahrenheit", Fahrenheit_Sing, Fahrenheit_Plural)
        & Unit_Line
            (Locale, "square_meter", Square_Meter_Sing, Square_Meter_Plural)
        & Unit_Line (Locale, "hectare", Hectare_Sing, Hectare_Plural)
        & Unit_Line
            (Locale, "kilometer_per_hour",
             Kilometer_Per_Hour_Sing, Kilometer_Per_Hour_Plural)
        & Unit_Line
            (Locale, "meter_per_second",
             Meter_Per_Second_Sing, Meter_Per_Second_Plural)
        & Added_Unit_Non_Latin_Tail (Locale);
   end Added_Unit_Keys_With_Tail;

   function Extra_Unit_Keys_With_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String
   is
   begin
      return Extra_Unit_Non_Latin_Tail
        (Locale, Teaspoon_Sing, Teaspoon_Plural);
   end Extra_Unit_Keys_With_Tail;

   pragma Style_Checks (Off);

   function Added_Unit_Non_Latin_Tail (Locale : String) return String is
   begin
      if Locale = "ru" then
         return
           Unit_Line (Locale, "pascal", B ("D0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BFD0B0D181D0BAD0B0D0BBD0B8"))
           & Unit_Line (Locale, "kilopascal", B ("D0BAD0B8D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BAD0B8D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD0B8"))
           & Unit_Line (Locale, "joule", B ("D0B4D0B6D0BED183D0BBD18C"), B ("D0B4D0B6D0BED183D0BBD0B8"))
           & Unit_Line (Locale, "kilojoule", B ("D0BAD0B8D0BBD0BED0B4D0B6D0BED183D0BBD18C"), B ("D0BAD0B8D0BBD0BED0B4D0B6D0BED183D0BBD0B8"))
           & Unit_Line (Locale, "watt", B ("D0B2D0B0D182D182"), B ("D0B2D0B0D182D182D18B"))
           & Unit_Line (Locale, "kilowatt", B ("D0BAD0B8D0BBD0BED0B2D0B0D182D182"), B ("D0BAD0B8D0BBD0BED0B2D0B0D182D182D18B"))
           & Unit_Line (Locale, "hertz", B ("D0B3D0B5D180D186"), B ("D0B3D0B5D180D186D18B"))
           & Unit_Line (Locale, "kilohertz", B ("D0BAD0B8D0BBD0BED0B3D0B5D180D186"), B ("D0BAD0B8D0BBD0BED0B3D0B5D180D186D18B"))
           & Unit_Line (Locale, "degree", B ("D0B3D180D0B0D0B4D183D181"), B ("D0B3D180D0B0D0B4D183D181D18B"))
           & Unit_Line (Locale, "mile", B ("D0BCD0B8D0BBD18F"), B ("D0BCD0B8D0BBD0B8"))
           & Unit_Line (Locale, "yard", B ("D18FD180D0B4"), B ("D18FD180D0B4D18B"))
           & Unit_Line (Locale, "foot", B ("D184D183D182"), B ("D184D183D182D18B"))
           & Unit_Line (Locale, "inch", B ("D0B4D18ED0B9D0BC"), B ("D0B4D18ED0B9D0BCD18B"))
           & Unit_Line (Locale, "gallon", B ("D0B3D0B0D0BBD0BBD0BED0BD"), B ("D0B3D0B0D0BBD0BBD0BED0BDD18B"))
           & Unit_Line (Locale, "pound", B ("D184D183D0BDD182"), B ("D184D183D0BDD182D18B"))
           & Unit_Line (Locale, "ounce", B ("D183D0BDD186D0B8D18F"), B ("D183D0BDD186D0B8D0B8"));
      elsif Locale = "uk" then
         return
           Unit_Line (Locale, "pascal", B ("D0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BFD0B0D181D0BAD0B0D0BBD196"))
           & Unit_Line (Locale, "kilopascal", B ("D0BAD196D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD18C"), B ("D0BAD196D0BBD0BED0BFD0B0D181D0BAD0B0D0BBD196"))
           & Unit_Line (Locale, "joule", B ("D0B4D0B6D0BED183D0BBD18C"), B ("D0B4D0B6D0BED183D0BBD196"))
           & Unit_Line (Locale, "kilojoule", B ("D0BAD196D0BBD0BED0B4D0B6D0BED183D0BBD18C"), B ("D0BAD196D0BBD0BED0B4D0B6D0BED183D0BBD196"))
           & Unit_Line (Locale, "watt", B ("D0B2D0B0D182"), B ("D0B2D0B0D182D0B8"))
           & Unit_Line (Locale, "kilowatt", B ("D0BAD196D0BBD0BED0B2D0B0D182"), B ("D0BAD196D0BBD0BED0B2D0B0D182D0B8"))
           & Unit_Line (Locale, "hertz", B ("D0B3D0B5D180D186"), B ("D0B3D0B5D180D186D0B8"))
           & Unit_Line (Locale, "kilohertz", B ("D0BAD196D0BBD0BED0B3D0B5D180D186"), B ("D0BAD196D0BBD0BED0B3D0B5D180D186D0B8"))
           & Unit_Line (Locale, "degree", B ("D0B3D180D0B0D0B4D183D181"), B ("D0B3D180D0B0D0B4D183D181D0B8"))
           & Unit_Line (Locale, "mile", B ("D0BCD0B8D0BBD18F"), B ("D0BCD0B8D0BBD196"))
           & Unit_Line (Locale, "yard", B ("D18FD180D0B4"), B ("D18FD180D0B4D0B8"))
           & Unit_Line (Locale, "foot", B ("D184D183D182"), B ("D184D183D182D0B8"))
           & Unit_Line (Locale, "inch", B ("D0B4D18ED0B9D0BC"), B ("D0B4D18ED0B9D0BCD0B8"))
           & Unit_Line (Locale, "gallon", B ("D0B3D0B0D0BBD0BED0BD"), B ("D0B3D0B0D0BBD0BED0BDD0B8"))
           & Unit_Line (Locale, "pound", B ("D184D183D0BDD182"), B ("D184D183D0BDD182D0B8"))
           & Unit_Line (Locale, "ounce", B ("D183D0BDD186D196D18F"), B ("D183D0BDD186D196D197"));
      elsif Locale = "ja" then
         return
           Unit_Line (Locale, "pascal", B ("E38391E382B9E382ABE383AB"), B ("E38391E382B9E382ABE383AB"))
           & Unit_Line (Locale, "kilopascal", B ("E382ADE383ADE38391E382B9E382ABE383AB"), B ("E382ADE383ADE38391E382B9E382ABE383AB"))
           & Unit_Line (Locale, "joule", B ("E382B8E383A5E383BCE383AB"), B ("E382B8E383A5E383BCE383AB"))
           & Unit_Line (Locale, "kilojoule", B ("E382ADE383ADE382B8E383A5E383BCE383AB"), B ("E382ADE383ADE382B8E383A5E383BCE383AB"))
           & Unit_Line (Locale, "watt", B ("E383AFE38383E38388"), B ("E383AFE38383E38388"))
           & Unit_Line (Locale, "kilowatt", B ("E382ADE383ADE383AFE38383E38388"), B ("E382ADE383ADE383AFE38383E38388"))
           & Unit_Line (Locale, "hertz", B ("E38398E383ABE38384"), B ("E38398E383ABE38384"))
           & Unit_Line (Locale, "kilohertz", B ("E382ADE383ADE38398E383ABE38384"), B ("E382ADE383ADE38398E383ABE38384"))
           & Unit_Line (Locale, "degree", B ("E5BAA6"), B ("E5BAA6"))
           & Unit_Line (Locale, "mile", B ("E3839EE382A4E383AB"), B ("E3839EE382A4E383AB"))
           & Unit_Line (Locale, "yard", B ("E383A4E383BCE38389"), B ("E383A4E383BCE38389"))
           & Unit_Line (Locale, "foot", B ("E38395E382A3E383BCE38388"), B ("E38395E382A3E383BCE38388"))
           & Unit_Line (Locale, "inch", B ("E382A4E383B3E38381"), B ("E382A4E383B3E38381"))
           & Unit_Line (Locale, "gallon", B ("E382ACE383ADE383B3"), B ("E382ACE383ADE383B3"))
           & Unit_Line (Locale, "pound", B ("E3839DE383B3E38389"), B ("E3839DE383B3E38389"))
           & Unit_Line (Locale, "ounce", B ("E382AAE383B3E382B9"), B ("E382AAE383B3E382B9"));
      elsif Locale = "ko" then
         return
           Unit_Line (Locale, "pascal", B ("ED8C8CEC8AA4ECB9BC"), B ("ED8C8CEC8AA4ECB9BC"))
           & Unit_Line (Locale, "kilopascal", B ("ED82ACEBA19CED8C8CEC8AA4ECB9BC"), B ("ED82ACEBA19CED8C8CEC8AA4ECB9BC"))
           & Unit_Line (Locale, "joule", B ("ECA484"), B ("ECA484"))
           & Unit_Line (Locale, "kilojoule", B ("ED82ACEBA19CECA484"), B ("ED82ACEBA19CECA484"))
           & Unit_Line (Locale, "watt", B ("EC9980ED8AB8"), B ("EC9980ED8AB8"))
           & Unit_Line (Locale, "kilowatt", B ("ED82ACEBA19CEC9980ED8AB8"), B ("ED82ACEBA19CEC9980ED8AB8"))
           & Unit_Line (Locale, "hertz", B ("ED97A4EBA5B4ECB8A0"), B ("ED97A4EBA5B4ECB8A0"))
           & Unit_Line (Locale, "kilohertz", B ("ED82ACEBA19CED97A4EBA5B4ECB8A0"), B ("ED82ACEBA19CED97A4EBA5B4ECB8A0"))
           & Unit_Line (Locale, "degree", B ("EB8F84"), B ("EB8F84"))
           & Unit_Line (Locale, "mile", B ("EBA788EC9DBC"), B ("EBA788EC9DBC"))
           & Unit_Line (Locale, "yard", B ("EC95BCEB939C"), B ("EC95BCEB939C"))
           & Unit_Line (Locale, "foot", B ("ED94BCED8AB8"), B ("ED94BCED8AB8"))
           & Unit_Line (Locale, "inch", B ("EC9DB8ECB998"), B ("EC9DB8ECB998"))
           & Unit_Line (Locale, "gallon", B ("EAB0A4EB9FB0"), B ("EAB0A4EB9FB0"))
           & Unit_Line (Locale, "pound", B ("ED8C8CEC9AB4EB939C"), B ("ED8C8CEC9AB4EB939C"))
           & Unit_Line (Locale, "ounce", B ("EC98A8EC8AA4"), B ("EC98A8EC8AA4"));
      elsif Locale = "zh" then
         return
           Unit_Line (Locale, "pascal", B ("E5B895E696AFE58DA1"), B ("E5B895E696AFE58DA1"))
           & Unit_Line (Locale, "kilopascal", B ("E58D83E5B895"), B ("E58D83E5B895"))
           & Unit_Line (Locale, "joule", B ("E784A6E880B3"), B ("E784A6E880B3"))
           & Unit_Line (Locale, "kilojoule", B ("E58D83E784A6"), B ("E58D83E784A6"))
           & Unit_Line (Locale, "watt", B ("E793A6E789B9"), B ("E793A6E789B9"))
           & Unit_Line (Locale, "kilowatt", B ("E58D83E793A6"), B ("E58D83E793A6"))
           & Unit_Line (Locale, "hertz", B ("E8B5ABE585B9"), B ("E8B5ABE585B9"))
           & Unit_Line (Locale, "kilohertz", B ("E58D83E8B5AB"), B ("E58D83E8B5AB"))
           & Unit_Line (Locale, "degree", B ("E5BAA6"), B ("E5BAA6"))
           & Unit_Line (Locale, "mile", B ("E88BB1E9878C"), B ("E88BB1E9878C"))
           & Unit_Line (Locale, "yard", B ("E7A081"), B ("E7A081"))
           & Unit_Line (Locale, "foot", B ("E88BB1E5B0BA"), B ("E88BB1E5B0BA"))
           & Unit_Line (Locale, "inch", B ("E88BB1E5AFB8"), B ("E88BB1E5AFB8"))
           & Unit_Line (Locale, "gallon", B ("E58AA0E4BB91"), B ("E58AA0E4BB91"))
           & Unit_Line (Locale, "pound", B ("E7A385"), B ("E7A385"))
           & Unit_Line (Locale, "ounce", B ("E79B8EE58FB8"), B ("E79B8EE58FB8"));
      elsif Locale = "ar" then
         return
           Unit_Line (Locale, "pascal", B ("D8A8D8A7D8B3D983D8A7D984"), B ("D8A8D8A7D8B3D983D8A7D984"))
           & Unit_Line (Locale, "kilopascal", B ("D983D98AD984D988D8A8D8A7D8B3D983D8A7D984"), B ("D983D98AD984D988D8A8D8A7D8B3D983D8A7D984"))
           & Unit_Line (Locale, "joule", B ("D8ACD988D984"), B ("D8ACD988D984D8A7D8AA"))
           & Unit_Line (Locale, "kilojoule", B ("D983D98AD984D988D8ACD988D984"), B ("D983D98AD984D988D8ACD988D984D8A7D8AA"))
           & Unit_Line (Locale, "watt", B ("D988D8A7D8B7"), B ("D988D8A7D8B7D8A7D8AA"))
           & Unit_Line (Locale, "kilowatt", B ("D983D98AD984D988D988D8A7D8B7"), B ("D983D98AD984D988D988D8A7D8B7D8A7D8AA"))
           & Unit_Line (Locale, "hertz", B ("D987D8B1D8AAD8B2"), B ("D987D8B1D8AAD8B2"))
           & Unit_Line (Locale, "kilohertz", B ("D983D98AD984D988D987D8B1D8AAD8B2"), B ("D983D98AD984D988D987D8B1D8AAD8B2"))
           & Unit_Line (Locale, "degree", B ("D8AFD8B1D8ACD8A9"), B ("D8AFD8B1D8ACD8A7D8AA"))
           & Unit_Line (Locale, "mile", B ("D985D98AD984"), B ("D8A3D985D98AD8A7D984"))
           & Unit_Line (Locale, "yard", B ("D98AD8A7D8B1D8AFD8A9"), B ("D98AD8A7D8B1D8AFD8A7D8AA"))
           & Unit_Line (Locale, "foot", B ("D982D8AFD985"), B ("D8A3D982D8AFD8A7D985"))
           & Unit_Line (Locale, "inch", B ("D8A8D988D8B5D8A9"), B ("D8A8D988D8B5D8A7D8AA"))
           & Unit_Line (Locale, "gallon", B ("D8BAD8A7D984D988D986"), B ("D8BAD8A7D984D988D986D8A7D8AA"))
           & Unit_Line (Locale, "pound", B ("D8B1D8B7D984"), B ("D8A3D8B1D8B7D8A7D984"))
           & Unit_Line (Locale, "ounce", B ("D8A3D988D986D8B5D8A9"), B ("D8A3D988D986D8B5D8A7D8AA"));
      elsif Locale = "hi" then
         return
           Unit_Line (Locale, "pascal", B ("E0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"), B ("E0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"))
           & Unit_Line (Locale, "kilopascal", B ("E0A495E0A4BFE0A4B2E0A58BE0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"), B ("E0A495E0A4BFE0A4B2E0A58BE0A4AAE0A4BEE0A4B8E0A58DE0A495E0A4B2"))
           & Unit_Line (Locale, "joule", B ("E0A49CE0A582E0A4B2"), B ("E0A49CE0A582E0A4B2"))
           & Unit_Line (Locale, "kilojoule", B ("E0A495E0A4BFE0A4B2E0A58BE0A49CE0A582E0A4B2"), B ("E0A495E0A4BFE0A4B2E0A58BE0A49CE0A582E0A4B2"))
           & Unit_Line (Locale, "watt", B ("E0A4B5E0A4BEE0A49F"), B ("E0A4B5E0A4BEE0A49F"))
           & Unit_Line (Locale, "kilowatt", B ("E0A495E0A4BFE0A4B2E0A58BE0A4B5E0A4BEE0A49F"), B ("E0A495E0A4BFE0A4B2E0A58BE0A4B5E0A4BEE0A49F"))
           & Unit_Line (Locale, "hertz", B ("E0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"), B ("E0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"))
           & Unit_Line (Locale, "kilohertz", B ("E0A495E0A4BFE0A4B2E0A58BE0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"), B ("E0A495E0A4BFE0A4B2E0A58BE0A4B9E0A4B0E0A58DE0A49FE0A58DE0A49C"))
           & Unit_Line (Locale, "degree", B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A580"), B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A580"))
           & Unit_Line (Locale, "mile", B ("E0A4AEE0A580E0A4B2"), B ("E0A4AEE0A580E0A4B2"))
           & Unit_Line (Locale, "yard", B ("E0A497E0A49C"), B ("E0A497E0A49C"))
           & Unit_Line (Locale, "foot", B ("E0A4ABE0A581E0A49F"), B ("E0A4ABE0A581E0A49F"))
           & Unit_Line (Locale, "inch", B ("E0A487E0A482E0A49A"), B ("E0A487E0A482E0A49A"))
           & Unit_Line (Locale, "gallon", B ("E0A497E0A588E0A4B2E0A4A8"), B ("E0A497E0A588E0A4B2E0A4A8"))
           & Unit_Line (Locale, "pound", B ("E0A4AAE0A4BEE0A489E0A482E0A4A1"), B ("E0A4AAE0A4BEE0A489E0A482E0A4A1"))
           & Unit_Line (Locale, "ounce", B ("E0A494E0A482E0A4B8"), B ("E0A494E0A482E0A4B8"));
      else
         return
           Unit_Line (Locale, "pascal", "pascal", "pascals")
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
   end Added_Unit_Non_Latin_Tail;

   function Extra_Unit_Non_Latin_Tail
     (Locale          : String;
      Teaspoon_Sing   : String;
      Teaspoon_Plural : String)
      return String
   is
   begin
      if Locale = "ru" then
         return
           Unit_Line (Locale, "nautical_mile", B ("D0BCD0BED180D181D0BAD0B0D18F20D0BCD0B8D0BBD18F"), B ("D0BCD0BED180D181D0BAD0B8D0B520D0BCD0B8D0BBD0B8"))
           & Unit_Line (Locale, "acre", B ("D0B0D0BAD180"), B ("D0B0D0BAD180D18B"))
           & Unit_Line (Locale, "square_kilometer", B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B920D0BAD0B8D0BBD0BED0BCD0B5D182D180"), B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B520D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B"))
           & Unit_Line (Locale, "cubic_meter", B ("D0BAD183D0B1D0B8D187D0B5D181D0BAD0B8D0B920D0BCD0B5D182D180"), B ("D0BAD183D0B1D0B8D187D0B5D181D0BAD0B8D0B520D0BCD0B5D182D180D18B"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("D181D182D0BED0BBD0BED0B2D0B0D18F20D0BBD0BED0B6D0BAD0B0"), B ("D181D182D0BED0BBD0BED0B2D18BD0B520D0BBD0BED0B6D0BAD0B8"))
           & Unit_Line (Locale, "cup", B ("D187D0B0D188D0BAD0B0"), B ("D187D0B0D188D0BAD0B8"))
           & Unit_Line (Locale, "stone", B ("D181D182D0BED183D0BD"), B ("D181D182D0BED183D0BDD18B"))
           & Unit_Line (Locale, "tonne", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD18B"))
           & Unit_Line (Locale, "ton", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD18B"));
      elsif Locale = "uk" then
         return
           Unit_Line (Locale, "nautical_mile", B ("D0BCD0BED180D181D18CD0BAD0B020D0BCD0B8D0BBD18F"), B ("D0BCD0BED180D181D18CD0BAD19620D0BCD0B8D0BBD196"))
           & Unit_Line (Locale, "acre", B ("D0B0D0BAD180"), B ("D0B0D0BAD180D0B8"))
           & Unit_Line (Locale, "square_kilometer", B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD0B8D0B920D0BAD196D0BBD0BED0BCD0B5D182D180"), B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD19620D0BAD196D0BBD0BED0BCD0B5D182D180D0B8"))
           & Unit_Line (Locale, "cubic_meter", B ("D0BAD183D0B1D196D187D0BDD0B8D0B920D0BCD0B5D182D180"), B ("D0BAD183D0B1D196D187D0BDD19620D0BCD0B5D182D180D0B8"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("D181D182D0BED0BBD0BED0B2D0B020D0BBD0BED0B6D0BAD0B0"), B ("D181D182D0BED0BBD0BED0B2D19620D0BBD0BED0B6D0BAD0B8"))
           & Unit_Line (Locale, "cup", B ("D187D0B0D188D0BAD0B0"), B ("D187D0B0D188D0BAD0B8"))
           & Unit_Line (Locale, "stone", B ("D181D182D0BED183D0BD"), B ("D181D182D0BED183D0BDD0B8"))
           & Unit_Line (Locale, "tonne", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD0B8"))
           & Unit_Line (Locale, "ton", B ("D182D0BED0BDD0BDD0B0"), B ("D182D0BED0BDD0BDD0B8"));
      elsif Locale = "ja" then
         return
           Unit_Line (Locale, "nautical_mile", B ("E6B5B7E9878C"), B ("E6B5B7E9878C"))
           & Unit_Line (Locale, "acre", B ("E382A8E383BCE382ABE383BC"), B ("E382A8E383BCE382ABE383BC"))
           & Unit_Line (Locale, "square_kilometer", B ("E5B9B3E696B9E382ADE383ADE383A1E383BCE38388E383AB"), B ("E5B9B3E696B9E382ADE383ADE383A1E383BCE38388E383AB"))
           & Unit_Line (Locale, "cubic_meter", B ("E7AB8BE696B9E383A1E383BCE38388E383AB"), B ("E7AB8BE696B9E383A1E383BCE38388E383AB"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("E5A4A7E38195E38198"), B ("E5A4A7E38195E38198"))
           & Unit_Line (Locale, "cup", B ("E382ABE38383E38397"), B ("E382ABE38383E38397"))
           & Unit_Line (Locale, "stone", B ("E382B9E38388E383BCE383B3"), B ("E382B9E38388E383BCE383B3"))
           & Unit_Line (Locale, "tonne", B ("E38388E383B3"), B ("E38388E383B3"))
           & Unit_Line (Locale, "ton", B ("E382B7E383A7E383BCE38388E38388E383B3"), B ("E382B7E383A7E383BCE38388E38388E383B3"));
      elsif Locale = "ko" then
         return
           Unit_Line (Locale, "nautical_mile", B ("ED95B4EBA6AC"), B ("ED95B4EBA6AC"))
           & Unit_Line (Locale, "acre", B ("EC9790EC9DB4ECBBA4"), B ("EC9790EC9DB4ECBBA4"))
           & Unit_Line (Locale, "square_kilometer", B ("ECA09CEAB3B1ED82ACEBA19CEBAFB8ED84B0"), B ("ECA09CEAB3B1ED82ACEBA19CEBAFB8ED84B0"))
           & Unit_Line (Locale, "cubic_meter", B ("EC84B8ECA09CEAB3B1EBAFB8ED84B0"), B ("EC84B8ECA09CEAB3B1EBAFB8ED84B0"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("ED858CEC9DB4EBB894EC8AA4ED91BC"), B ("ED858CEC9DB4EBB894EC8AA4ED91BC"))
           & Unit_Line (Locale, "cup", B ("ECBBB5"), B ("ECBBB5"))
           & Unit_Line (Locale, "stone", B ("EC8AA4ED86A4"), B ("EC8AA4ED86A4"))
           & Unit_Line (Locale, "tonne", B ("ED86A4"), B ("ED86A4"))
           & Unit_Line (Locale, "ton", B ("EC87BCED8AB8ED86A4"), B ("EC87BCED8AB8ED86A4"));
      elsif Locale = "zh" then
         return
           Unit_Line (Locale, "nautical_mile", B ("E6B5B7E9878C"), B ("E6B5B7E9878C"))
           & Unit_Line (Locale, "acre", B ("E88BB1E4BAA9"), B ("E88BB1E4BAA9"))
           & Unit_Line (Locale, "square_kilometer", B ("E5B9B3E696B9E58D83E7B1B3"), B ("E5B9B3E696B9E58D83E7B1B3"))
           & Unit_Line (Locale, "cubic_meter", B ("E7AB8BE696B9E7B1B3"), B ("E7AB8BE696B9E7B1B3"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("E6B1A4E58C99"), B ("E6B1A4E58C99"))
           & Unit_Line (Locale, "cup", B ("E69DAF"), B ("E69DAF"))
           & Unit_Line (Locale, "stone", B ("E88BB1E79FB3"), B ("E88BB1E79FB3"))
           & Unit_Line (Locale, "tonne", B ("E590A8"), B ("E590A8"))
           & Unit_Line (Locale, "ton", B ("E79FADE590A8"), B ("E79FADE590A8"));
      elsif Locale = "ar" then
         return
           Unit_Line (Locale, "nautical_mile", B ("D985D98AD98420D8A8D8ADD8B1D98A"), B ("D8A3D985D98AD8A7D98420D8A8D8ADD8B1D98AD8A9"))
           & Unit_Line (Locale, "acre", B ("D981D8AFD8A7D986"), B ("D8A3D981D8AFD986D8A9"))
           & Unit_Line (Locale, "square_kilometer", B ("D983D98AD984D988D985D8AAD8B120D985D8B1D8A8D8B9"), B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA20D985D8B1D8A8D8B9D8A9"))
           & Unit_Line (Locale, "cubic_meter", B ("D985D8AAD8B120D985D983D8B9D8A8"), B ("D8A3D985D8AAD8A7D8B120D985D983D8B9D8A8D8A9"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("D985D984D8B9D982D8A920D983D8A8D98AD8B1D8A9"), B ("D985D984D8A7D8B9D98220D983D8A8D98AD8B1D8A9"))
           & Unit_Line (Locale, "cup", B ("D983D988D8A8"), B ("D8A3D983D988D8A7D8A8"))
           & Unit_Line (Locale, "stone", B ("D8B3D8AAD988D986"), B ("D8B3D8AAD988D986"))
           & Unit_Line (Locale, "tonne", B ("D8B7D98620D985D8AAD8B1D98A"), B ("D8A3D8B7D986D8A7D98620D985D8AAD8B1D98AD8A9"))
           & Unit_Line (Locale, "ton", B ("D8B7D986"), B ("D8A3D8B7D986D8A7D986"));
      elsif Locale = "hi" then
         return
           Unit_Line (Locale, "nautical_mile", B ("E0A4B8E0A4AEE0A581E0A4A6E0A58DE0A4B0E0A58020E0A4AEE0A580E0A4B2"), B ("E0A4B8E0A4AEE0A581E0A4A6E0A58DE0A4B0E0A58020E0A4AEE0A580E0A4B2"))
           & Unit_Line (Locale, "acre", B ("E0A48FE0A495E0A4A1E0A4BC"), B ("E0A48FE0A495E0A4A1E0A4BC"))
           & Unit_Line (Locale, "square_kilometer", B ("E0A4B5E0A4B0E0A58DE0A49720E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"), B ("E0A4B5E0A4B0E0A58DE0A49720E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"))
           & Unit_Line (Locale, "cubic_meter", B ("E0A498E0A4A820E0A4AEE0A580E0A49FE0A4B0"), B ("E0A498E0A4A820E0A4AEE0A580E0A49FE0A4B0"))
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", B ("E0A4ACE0A4A1E0A4BCE0A4BE20E0A49AE0A4AEE0A58DE0A4AEE0A49A"), B ("E0A4ACE0A4A1E0A4BCE0A58720E0A49AE0A4AEE0A58DE0A4AEE0A49A"))
           & Unit_Line (Locale, "cup", B ("E0A495E0A4AA"), B ("E0A495E0A4AA"))
           & Unit_Line (Locale, "stone", B ("E0A4B8E0A58DE0A49FE0A58BE0A4A8"), B ("E0A4B8E0A58DE0A49FE0A58BE0A4A8"))
           & Unit_Line (Locale, "tonne", B ("E0A49FE0A4A8"), B ("E0A49FE0A4A8"))
           & Unit_Line (Locale, "ton", B ("E0A49BE0A58BE0A49FE0A4BE20E0A49FE0A4A8"), B ("E0A49BE0A58BE0A49FE0A58720E0A49FE0A4A8"));
      elsif Locale = "ro" then
         return
           Unit_Line (Locale, "nautical_mile", "mila nautica", "mile nautice")
           & Unit_Line (Locale, "acre", "acru", "acri")
           & Unit_Line (Locale, "square_kilometer", "kilometru patrat", "kilometri patrati")
           & Unit_Line (Locale, "cubic_meter", "metru cub", "metri cubi")
           & Unit_Line (Locale, "teaspoon", "lingurita", "lingurite")
           & Unit_Line (Locale, "tablespoon", "lingura", "linguri")
           & Unit_Line (Locale, "cup", "cana", "cani")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tone")
           & Unit_Line (Locale, "ton", "tona scurta", "tone scurte");
      elsif Locale = "lt" then
         return
           Unit_Line (Locale, "nautical_mile", "jurmyli", "jurmyles")
           & Unit_Line (Locale, "acre", "akras", "akrai")
           & Unit_Line (Locale, "square_kilometer", "kvadratinis kilometras", "kvadratiniai kilometrai")
           & Unit_Line (Locale, "cubic_meter", "kubinis metras", "kubiniai metrai")
           & Unit_Line (Locale, "teaspoon", "arbatinis saukstelis", "arbatiniai sauksteliai")
           & Unit_Line (Locale, "tablespoon", "valgomasis saukstas", "valgomieji saukstai")
           & Unit_Line (Locale, "cup", "puodelis", "puodeliai")
           & Unit_Line (Locale, "stone", "stounas", "stounai")
           & Unit_Line (Locale, "tonne", "tona", "tonos")
           & Unit_Line (Locale, "ton", "trumpoji tona", "trumposios tonos");
      elsif Locale = "sl" then
         return
           Unit_Line (Locale, "nautical_mile", "navticna milja", "navticne milje")
           & Unit_Line (Locale, "acre", "aker", "akri")
           & Unit_Line (Locale, "square_kilometer", "kvadratni kilometer", "kvadratni kilometri")
           & Unit_Line (Locale, "cubic_meter", "kubicni meter", "kubicni metri")
           & Unit_Line (Locale, "teaspoon", "cajna zlicka", "cajne zlicke")
           & Unit_Line (Locale, "tablespoon", "jedilna zlica", "jedilne zlice")
           & Unit_Line (Locale, "cup", "skodelica", "skodelice")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tone")
           & Unit_Line (Locale, "ton", "kratka tona", "kratke tone");
      elsif Locale = "id" or else Locale = "ms" then
         return
           Unit_Line (Locale, "nautical_mile", "mil laut", "mil laut")
           & Unit_Line (Locale, "acre", "ekar", "ekar")
           & Unit_Line (Locale, "square_kilometer", "kilometer persegi", "kilometer persegi")
           & Unit_Line (Locale, "cubic_meter", "meter kubik", "meter kubik")
           & Unit_Line (Locale, "teaspoon", "sendok teh", "sendok teh")
           & Unit_Line (Locale, "tablespoon", "sendok makan", "sendok makan")
           & Unit_Line (Locale, "cup", "cangkir", "cangkir")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton metrik", "ton metrik")
           & Unit_Line (Locale, "ton", "ton pendek", "ton pendek");
      elsif Locale = "eo" then
         return
           Unit_Line (Locale, "nautical_mile", "nautika mejlo", "nautikaj mejloj")
           & Unit_Line (Locale, "acre", "akreo", "akreoj")
           & Unit_Line (Locale, "square_kilometer", "kvadrata kilometro", "kvadrataj kilometroj")
           & Unit_Line (Locale, "cubic_meter", "kuba metro", "kubaj metroj")
           & Unit_Line (Locale, "teaspoon", "tekulero", "tekuleroj")
           & Unit_Line (Locale, "tablespoon", "supkulero", "supkuleroj")
           & Unit_Line (Locale, "cup", "taso", "tasoj")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tuno", "tunoj")
           & Unit_Line (Locale, "ton", "mallonga tuno", "mallongaj tunoj");
      elsif Locale = "vi" then
         return
           Unit_Line (Locale, "nautical_mile", "hai ly", "hai ly")
           & Unit_Line (Locale, "acre", "mau Anh", "mau Anh")
           & Unit_Line (Locale, "square_kilometer", "kilomet vuong", "kilomet vuong")
           & Unit_Line (Locale, "cubic_meter", "met khoi", "met khoi")
           & Unit_Line (Locale, "teaspoon", "thia ca phe", "thia ca phe")
           & Unit_Line (Locale, "tablespoon", "thia canh", "thia canh")
           & Unit_Line (Locale, "cup", "coc", "coc")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tan", "tan")
           & Unit_Line (Locale, "ton", "tan ngan", "tan ngan");
      elsif Locale = "sw" then
         return
           Unit_Line (Locale, "nautical_mile", "maili ya baharini", "maili za baharini")
           & Unit_Line (Locale, "acre", "ekari", "ekari")
           & Unit_Line (Locale, "square_kilometer", "kilomita ya mraba", "kilomita za mraba")
           & Unit_Line (Locale, "cubic_meter", "mita ya ujazo", "mita za ujazo")
           & Unit_Line (Locale, "teaspoon", "kijiko cha chai", "vijiko vya chai")
           & Unit_Line (Locale, "tablespoon", "kijiko cha chakula", "vijiko vya chakula")
           & Unit_Line (Locale, "cup", "kikombe", "vikombe")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tani", "tani")
           & Unit_Line (Locale, "ton", "tani fupi", "tani fupi");
      elsif Locale = "af" then
         return
           Unit_Line (Locale, "nautical_mile", "seemyl", "seemyl")
           & Unit_Line (Locale, "acre", "akker", "akker")
           & Unit_Line (Locale, "square_kilometer", "vierkante kilometer", "vierkante kilometer")
           & Unit_Line (Locale, "cubic_meter", "kubieke meter", "kubieke meter")
           & Unit_Line (Locale, "teaspoon", "teelepel", "teelepels")
           & Unit_Line (Locale, "tablespoon", "eetlepel", "eetlepels")
           & Unit_Line (Locale, "cup", "koppie", "koppies")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton", "ton")
           & Unit_Line (Locale, "ton", "kort ton", "kort ton");
      elsif Locale = "hu" then
         return
           Unit_Line (Locale, "nautical_mile", "tengeri merfold", "tengeri merfold")
           & Unit_Line (Locale, "acre", "acre", "acre")
           & Unit_Line (Locale, "square_kilometer", "negyzetkilometer", "negyzetkilometer")
           & Unit_Line (Locale, "cubic_meter", "kobmeter", "kobmeter")
           & Unit_Line (Locale, "teaspoon", "teaskanal", "teaskanal")
           & Unit_Line (Locale, "tablespoon", "evokanal", "evokanal")
           & Unit_Line (Locale, "cup", "csesze", "csesze")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonna", "tonna")
           & Unit_Line (Locale, "ton", "rovid tonna", "rovid tonna");
      elsif Locale = "sk" then
         return
           Unit_Line (Locale, "nautical_mile", "namorna mila", "namorne mile")
           & Unit_Line (Locale, "acre", "aker", "akre")
           & Unit_Line (Locale, "square_kilometer", "stvorcovy kilometer", "stvorcove kilometre")
           & Unit_Line (Locale, "cubic_meter", "kubicky meter", "kubicke metre")
           & Unit_Line (Locale, "teaspoon", "cajova lyzicka", "cajove lyzicky")
           & Unit_Line (Locale, "tablespoon", "polievkova lyzica", "polievkove lyzice")
           & Unit_Line (Locale, "cup", "salku", "salky")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tony")
           & Unit_Line (Locale, "ton", "kratka tona", "kratke tony");
      else
         return
           Unit_Line (Locale, "nautical_mile", "nautical mile", "nautical miles")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line
               (Locale, "square_kilometer",
                "square kilometer", "square kilometers")
           & Unit_Line (Locale, "cubic_meter", "cubic meter", "cubic meters")
           & Unit_Line (Locale, "teaspoon", Teaspoon_Sing, Teaspoon_Plural)
           & Unit_Line (Locale, "tablespoon", "tablespoon", "tablespoons")
           & Unit_Line (Locale, "cup", "cup", "cups")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonne", "tonnes")
           & Unit_Line (Locale, "ton", "ton", "tons");
      end if;
   end Extra_Unit_Non_Latin_Tail;

   pragma Style_Checks (On);

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
           & Unit_Line (Locale, "foot", B ("4675C39F"), B ("4675C39F"))
           & Unit_Line (Locale, "inch", "Zoll", "Zoll")
           & Unit_Line (Locale, "gallon", "Gallone", "Gallonen")
           & Unit_Line (Locale, "pound", "Pfund", "Pfund")
           & Unit_Line (Locale, "ounce", "Unze", "Unzen");
      elsif Locale = "fr" then
         return
           Unit_Line
             (Locale, "celsius", B ("64656772C3A92043656C73697573"),
              B ("64656772C3A9732043656C73697573"))
           & Unit_Line
             (Locale, "fahrenheit",
              B ("64656772C3A92046616872656E68656974"),
              B ("64656772C3A9732046616872656E68656974"))
           & Unit_Line
             (Locale, "square_meter",
              B ("6DC3A87472652063617272C3A9"),
              B ("6DC3A8747265732063617272C3A973"))
           & Unit_Line (Locale, "hectare", "hectare", "hectares")
           & Unit_Line
             (Locale, "kilometer_per_hour",
              B ("6B696C6F6DC3A874726520706172206865757265"),
              B ("6B696C6F6DC3A87472657320706172206865757265"))
           & Unit_Line
             (Locale, "meter_per_second",
              B ("6DC3A874726520706172207365636F6E6465"),
              B ("6DC3A87472657320706172207365636F6E6465"))
           & Unit_Line (Locale, "pascal", "pascal", "pascals")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascals")
           & Unit_Line (Locale, "joule", "joule", "joules")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoules")
           & Unit_Line (Locale, "watt", "watt", "watts")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatts")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line
             (Locale, "degree", B ("64656772C3A9"),
              B ("64656772C3A973"))
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
           & Unit_Line
             (Locale, "hectare", B ("68656374C3A1726561"),
              B ("68656374C3A172656173"))
           & Unit_Line
             (Locale, "kilometer_per_hour",
              B ("6B696CC3B36D6574726F20706F7220686F7261"),
              B ("6B696CC3B36D6574726F7320706F7220686F7261"))
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
           & Unit_Line
             (Locale, "kilometer_per_hour",
              B ("7175696CC3B46D6574726F20706F7220686F7261"),
              B ("7175696CC3B46D6574726F7320706F7220686F7261"))
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
           & Unit_Line (Locale, "foot", B ("70C3A9"), B ("70C3A973"))
           & Unit_Line (Locale, "inch", "polegada", "polegadas")
           & Unit_Line (Locale, "gallon", B ("67616CC3A36F"), B ("67616CC3B56573"))
           & Unit_Line (Locale, "pound", "libra", "libras")
           & Unit_Line (Locale, "ounce", B ("6F6EC3A761"), B ("6F6EC3A76173"));
      elsif Locale = "sv" then
         return
           Unit_Line (Locale, "celsius", "grad Celsius", "grader Celsius")
           & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grader Fahrenheit")
           & Unit_Line (Locale, "square_meter", "kvadratmeter", "kvadratmeter")
           & Unit_Line (Locale, "hectare", "hektar", "hektar")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer i timmen", "kilometer i timmen")
           & Unit_Line (Locale, "meter_per_second", "meter per sekund", "meter per sekund")
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
           & Unit_Line (Locale, "foot", "fot", B ("66C3B674746572"))
           & Unit_Line (Locale, "inch", "tum", "tum")
           & Unit_Line (Locale, "gallon", "gallon", "gallon")
           & Unit_Line (Locale, "pound", "pund", "pund")
           & Unit_Line (Locale, "ounce", "uns", "uns");
      elsif Locale = "no" or else Locale = "nb" then
         return
           Unit_Line (Locale, "celsius", "grad Celsius", "grader Celsius")
           & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grader Fahrenheit")
           & Unit_Line (Locale, "square_meter", "kvadratmeter", "kvadratmeter")
           & Unit_Line (Locale, "hectare", "hektar", "hektar")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer i timen", "kilometer i timen")
           & Unit_Line (Locale, "meter_per_second", "meter per sekund", "meter per sekund")
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
           & Unit_Line (Locale, "foot", "fot", B ("66C3B874746572"))
           & Unit_Line (Locale, "inch", "tomme", "tommer")
           & Unit_Line (Locale, "gallon", "gallon", "gallon")
           & Unit_Line (Locale, "pound", "pund", "pund")
           & Unit_Line (Locale, "ounce", "unse", "unser");
      elsif Locale = "fi" then
         return
           Unit_Line (Locale, "celsius", "celsiusaste", "celsiusastetta")
           & Unit_Line (Locale, "fahrenheit", "fahrenheitaste", "fahrenheitastetta")
           & Unit_Line
               (Locale, "square_meter",
                B ("6E656C69C3B66D65747269"),
                B ("6E656C69C3B66D65747269C3A4"))
           & Unit_Line (Locale, "hectare", "hehtaari", "hehtaaria")
           & Unit_Line
               (Locale, "kilometer_per_hour", "kilometri tunnissa",
                B ("6B696C6F6D65747269C3A42074756E6E69737361"))
           & Unit_Line
               (Locale, "meter_per_second", "metri sekunnissa",
                B ("6D65747269C3A42073656B756E6E69737361"))
           & Unit_Line (Locale, "pascal", "pascal", "pascalia")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascalia")
           & Unit_Line (Locale, "joule", "joule", "joulea")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoulea")
           & Unit_Line (Locale, "watt", "watti", "wattia")
           & Unit_Line (Locale, "kilowatt", "kilowatti", "kilowattia")
           & Unit_Line (Locale, "hertz", "hertsi", B ("686572747369C3A4"))
           & Unit_Line
               (Locale, "kilohertz", "kilohertsi",
                B ("6B696C6F686572747369C3A4"))
           & Unit_Line (Locale, "degree", "aste", "astetta")
           & Unit_Line (Locale, "mile", "maili", "mailia")
           & Unit_Line (Locale, "yard", "jaardi", "jaardia")
           & Unit_Line (Locale, "foot", "jalka", "jalkaa")
           & Unit_Line (Locale, "inch", "tuuma", "tuumaa")
           & Unit_Line (Locale, "gallon", "gallona", "gallonaa")
           & Unit_Line (Locale, "pound", "pauna", "paunaa")
           & Unit_Line (Locale, "ounce", "unssi", "unssia");
      elsif Locale = "pl" then
         return
           Unit_Line (Locale, "celsius", "stopien Celsjusza", "stopnie Celsjusza")
           & Unit_Line (Locale, "fahrenheit", "stopien Fahrenheita", "stopnie Fahrenheita")
           & Unit_Line (Locale, "square_meter", "metr kwadratowy", "metry kwadratowe")
           & Unit_Line (Locale, "hectare", "hektar", "hektary")
           & Unit_Line
               (Locale, "kilometer_per_hour",
                B ("6B696C6F6D657472206E6120676F647A696EC499"),
                B ("6B696C6F6D65747279206E6120676F647A696EC499"))
           & Unit_Line
               (Locale, "meter_per_second",
                B ("6D657472206E612073656B756E64C499"),
                B ("6D65747279206E612073656B756E64C499"))
           & Unit_Line (Locale, "pascal", "paskal", "paskale")
           & Unit_Line (Locale, "kilopascal", "kilopaskal", "kilopaskale")
           & Unit_Line (Locale, "joule", B ("64C5BC756C"), B ("64C5BC756C65"))
           & Unit_Line (Locale, "kilojoule", B ("6B696C6F64C5BC756C"), B ("6B696C6F64C5BC756C65"))
           & Unit_Line (Locale, "watt", "wat", "waty")
           & Unit_Line (Locale, "kilowatt", "kilowat", "kilowaty")
           & Unit_Line (Locale, "hertz", "herc", "herce")
           & Unit_Line (Locale, "kilohertz", "kiloherc", "kiloherce")
           & Unit_Line (Locale, "degree", B ("73746F706965C584"), "stopnie")
           & Unit_Line (Locale, "mile", "mila", "mile")
           & Unit_Line (Locale, "yard", "jard", "jardy")
           & Unit_Line (Locale, "foot", "stopa", "stopy")
           & Unit_Line (Locale, "inch", "cal", "cale")
           & Unit_Line (Locale, "gallon", "galon", "galony")
           & Unit_Line (Locale, "pound", "funt", "funty")
           & Unit_Line (Locale, "ounce", "uncja", "uncje");
      elsif Locale = "cs" then
         return
           Unit_Line
             (Locale, "celsius",
              B ("7374757065C5882043656C736961"),
              B ("737475706EC49B2043656C736961"))
           & Unit_Line
               (Locale, "fahrenheit",
                B ("7374757065C5882046616872656E6865697461"),
                B ("737475706EC49B2046616872656E6865697461"))
           & Unit_Line
               (Locale, "square_meter",
                B ("6D65747220C48D7476657265C48D6EC3BD"),
                B ("6D6574727920C48D7476657265C48D6EC3A9"))
           & Unit_Line (Locale, "hectare", "hektar", "hektary")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometr za hodinu", "kilometry za hodinu")
           & Unit_Line (Locale, "meter_per_second", "metr za sekundu", "metry za sekundu")
           & Unit_Line (Locale, "pascal", "pascal", "pascaly")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascaly")
           & Unit_Line (Locale, "joule", "joule", "jouly")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojouly")
           & Unit_Line (Locale, "watt", "watt", "watty")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatty")
           & Unit_Line (Locale, "hertz", "hertz", "hertzy")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertzy")
           & Unit_Line (Locale, "degree", B ("7374757065C588"), B ("737475706EC49B"))
           & Unit_Line (Locale, "mile", B ("6DC3AD6C65"), B ("6DC3AD6C65"))
           & Unit_Line (Locale, "yard", "yard", "yardy")
           & Unit_Line (Locale, "foot", "stopa", "stopy")
           & Unit_Line (Locale, "inch", "palec", "palce")
           & Unit_Line (Locale, "gallon", "galon", "galony")
           & Unit_Line (Locale, "pound", "libra", "libry")
           & Unit_Line (Locale, "ounce", "unce", "unce");
      elsif Locale = "tr" then
         return
           Unit_Line (Locale, "celsius", "santigrat derece", "santigrat derece")
           & Unit_Line (Locale, "fahrenheit", "fahrenhayt derece", "fahrenhayt derece")
           & Unit_Line (Locale, "square_meter", "metrekare", "metrekare")
           & Unit_Line (Locale, "hectare", "hektar", "hektar")
           & Unit_Line (Locale, "kilometer_per_hour", "saatte kilometre", "saatte kilometre")
           & Unit_Line (Locale, "meter_per_second", "saniyede metre", "saniyede metre")
           & Unit_Line (Locale, "pascal", "paskal", "paskal")
           & Unit_Line (Locale, "kilopascal", "kilopaskal", "kilopaskal")
           & Unit_Line (Locale, "joule", "jul", "jul")
           & Unit_Line (Locale, "kilojoule", "kilojul", "kilojul")
           & Unit_Line (Locale, "watt", "vat", "vat")
           & Unit_Line (Locale, "kilowatt", "kilovat", "kilovat")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "derece", "derece")
           & Unit_Line (Locale, "mile", "mil", "mil")
           & Unit_Line (Locale, "yard", "yarda", "yarda")
           & Unit_Line (Locale, "foot", "fit", "fit")
           & Unit_Line (Locale, "inch", "inc", "inc")
           & Unit_Line (Locale, "gallon", "galon", "galon")
           & Unit_Line (Locale, "pound", "pound", "pound")
           & Unit_Line (Locale, "ounce", "ons", "ons");
      elsif Locale = "ru" then
         return
           Added_Unit_Keys_With_Tail
             (Locale,
              B ("D0B3D180D0B0D0B4D183D18120D0A6D0B5D0BBD18CD181D0B8D18F"),
              B ("D0B3D180D0B0D0B4D183D181D18B20D0A6D0B5D0BBD18CD181D0B8D18F"),
              B ("D0B3D180D0B0D0B4D183D18120D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
              B ("D0B3D180D0B0D0B4D183D181D18B20D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
              B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B920D0BCD0B5D182D180"),
              B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD18BD0B520D0BCD0B5D182D180D18B"),
              B ("D0B3D0B5D0BAD182D0B0D180"),
              B ("D0B3D0B5D0BAD182D0B0D180D18B"),
              B ("D0BAD0B8D0BBD0BED0BCD0B5D182D18020D0B220D187D0B0D181"),
              B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B20D0B220D187D0B0D181"),
              B ("D0BCD0B5D182D18020D0B220D181D0B5D0BAD183D0BDD0B4D183"),
              B ("D0BCD0B5D182D180D18B20D0B220D181D0B5D0BAD183D0BDD0B4D183"));
      elsif Locale = "uk" then
         return
           Added_Unit_Keys_With_Tail
             (Locale,
              B ("D0B3D180D0B0D0B4D183D18120D0A6D0B5D0BBD18CD181D196D18F"),
              B ("D0B3D180D0B0D0B4D183D181D0B820D0A6D0B5D0BBD18CD181D196D18F"),
              B ("D0B3D180D0B0D0B4D183D18120D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
              B ("D0B3D180D0B0D0B4D183D181D0B820D0A4D0B0D180D0B5D0BDD0B3D0B5D0B9D182D0B0"),
              B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD0B8D0B920D0BCD0B5D182D180"),
              B ("D0BAD0B2D0B0D0B4D180D0B0D182D0BDD19620D0BCD0B5D182D180D0B8"),
              B ("D0B3D0B5D0BAD182D0B0D180"),
              B ("D0B3D0B5D0BAD182D0B0D180D0B8"),
              B ("D0BAD196D0BBD0BED0BCD0B5D182D18020D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"),
              B ("D0BAD196D0BBD0BED0BCD0B5D182D180D0B820D0B7D0B020D0B3D0BED0B4D0B8D0BDD183"),
              B ("D0BCD0B5D182D18020D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"),
              B ("D0BCD0B5D182D180D0B820D0B7D0B020D181D0B5D0BAD183D0BDD0B4D183"));
      elsif Locale = "ja" then
         return
           Added_Unit_Keys_With_Tail
             (Locale, B ("E382BBE383ABE382B7E382A6E382B9E5BAA6"),
              B ("E382BBE383ABE382B7E382A6E382B9E5BAA6"),
              B ("E88FAFE6B08FE5BAA6"), B ("E88FAFE6B08FE5BAA6"),
              B ("E5B9B3E696B9E383A1E383BCE38388E383AB"),
              B ("E5B9B3E696B9E383A1E383BCE38388E383AB"),
              B ("E38398E382AFE382BFE383BCE383AB"),
              B ("E38398E382AFE382BFE383BCE383AB"),
              B ("E382ADE383ADE383A1E383BCE38388E383ABE6AF8EE69982"),
              B ("E382ADE383ADE383A1E383BCE38388E383ABE6AF8EE69982"),
              B ("E383A1E383BCE38388E383ABE6AF8EE7A792"),
              B ("E383A1E383BCE38388E383ABE6AF8EE7A792"));
      elsif Locale = "ko" then
         return
           Added_Unit_Keys_With_Tail
             (Locale, B ("EC84ADEC94A8EB8F84"), B ("EC84ADEC94A8EB8F84"),
              B ("ED9994EC94A8EB8F84"), B ("ED9994EC94A8EB8F84"),
              B ("ECA09CEAB3B1EBAFB8ED84B0"),
              B ("ECA09CEAB3B1EBAFB8ED84B0"),
              B ("ED97A5ED8380EBA5B4"), B ("ED97A5ED8380EBA5B4"),
              B ("EC8B9CEAB084EB8BB920ED82ACEBA19CEBAFB8ED84B0"),
              B ("EC8B9CEAB084EB8BB920ED82ACEBA19CEBAFB8ED84B0"),
              B ("ECB488EB8BB920EBAFB8ED84B0"),
              B ("ECB488EB8BB920EBAFB8ED84B0"));
      elsif Locale = "zh" then
         return
           Added_Unit_Keys_With_Tail
             (Locale, B ("E69184E6B08FE5BAA6"), B ("E69184E6B08FE5BAA6"),
              B ("E58D8EE6B08FE5BAA6"), B ("E58D8EE6B08FE5BAA6"),
              B ("E5B9B3E696B9E7B1B3"), B ("E5B9B3E696B9E7B1B3"),
              B ("E585ACE9A1B7"), B ("E585ACE9A1B7"),
              B ("E58D83E7B1B3E6AF8FE5B08FE697B6"),
              B ("E58D83E7B1B3E6AF8FE5B08FE697B6"),
              B ("E7B1B3E6AF8FE7A792"), B ("E7B1B3E6AF8FE7A792"));
      elsif Locale = "ar" then
         return
           Added_Unit_Keys_With_Tail
             (Locale, B ("D8AFD8B1D8ACD8A920D985D8A6D988D98AD8A9"),
              B ("D8AFD8B1D8ACD8A7D8AA20D985D8A6D988D98AD8A9"),
              B ("D8AFD8B1D8ACD8A920D981D987D8B1D986D987D8A7D98AD8AA"),
              B ("D8AFD8B1D8ACD8A7D8AA20D981D987D8B1D986D987D8A7D98AD8AA"),
              B ("D985D8AAD8B120D985D8B1D8A8D8B9"),
              B ("D8A3D985D8AAD8A7D8B120D985D8B1D8A8D8B9D8A9"),
              B ("D987D983D8AAD8A7D8B1"), B ("D987D983D8AAD8A7D8B1D8A7D8AA"),
              B ("D983D98AD984D988D985D8AAD8B120D981D98A20D8A7D984D8B3D8A7D8B9D8A9"),
              B ("D983D98AD984D988D985D8AAD8B1D8A7D8AA20D981D98A20D8A7D984D8B3D8A7D8B9D8A9"),
              B ("D985D8AAD8B120D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"),
              B ("D8A3D985D8AAD8A7D8B120D981D98A20D8A7D984D8ABD8A7D986D98AD8A9"));
      elsif Locale = "hi" then
         return
           Added_Unit_Keys_With_Tail
             (Locale,
              B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4B8E0A587E0A4B2E0A58DE0A4B8E0A4BFE0A4AFE0A4B8"),
              B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4B8E0A587E0A4B2E0A58DE0A4B8E0A4BFE0A4AFE0A4B8"),
              B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4ABE0A4BEE0A4B0E0A587E0A4A8E0A4B9E0A4BEE0A487E0A49F"),
              B ("E0A4A1E0A4BFE0A497E0A58DE0A4B0E0A58020E0A4ABE0A4BEE0A4B0E0A587E0A4A8E0A4B9E0A4BEE0A487E0A49F"),
              B ("E0A4B5E0A4B0E0A58DE0A49720E0A4AEE0A580E0A49FE0A4B0"),
              B ("E0A4B5E0A4B0E0A58DE0A49720E0A4AEE0A580E0A49FE0A4B0"),
              B ("E0A4B9E0A587E0A495E0A58DE0A49FE0A587E0A4AFE0A4B0"),
              B ("E0A4B9E0A587E0A495E0A58DE0A49FE0A587E0A4AFE0A4B0"),
              B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"
                 & "20E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"),
              B ("E0A495E0A4BFE0A4B2E0A58BE0A4AEE0A580E0A49FE0A4B0"
                 & "20E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A498E0A482E0A49FE0A4BE"),
              B ("E0A4AEE0A580E0A49FE0A4B020E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"),
              B ("E0A4AEE0A580E0A49FE0A4B020E0A4AAE0A58DE0A4B0E0A4A4E0A4BF20E0A4B8E0A587E0A495E0A482E0A4A1"));
      elsif Locale = "ro" then
         return
           Unit_Line (Locale, "celsius", "grad Celsius", "grade Celsius")
           & Unit_Line (Locale, "fahrenheit", "grad Fahrenheit", "grade Fahrenheit")
           & Unit_Line (Locale, "square_meter", "metru patrat", "metri patrati")
           & Unit_Line (Locale, "hectare", "hectar", "hectare")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometru pe ora", "kilometri pe ora")
           & Unit_Line (Locale, "meter_per_second", "metru pe secunda", "metri pe secunda")
           & Unit_Line (Locale, "pascal", "pascal", "pascali")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascali")
           & Unit_Line (Locale, "joule", "joule", "jouli")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojouli")
           & Unit_Line (Locale, "watt", "watt", "wati")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowati")
           & Unit_Line (Locale, "hertz", "hertz", "hertzi")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertzi")
           & Unit_Line (Locale, "degree", "grad", "grade")
           & Unit_Line (Locale, "mile", "mila", "mile")
           & Unit_Line (Locale, "yard", "yard", "yarzi")
           & Unit_Line (Locale, "foot", "picior", "picioare")
           & Unit_Line (Locale, "inch", "tol", "toli")
           & Unit_Line (Locale, "gallon", "galon", "galoane")
           & Unit_Line (Locale, "pound", "livra", "livre")
           & Unit_Line (Locale, "ounce", "uncie", "uncii");
      elsif Locale = "lt" then
         return
           Unit_Line (Locale, "celsius", "Celsijaus laipsnis", "Celsijaus laipsniai")
           & Unit_Line (Locale, "fahrenheit", "Farenheito laipsnis", "Farenheito laipsniai")
           & Unit_Line (Locale, "square_meter", "kvadratinis metras", "kvadratiniai metrai")
           & Unit_Line (Locale, "hectare", "hektaras", "hektarai")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometras per valanda", "kilometrai per valanda")
           & Unit_Line (Locale, "meter_per_second", "metras per sekunde", "metrai per sekunde")
           & Unit_Line (Locale, "pascal", "paskalis", "paskaliai")
           & Unit_Line (Locale, "kilopascal", "kilopaskalis", "kilopaskaliai")
           & Unit_Line (Locale, "joule", "dziulis", "dziuliai")
           & Unit_Line (Locale, "kilojoule", "kilodziulis", "kilodziuliai")
           & Unit_Line (Locale, "watt", "vatas", "vatai")
           & Unit_Line (Locale, "kilowatt", "kilovatas", "kilovatai")
           & Unit_Line (Locale, "hertz", "hercas", "hercai")
           & Unit_Line (Locale, "kilohertz", "kilohercas", "kilohercai")
           & Unit_Line (Locale, "degree", "laipsnis", "laipsniai")
           & Unit_Line (Locale, "mile", "mylia", "mylios")
           & Unit_Line (Locale, "yard", "jardas", "jardai")
           & Unit_Line (Locale, "foot", "peda", "pedos")
           & Unit_Line (Locale, "inch", "colis", "coliai")
           & Unit_Line (Locale, "gallon", "galonas", "galonai")
           & Unit_Line (Locale, "pound", "svaras", "svarai")
           & Unit_Line (Locale, "ounce", "uncija", "uncijos");
      elsif Locale = "sl" then
         return
           Unit_Line (Locale, "celsius", "stopinja Celzija", "stopinje Celzija")
           & Unit_Line (Locale, "fahrenheit", "stopinja Fahrenheita", "stopinje Fahrenheita")
           & Unit_Line (Locale, "square_meter", "kvadratni meter", "kvadratni metri")
           & Unit_Line (Locale, "hectare", "hektar", "hektarji")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer na uro", "kilometri na uro")
           & Unit_Line (Locale, "meter_per_second", "meter na sekundo", "metri na sekundo")
           & Unit_Line (Locale, "pascal", "paskal", "paskali")
           & Unit_Line (Locale, "kilopascal", "kilopaskal", "kilopaskali")
           & Unit_Line (Locale, "joule", "dzul", "dzuli")
           & Unit_Line (Locale, "kilojoule", "kilodzul", "kilodzuli")
           & Unit_Line (Locale, "watt", "vat", "vati")
           & Unit_Line (Locale, "kilowatt", "kilovat", "kilovati")
           & Unit_Line (Locale, "hertz", "herc", "herci")
           & Unit_Line (Locale, "kilohertz", "kiloherc", "kiloherci")
           & Unit_Line (Locale, "degree", "stopinja", "stopinje")
           & Unit_Line (Locale, "mile", "milja", "milje")
           & Unit_Line (Locale, "yard", "jard", "jardi")
           & Unit_Line (Locale, "foot", "cevelj", "cevlji")
           & Unit_Line (Locale, "inch", "palec", "palci")
           & Unit_Line (Locale, "gallon", "galona", "galone")
           & Unit_Line (Locale, "pound", "funt", "funti")
           & Unit_Line (Locale, "ounce", "unca", "unce");
      elsif Locale = "id" or else Locale = "ms" then
         return
           Unit_Line (Locale, "celsius", "derajat Celsius", "derajat Celsius")
           & Unit_Line (Locale, "fahrenheit", "derajat Fahrenheit", "derajat Fahrenheit")
           & Unit_Line (Locale, "square_meter", "meter persegi", "meter persegi")
           & Unit_Line (Locale, "hectare", "hektare", "hektare")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer per jam", "kilometer per jam")
           & Unit_Line (Locale, "meter_per_second", "meter per detik", "meter per detik")
           & Unit_Line (Locale, "pascal", "pascal", "pascal")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
           & Unit_Line (Locale, "joule", "joule", "joule")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
           & Unit_Line (Locale, "watt", "watt", "watt")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "derajat", "derajat")
           & Unit_Line (Locale, "mile", "mil", "mil")
           & Unit_Line (Locale, "yard", "yard", "yard")
           & Unit_Line (Locale, "foot", "kaki", "kaki")
           & Unit_Line (Locale, "inch", "inci", "inci")
           & Unit_Line (Locale, "gallon", "galon", "galon")
           & Unit_Line (Locale, "pound", "pon", "pon")
           & Unit_Line (Locale, "ounce", "ons", "ons");
      elsif Locale = "eo" then
         return
           Unit_Line (Locale, "celsius", "celsia grado", "celsiaj gradoj")
           & Unit_Line (Locale, "fahrenheit", "farenhejta grado", "farenhejtaj gradoj")
           & Unit_Line (Locale, "square_meter", "kvadrata metro", "kvadrataj metroj")
           & Unit_Line (Locale, "hectare", "hektaro", "hektaroj")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometro hore", "kilometroj hore")
           & Unit_Line (Locale, "meter_per_second", "metro sekunde", "metroj sekunde")
           & Unit_Line (Locale, "pascal", "paskalo", "paskaloj")
           & Unit_Line (Locale, "kilopascal", "kilopaskalo", "kilopaskaloj")
           & Unit_Line (Locale, "joule", "julo", "juloj")
           & Unit_Line (Locale, "kilojoule", "kilojulo", "kilojuloj")
           & Unit_Line (Locale, "watt", "vato", "vatoj")
           & Unit_Line (Locale, "kilowatt", "kilovato", "kilovatoj")
           & Unit_Line (Locale, "hertz", "herco", "hercoj")
           & Unit_Line (Locale, "kilohertz", "kiloherco", "kilohercoj")
           & Unit_Line (Locale, "degree", "grado", "gradoj")
           & Unit_Line (Locale, "mile", "mejlo", "mejloj")
           & Unit_Line (Locale, "yard", "jardo", "jardoj")
           & Unit_Line (Locale, "foot", "futo", "futoj")
           & Unit_Line (Locale, "inch", "colo", "coloj")
           & Unit_Line (Locale, "gallon", "galjono", "galjonoj")
           & Unit_Line (Locale, "pound", "funto", "funtoj")
           & Unit_Line (Locale, "ounce", "unco", "uncoj");
      elsif Locale = "vi" then
         return
           Unit_Line (Locale, "celsius", "do Celsius", "do Celsius")
           & Unit_Line (Locale, "fahrenheit", "do Fahrenheit", "do Fahrenheit")
           & Unit_Line (Locale, "square_meter", "met vuong", "met vuong")
           & Unit_Line (Locale, "hectare", "hecta", "hecta")
           & Unit_Line (Locale, "kilometer_per_hour", "kilomet moi gio", "kilomet moi gio")
           & Unit_Line (Locale, "meter_per_second", "met moi giay", "met moi giay")
           & Unit_Line (Locale, "pascal", "pascal", "pascal")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
           & Unit_Line (Locale, "joule", "jun", "jun")
           & Unit_Line (Locale, "kilojoule", "kilojun", "kilojun")
           & Unit_Line (Locale, "watt", "oat", "oat")
           & Unit_Line (Locale, "kilowatt", "kilooat", "kilooat")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "do", "do")
           & Unit_Line (Locale, "mile", "dam", "dam")
           & Unit_Line (Locale, "yard", "yard", "yard")
           & Unit_Line (Locale, "foot", "foot", "foot")
           & Unit_Line (Locale, "inch", "inch", "inch")
           & Unit_Line (Locale, "gallon", "gallon", "gallon")
           & Unit_Line (Locale, "pound", "pound", "pound")
           & Unit_Line (Locale, "ounce", "ounce", "ounce");
      elsif Locale = "sw" then
         return
           Unit_Line (Locale, "celsius", "digrii Selsiasi", "digrii Selsiasi")
           & Unit_Line (Locale, "fahrenheit", "digrii Farenhaiti", "digrii Farenhaiti")
           & Unit_Line (Locale, "square_meter", "mita ya mraba", "mita za mraba")
           & Unit_Line (Locale, "hectare", "hekta", "hekta")
           & Unit_Line (Locale, "kilometer_per_hour", "kilomita kwa saa", "kilomita kwa saa")
           & Unit_Line (Locale, "meter_per_second", "mita kwa sekunde", "mita kwa sekunde")
           & Unit_Line (Locale, "pascal", "paskali", "paskali")
           & Unit_Line (Locale, "kilopascal", "kilopaskali", "kilopaskali")
           & Unit_Line (Locale, "joule", "juli", "juli")
           & Unit_Line (Locale, "kilojoule", "kilojuli", "kilojuli")
           & Unit_Line (Locale, "watt", "wati", "wati")
           & Unit_Line (Locale, "kilowatt", "kilowati", "kilowati")
           & Unit_Line (Locale, "hertz", "hertzi", "hertzi")
           & Unit_Line (Locale, "kilohertz", "kilohertzi", "kilohertzi")
           & Unit_Line (Locale, "degree", "digrii", "digrii")
           & Unit_Line (Locale, "mile", "maili", "maili")
           & Unit_Line (Locale, "yard", "yadi", "yadi")
           & Unit_Line (Locale, "foot", "futi", "futi")
           & Unit_Line (Locale, "inch", "inchi", "inchi")
           & Unit_Line (Locale, "gallon", "galoni", "galoni")
           & Unit_Line (Locale, "pound", "pauni", "pauni")
           & Unit_Line (Locale, "ounce", "aunsi", "aunsi");
      elsif Locale = "af" then
         return
           Unit_Line (Locale, "celsius", "graad Celsius", "grade Celsius")
           & Unit_Line (Locale, "fahrenheit", "graad Fahrenheit", "grade Fahrenheit")
           & Unit_Line (Locale, "square_meter", "vierkante meter", "vierkante meter")
           & Unit_Line (Locale, "hectare", "hektaar", "hektaar")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer per uur", "kilometer per uur")
           & Unit_Line (Locale, "meter_per_second", "meter per sekonde", "meter per sekonde")
           & Unit_Line (Locale, "pascal", "pascal", "pascal")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
           & Unit_Line (Locale, "joule", "joule", "joule")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
           & Unit_Line (Locale, "watt", "watt", "watt")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "graad", "grade")
           & Unit_Line (Locale, "mile", "myl", "myl")
           & Unit_Line (Locale, "yard", "jaart", "jaart")
           & Unit_Line (Locale, "foot", "voet", "voet")
           & Unit_Line (Locale, "inch", "duim", "duim")
           & Unit_Line (Locale, "gallon", "gelling", "gellings")
           & Unit_Line (Locale, "pound", "pond", "pond")
           & Unit_Line (Locale, "ounce", "ons", "ons");
      elsif Locale = "hu" then
         return
           Unit_Line (Locale, "celsius", "Celsius-fok", "Celsius-fok")
           & Unit_Line (Locale, "fahrenheit", "Fahrenheit-fok", "Fahrenheit-fok")
           & Unit_Line (Locale, "square_meter", "negyzetmeter", "negyzetmeter")
           & Unit_Line (Locale, "hectare", "hektar", "hektar")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer per ora", "kilometer per ora")
           & Unit_Line (Locale, "meter_per_second", "meter per masodperc", "meter per masodperc")
           & Unit_Line (Locale, "pascal", "pascal", "pascal")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascal")
           & Unit_Line (Locale, "joule", "joule", "joule")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojoule")
           & Unit_Line (Locale, "watt", "watt", "watt")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatt")
           & Unit_Line (Locale, "hertz", "hertz", "hertz")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertz")
           & Unit_Line (Locale, "degree", "fok", "fok")
           & Unit_Line (Locale, "mile", "merfold", "merfold")
           & Unit_Line (Locale, "yard", "yard", "yard")
           & Unit_Line (Locale, "foot", "lab", "lab")
           & Unit_Line (Locale, "inch", "huvelyk", "huvelyk")
           & Unit_Line (Locale, "gallon", "gallon", "gallon")
           & Unit_Line (Locale, "pound", "font", "font")
           & Unit_Line (Locale, "ounce", "uncia", "uncia");
      elsif Locale = "sk" then
         return
           Unit_Line (Locale, "celsius", "stupen Celzia", "stupne Celzia")
           & Unit_Line (Locale, "fahrenheit", "stupen Fahrenheita", "stupne Fahrenheita")
           & Unit_Line (Locale, "square_meter", "stvorcovy meter", "stvorcove metre")
           & Unit_Line (Locale, "hectare", "hektar", "hektare")
           & Unit_Line (Locale, "kilometer_per_hour", "kilometer za hodinu", "kilometre za hodinu")
           & Unit_Line (Locale, "meter_per_second", "meter za sekundu", "metre za sekundu")
           & Unit_Line (Locale, "pascal", "pascal", "pascaly")
           & Unit_Line (Locale, "kilopascal", "kilopascal", "kilopascaly")
           & Unit_Line (Locale, "joule", "joule", "jouly")
           & Unit_Line (Locale, "kilojoule", "kilojoule", "kilojouly")
           & Unit_Line (Locale, "watt", "watt", "watty")
           & Unit_Line (Locale, "kilowatt", "kilowatt", "kilowatty")
           & Unit_Line (Locale, "hertz", "hertz", "hertze")
           & Unit_Line (Locale, "kilohertz", "kilohertz", "kilohertze")
           & Unit_Line (Locale, "degree", "stupen", "stupne")
           & Unit_Line (Locale, "mile", "mila", "mile")
           & Unit_Line (Locale, "yard", "yard", "yardy")
           & Unit_Line (Locale, "foot", "stopa", "stopy")
           & Unit_Line (Locale, "inch", "palec", "palce")
           & Unit_Line (Locale, "gallon", "galon", "galony")
           & Unit_Line (Locale, "pound", "libra", "libry")
           & Unit_Line (Locale, "ounce", "unca", "unce");
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
           Unit_Line (Locale, "nautical_mile", B ("73C3B86D696C"), B ("73C3B86D696C"))
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
           & Unit_Line (Locale, "teaspoon", B ("5465656CC3B66666656C"), B ("5465656CC3B66666656C"))
           & Unit_Line (Locale, "tablespoon", B ("4573736CC3B66666656C"), B ("4573736CC3B66666656C"))
           & Unit_Line (Locale, "cup", "Tasse", "Tassen")
           & Unit_Line (Locale, "stone", "Stone", "Stone")
           & Unit_Line (Locale, "tonne", "Tonne", "Tonnen")
           & Unit_Line (Locale, "ton", "Tonne", "Tonnen");
      elsif Locale = "fr" then
         return
           Unit_Line (Locale, "nautical_mile", "mille marin", "milles marins")
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line
             (Locale, "square_kilometer",
              B ("6B696C6F6DC3A87472652063617272C3A9"),
              B ("6B696C6F6DC3A8747265732063617272C3A973"))
           & Unit_Line
             (Locale, "cubic_meter", B ("6DC3A87472652063756265"),
              B ("6DC3A874726573206375626573"))
           & Unit_Line
             (Locale, "teaspoon",
              B ("6375696C6CC3A8726520C3A020636166C3A9"),
              B ("6375696C6CC3A872657320C3A020636166C3A9"))
           & Unit_Line
             (Locale, "tablespoon",
              B ("6375696C6CC3A8726520C3A020736F757065"),
              B ("6375696C6CC3A872657320C3A020736F757065"))
           & Unit_Line (Locale, "cup", "tasse", "tasses")
           & Unit_Line (Locale, "stone", "stone", "stones")
           & Unit_Line (Locale, "tonne", "tonne", "tonnes")
           & Unit_Line (Locale, "ton", "tonne courte", "tonnes courtes");
      elsif Locale = "es" then
         return
           Unit_Line
             (Locale, "nautical_mile",
              B ("6D696C6C61206EC3A17574696361"),
              B ("6D696C6C6173206EC3A1757469636173"))
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line
             (Locale, "square_kilometer",
              B ("6B696CC3B36D6574726F20637561647261646F"),
              B ("6B696CC3B36D6574726F7320637561647261646F73"))
           & Unit_Line
             (Locale, "cubic_meter", B ("6D6574726F2063C3BA6269636F"),
              B ("6D6574726F732063C3BA6269636F73"))
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
           Unit_Line
             (Locale, "nautical_mile",
              B ("6D696C6861206EC3A17574696361"),
              B ("6D696C686173206EC3A1757469636173"))
           & Unit_Line (Locale, "acre", "acre", "acres")
           & Unit_Line
             (Locale, "square_kilometer",
              B ("7175696CC3B46D6574726F20717561647261646F"),
              B ("7175696CC3B46D6574726F7320717561647261646F73"))
           & Unit_Line
             (Locale, "cubic_meter", B ("6D6574726F2063C3BA6269636F"),
              B ("6D6574726F732063C3BA6269636F73"))
           & Unit_Line
             (Locale, "teaspoon", B ("636F6C686572206465206368C3A1"),
              B ("636F6C6865726573206465206368C3A1"))
           & Unit_Line (Locale, "tablespoon", "colher de sopa", "colheres de sopa")
           & Unit_Line (Locale, "cup", B ("78C3AD63617261"), B ("78C3AD6361726173"))
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
      elsif Locale = "sv" then
         return
           Unit_Line (Locale, "nautical_mile",
             B ("736AC3B66D696C"), B ("736AC3B66D696C"))
           & Unit_Line (Locale, "acre", "acre", "acre")
           & Unit_Line (Locale, "square_kilometer", "kvadratkilometer", "kvadratkilometer")
           & Unit_Line (Locale, "cubic_meter", "kubikmeter", "kubikmeter")
           & Unit_Line (Locale, "teaspoon", "tesked", "teskedar")
           & Unit_Line (Locale, "tablespoon", "matsked", "matskedar")
           & Unit_Line (Locale, "cup", "kopp", "koppar")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton", "ton")
           & Unit_Line (Locale, "ton", "kort ton", "korta ton");
      elsif Locale = "no" or else Locale = "nb" then
         return
           Unit_Line (Locale, "nautical_mile", "nautisk mil", "nautiske mil")
           & Unit_Line (Locale, "acre", "acre", "acre")
           & Unit_Line (Locale, "square_kilometer", "kvadratkilometer", "kvadratkilometer")
           & Unit_Line (Locale, "cubic_meter", "kubikkmeter", "kubikkmeter")
           & Unit_Line (Locale, "teaspoon", "teskje", "teskjeer")
           & Unit_Line (Locale, "tablespoon", "spiseskje", "spiseskjeer")
           & Unit_Line (Locale, "cup", "kopp", "kopper")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonn", "tonn")
           & Unit_Line (Locale, "ton", "kort tonn", "korte tonn");
      elsif Locale = "fi" then
         return
           Unit_Line (Locale, "nautical_mile", "meripeninkulma", "meripeninkulmaa")
           & Unit_Line (Locale, "acre", "eekkeri", B ("65656B6B657269C3A4"))
           & Unit_Line
               (Locale, "square_kilometer",
                B ("6E656C69C3B66B696C6F6D65747269"),
                B ("6E656C69C3B66B696C6F6D65747269C3A4"))
           & Unit_Line
               (Locale, "cubic_meter", "kuutiometri",
                B ("6B757574696F6D65747269C3A4"))
           & Unit_Line (Locale, "teaspoon", "teelusikka", "teelusikkaa")
           & Unit_Line (Locale, "tablespoon", "ruokalusikka", "ruokalusikkaa")
           & Unit_Line (Locale, "cup", "kuppi", "kuppia")
           & Unit_Line (Locale, "stone", "stone", "stonea")
           & Unit_Line (Locale, "tonne", "tonni", "tonnia")
           & Unit_Line
               (Locale, "ton", "lyhyt tonni",
                B ("6C7968797474C3A420746F6E6E6961"));
      elsif Locale = "pl" then
         return
           Unit_Line (Locale, "nautical_mile", "mila morska", "mile morskie")
           & Unit_Line (Locale, "acre", "akr", "akry")
           & Unit_Line (Locale, "square_kilometer", "kilometr kwadratowy", "kilometry kwadratowe")
           & Unit_Line
               (Locale, "cubic_meter",
                B ("6D65747220737A65C59B6369656E6E79"),
                B ("6D6574727920737A65C59B6369656E6E65"))
           & Unit_Line
               (Locale, "teaspoon",
                B ("C58279C5BC65637A6B61"),
                B ("C58279C5BC65637A6B69"))
           & Unit_Line
               (Locale, "tablespoon",
                B ("C58279C5BC6B612073746FC5826F7761"),
                B ("C58279C5BC6B692073746FC5826F7765"))
           & Unit_Line
               (Locale, "cup",
                B ("66696C69C5BC616E6B61"),
                B ("66696C69C5BC616E6B69"))
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tony")
           & Unit_Line
               (Locale, "ton",
                B ("746F6E61206B72C3B3746B61"),
                B ("746F6E79206B72C3B3746B6965"));
      elsif Locale = "cs" then
         return
           Unit_Line
             (Locale, "nautical_mile",
              B ("6EC3A16D6FC5996EC3AD206DC3AD6C65"),
              B ("6EC3A16D6FC5996EC3AD206DC3AD6C65"))
           & Unit_Line (Locale, "acre", "akr", "akry")
           & Unit_Line
               (Locale, "square_kilometer",
                B ("6B696C6F6D65747220C48D7476657265C48D6EC3BD"),
                B ("6B696C6F6D6574727920C48D7476657265C48D6EC3A9"))
           & Unit_Line
               (Locale, "cubic_meter",
                B ("6D657472206B727963686C6F76C3BD"),
                B ("6D65747279206B727963686C6F76C3A9"))
           & Unit_Line
               (Locale, "teaspoon",
                B ("C48D616A6F76C3A1206CC5BE69C48D6B61"),
                B ("C48D616A6F76C3A9206CC5BE69C48D6B79"))
           & Unit_Line
               (Locale, "tablespoon",
                B ("706F6CC3A9766B6F76C3A1206CC5BE696365"),
                B ("706F6CC3A9766B6F76C3A9206CC5BE696365"))
           & Unit_Line (Locale, "cup", B ("C5A1C3A16C656B"), B ("C5A1C3A16C6B79"))
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tuna", "tuny")
           & Unit_Line
               (Locale, "ton",
                B ("6B72C3A1746BC3A12074756E61"),
                B ("6B72C3A1746BC3A92074756E79"));
      elsif Locale = "tr" then
         return
           Unit_Line (Locale, "nautical_mile", "deniz mili", "deniz mili")
           & Unit_Line (Locale, "acre", "akr", "akr")
           & Unit_Line (Locale, "square_kilometer", "kilometrekare", "kilometrekare")
           & Unit_Line
               (Locale, "cubic_meter",
                B ("6D657472656BC3BC70"),
                B ("6D657472656BC3BC70"))
           & Unit_Line
               (Locale, "teaspoon",
                B ("C3A76179206B61C59FC4B1C49FC4B1"),
                B ("C3A76179206B61C59FC4B1C49FC4B1"))
           & Unit_Line
               (Locale, "tablespoon",
                B ("79656D656B206B61C59FC4B1C49FC4B1"),
                B ("79656D656B206B61C59FC4B1C49FC4B1"))
           & Unit_Line (Locale, "cup", "bardak", "bardak")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton", "ton")
           & Unit_Line
               (Locale, "ton",
                B ("6BC4B1736120746F6E"),
                B ("6BC4B1736120746F6E"));
      elsif Locale = "ru" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale,
              B ("D187D0B0D0B9D0BDD0B0D18F20D0BBD0BED0B6D0BAD0B0"),
              B ("D187D0B0D0B9D0BDD18BD0B520D0BBD0BED0B6D0BAD0B8"));
      elsif Locale = "uk" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale,
              B ("D187D0B0D0B9D0BDD0B020D0BBD0BED0B6D0BAD0B0"),
              B ("D187D0B0D0B9D0BDD19620D0BBD0BED0B6D0BAD0B8"));
      elsif Locale = "ja" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale, B ("E5B08FE38195E38198"), B ("E5B08FE38195E38198"));
      elsif Locale = "ko" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale, B ("ED8BB0EC8AA4ED91BC"), B ("ED8BB0EC8AA4ED91BC"));
      elsif Locale = "zh" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale, B ("E88CB6E58C99"), B ("E88CB6E58C99"));
      elsif Locale = "ar" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale,
              B ("D985D984D8B9D982D8A920D8B5D8BAD98AD8B1D8A9"),
              B ("D985D984D8A7D8B9D98220D8B5D8BAD98AD8B1D8A9"));
      elsif Locale = "hi" then
         return
           Extra_Unit_Keys_With_Tail
             (Locale,
              B ("E0A49AE0A4AEE0A58DE0A4AEE0A49A"),
              B ("E0A49AE0A4AEE0A58DE0A4AEE0A49A"));
      elsif Locale = "ro" then
         return
           Unit_Line (Locale, "nautical_mile", "mila nautica", "mile nautice")
           & Unit_Line (Locale, "acre", "acru", "acri")
           & Unit_Line (Locale, "square_kilometer", "kilometru patrat", "kilometri patrati")
           & Unit_Line (Locale, "cubic_meter", "metru cub", "metri cubi")
           & Unit_Line (Locale, "teaspoon", "lingurita", "lingurite")
           & Unit_Line (Locale, "tablespoon", "lingura", "linguri")
           & Unit_Line (Locale, "cup", "cana", "cani")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tone")
           & Unit_Line (Locale, "ton", "tona scurta", "tone scurte");
      elsif Locale = "lt" then
         return
           Unit_Line (Locale, "nautical_mile", "jurmyli", "jurmyles")
           & Unit_Line (Locale, "acre", "akras", "akrai")
           & Unit_Line (Locale, "square_kilometer", "kvadratinis kilometras", "kvadratiniai kilometrai")
           & Unit_Line (Locale, "cubic_meter", "kubinis metras", "kubiniai metrai")
           & Unit_Line (Locale, "teaspoon", "arbatinis saukstelis", "arbatiniai sauksteliai")
           & Unit_Line (Locale, "tablespoon", "valgomasis saukstas", "valgomieji saukstai")
           & Unit_Line (Locale, "cup", "puodelis", "puodeliai")
           & Unit_Line (Locale, "stone", "stounas", "stounai")
           & Unit_Line (Locale, "tonne", "tona", "tonos")
           & Unit_Line (Locale, "ton", "trumpoji tona", "trumposios tonos");
      elsif Locale = "sl" then
         return
           Unit_Line (Locale, "nautical_mile", "navticna milja", "navticne milje")
           & Unit_Line (Locale, "acre", "aker", "akri")
           & Unit_Line (Locale, "square_kilometer", "kvadratni kilometer", "kvadratni kilometri")
           & Unit_Line (Locale, "cubic_meter", "kubicni meter", "kubicni metri")
           & Unit_Line (Locale, "teaspoon", "cajna zlicka", "cajne zlicke")
           & Unit_Line (Locale, "tablespoon", "jedilna zlica", "jedilne zlice")
           & Unit_Line (Locale, "cup", "skodelica", "skodelice")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tone")
           & Unit_Line (Locale, "ton", "kratka tona", "kratke tone");
      elsif Locale = "id" or else Locale = "ms" then
         return
           Unit_Line (Locale, "nautical_mile", "mil laut", "mil laut")
           & Unit_Line (Locale, "acre", "ekar", "ekar")
           & Unit_Line (Locale, "square_kilometer", "kilometer persegi", "kilometer persegi")
           & Unit_Line (Locale, "cubic_meter", "meter kubik", "meter kubik")
           & Unit_Line (Locale, "teaspoon", "sendok teh", "sendok teh")
           & Unit_Line (Locale, "tablespoon", "sendok makan", "sendok makan")
           & Unit_Line (Locale, "cup", "cangkir", "cangkir")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton metrik", "ton metrik")
           & Unit_Line (Locale, "ton", "ton pendek", "ton pendek");
      elsif Locale = "eo" then
         return
           Unit_Line (Locale, "nautical_mile", "nautika mejlo", "nautikaj mejloj")
           & Unit_Line (Locale, "acre", "akreo", "akreoj")
           & Unit_Line (Locale, "square_kilometer", "kvadrata kilometro", "kvadrataj kilometroj")
           & Unit_Line (Locale, "cubic_meter", "kuba metro", "kubaj metroj")
           & Unit_Line (Locale, "teaspoon", "tekulero", "tekuleroj")
           & Unit_Line (Locale, "tablespoon", "supkulero", "supkuleroj")
           & Unit_Line (Locale, "cup", "taso", "tasoj")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tuno", "tunoj")
           & Unit_Line (Locale, "ton", "mallonga tuno", "mallongaj tunoj");
      elsif Locale = "vi" then
         return
           Unit_Line (Locale, "nautical_mile", "hai ly", "hai ly")
           & Unit_Line (Locale, "acre", "mau Anh", "mau Anh")
           & Unit_Line (Locale, "square_kilometer", "kilomet vuong", "kilomet vuong")
           & Unit_Line (Locale, "cubic_meter", "met khoi", "met khoi")
           & Unit_Line (Locale, "teaspoon", "thia ca phe", "thia ca phe")
           & Unit_Line (Locale, "tablespoon", "thia canh", "thia canh")
           & Unit_Line (Locale, "cup", "coc", "coc")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tan", "tan")
           & Unit_Line (Locale, "ton", "tan ngan", "tan ngan");
      elsif Locale = "sw" then
         return
           Unit_Line (Locale, "nautical_mile", "maili ya baharini", "maili za baharini")
           & Unit_Line (Locale, "acre", "ekari", "ekari")
           & Unit_Line (Locale, "square_kilometer", "kilomita ya mraba", "kilomita za mraba")
           & Unit_Line (Locale, "cubic_meter", "mita ya ujazo", "mita za ujazo")
           & Unit_Line (Locale, "teaspoon", "kijiko cha chai", "vijiko vya chai")
           & Unit_Line (Locale, "tablespoon", "kijiko cha chakula", "vijiko vya chakula")
           & Unit_Line (Locale, "cup", "kikombe", "vikombe")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tani", "tani")
           & Unit_Line (Locale, "ton", "tani fupi", "tani fupi");
      elsif Locale = "af" then
         return
           Unit_Line (Locale, "nautical_mile", "seemyl", "seemyl")
           & Unit_Line (Locale, "acre", "akker", "akker")
           & Unit_Line (Locale, "square_kilometer", "vierkante kilometer", "vierkante kilometer")
           & Unit_Line (Locale, "cubic_meter", "kubieke meter", "kubieke meter")
           & Unit_Line (Locale, "teaspoon", "teelepel", "teelepels")
           & Unit_Line (Locale, "tablespoon", "eetlepel", "eetlepels")
           & Unit_Line (Locale, "cup", "koppie", "koppies")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "ton", "ton")
           & Unit_Line (Locale, "ton", "kort ton", "kort ton");
      elsif Locale = "hu" then
         return
           Unit_Line (Locale, "nautical_mile", "tengeri merfold", "tengeri merfold")
           & Unit_Line (Locale, "acre", "acre", "acre")
           & Unit_Line (Locale, "square_kilometer", "negyzetkilometer", "negyzetkilometer")
           & Unit_Line (Locale, "cubic_meter", "kobmeter", "kobmeter")
           & Unit_Line (Locale, "teaspoon", "teaskanal", "teaskanal")
           & Unit_Line (Locale, "tablespoon", "evokanal", "evokanal")
           & Unit_Line (Locale, "cup", "csesze", "csesze")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tonna", "tonna")
           & Unit_Line (Locale, "ton", "rovid tonna", "rovid tonna");
      elsif Locale = "sk" then
         return
           Unit_Line (Locale, "nautical_mile", "namorna mila", "namorne mile")
           & Unit_Line (Locale, "acre", "aker", "akre")
           & Unit_Line (Locale, "square_kilometer", "stvorcovy kilometer", "stvorcove kilometre")
           & Unit_Line (Locale, "cubic_meter", "kubicky meter", "kubicke metre")
           & Unit_Line (Locale, "teaspoon", "cajova lyzicka", "cajove lyzicky")
           & Unit_Line (Locale, "tablespoon", "polievkova lyzica", "polievkove lyzice")
           & Unit_Line (Locale, "cup", "salku", "salky")
           & Unit_Line (Locale, "stone", "stone", "stone")
           & Unit_Line (Locale, "tonne", "tona", "tony")
           & Unit_Line (Locale, "ton", "kratka tona", "kratke tony");
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
      elsif Locale = "sk" then
         if Singular = "hodina" then
            return "hodin";
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = "tyzden" then
            return "tyzdnov";
         elsif Singular = "mesiac" then
            return "mesiacov";
         elsif Singular = "rok" then
            return "rokov";
         elsif Singular = "bajt" then
            return "bajtov";
         elsif Singular = "meter" then
            return "metrov";
         elsif Singular = "kilometer" then
            return "kilometrov";
         elsif Singular = "gram" then
            return "gramov";
         elsif Singular = "kilogram" then
            return "kilogramov";
         elsif Singular = "liter" then
            return "litrov";
         elsif Singular = "centimeter" then
            return "centimetrov";
         elsif Singular = "milimeter" then
            return "milimetrov";
         elsif Singular = "miligram" then
            return "miligramov";
         elsif Singular = "mililiter" then
            return "mililitrov";
         end if;
      elsif Locale = "sl" then
         if Singular = "ura" then
            return "ur";
         elsif Singular = "sekunda"
           or else Singular = "milisekunda"
           or else Singular = "mikrosekunda"
         then
            return "sekund";
         elsif Singular = "minuta" then
            return "minut";
         elsif Singular = "teden" then
            return "tednov";
         elsif Singular = "mesec" then
            return "mesecev";
         elsif Singular = "leto" then
            return "let";
         elsif Singular = "bajt" then
            return "bajtov";
         elsif Singular = "meter" then
            return "metrov";
         elsif Singular = "kilometer" then
            return "kilometrov";
         elsif Singular = "gram" then
            return "gramov";
         elsif Singular = "kilogram" then
            return "kilogramov";
         elsif Singular = "liter" then
            return "litrov";
         elsif Singular = "centimeter" then
            return "centimetrov";
         elsif Singular = "milimeter" then
            return "milimetrov";
         elsif Singular = "miligram" then
            return "miligramov";
         elsif Singular = "mililiter" then
            return "mililitrov";
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
      Many : constant String := Slavic_Many_Form (Locale, Singular, Plural);
   begin
      if Locale = "pl"
        or else Locale = "cs"
        or else Locale = "ru"
        or else Locale = "uk"
        or else Locale = "sk"
      then
         return
           Locale & "." & Key & " = "
           & "{count, plural, one {{value, number} " & Singular & "} "
           & "few {{value, number} " & Plural & "} "
           & "many {{value, number} "
           & Many & "} "
           & "other {{value, number} "
           & (if Locale = "sk" then Many else Plural)
           & "}}" & LF;
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
      Many : constant String := Slavic_Many_Form (Locale, Singular, Plural);
   begin
      if Locale = "pl"
        or else Locale = "cs"
        or else Locale = "ru"
        or else Locale = "uk"
        or else Locale = "sk"
      then
         return
           Locale & "." & Key & " = "
           & "{count, plural, one {" & Prefix & "{value, number} "
           & Singular & Suffix & "} few {" & Prefix & "{value, number} "
           & Plural & Suffix & "} many {" & Prefix & "{value, number} "
           & Many & Suffix
           & "} other {" & Prefix & "{value, number} "
           & (if Locale = "sk" then Many else Plural)
           & Suffix
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
        & Added_Unit_Keys (Locale)
        & Extra_Unit_Keys (Locale)
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
          ("ro",
           "acum",
           "ieri",
           B ("617374C4837A69"),
           B ("6DC3A2696E65"),
           B ("20C3AE6E2075726DC483"),
           B ("C3AE6E20"),
           B ("736563756E64C483"),
           "secunde",
           "minut",
           "minute",
           B ("6F72C483"),
           "ore",
           "zi",
           "zile",
           B ("73C4837074C4836DC3A26EC483"),
           B ("73C4837074C4836DC3A26E69"),
           B ("6C756EC483"),
           "luni",
           "an",
           "ani",
           "octet",
           B ("6F637465C89B69"),
           " mii",
           " mil.",
           " mld.",
           " bln.",
           "mii",
           "milioane",
           "miliarde",
           "bilioane",
           "metru",
           "metri",
           "kilometru",
           "kilometri",
           "gram",
           "grame",
           "kilogram",
           "kilograme",
           "litru",
           "litri",
           "centimetru",
           "centimetri",
           "milimetru",
           "milimetri",
           "miligram",
           "miligrame",
           "mililitru",
           "mililitri",
           B ("C89969"))
        & Added_Core_Locale_Catalog
          ("ro",
           B ("6D696C69736563756E64C483"),
           "milisecunde",
           B ("6D6963726F736563756E64C483"),
           "microsecunde",
           B ("73C4837074C4836DC3A26EC483"),
           B ("73C4837074C4836DC3A26E69"),
           B ("6C756EC483"),
           "luni",
           "an",
           "ani",
           B ("6E6963696F646174C483"),
           B ("6F20646174C483"),
           B ("646520646F75C483206F7269"),
           B ("646174C483"),
           "ori",
           "aproximativ",
           B ("6D6169207075C89B696E20646563C3A274"),
           B ("706520736563756E64C483"),
           "pe minut",
           B ("7065206F72C483"),
           "pe zi",
           B ("70652073C4837074C4836DC3A26EC483"),
           "altul",
           B ("616CC89B6969"))
        & Core_Locale_Catalog
          ("lt",
           "dabar",
           "vakar",
           B ("C5A169616E6469656E"),
           "rytoj",
           B ("2070726965C5A1"),
           "po ",
           B ("73656B756E64C497"),
           B ("73656B756E64C49773"),
           B ("6D696E7574C497"),
           B ("6D696E7574C49773"),
           "valanda",
           "valandos",
           "diena",
           "dienos",
           B ("736176616974C497"),
           B ("736176616974C49773"),
           B ("6DC4976E756F"),
           B ("6DC4976E6573696169"),
           "metai",
           "metai",
           "baitas",
           "baitai",
           B ("20C5AB6B7374"),
           " mln.",
           " mlrd.",
           " trln.",
           B ("74C5AB6B7374616E746973"),
           "milijonas",
           "milijardas",
           "trilijonas",
           "metras",
           "metrai",
           "kilometras",
           "kilometrai",
           "gramas",
           "gramai",
           "kilogramas",
           "kilogramai",
           "litras",
           "litrai",
           "centimetras",
           "centimetrai",
           "milimetras",
           "milimetrai",
           "miligramas",
           "miligramai",
           "mililitras",
           "mililitrai",
           "ir")
        & Added_Core_Locale_Catalog
          ("lt",
           B ("6D696C6973656B756E64C497"),
           B ("6D696C6973656B756E64C49773"),
           B ("6D696B726F73656B756E64C497"),
           B ("6D696B726F73656B756E64C49773"),
           B ("736176616974C497"),
           B ("736176616974C49773"),
           B ("6DC4976E756F"),
           B ("6DC4976E6573696169"),
           "metai",
           "metai",
           "niekada",
           B ("7669656EC485206B617274C485"),
           "du kartus",
           "kartas",
           "kartai",
           "apie",
           B ("6D61C5BE696175206E6569"),
           B ("7065722073656B756E64C499"),
           B ("706572206D696E7574C499"),
           B ("7065722076616C616E64C485"),
           B ("706572206469656EC485"),
           B ("70657220736176616974C499"),
           "kitas",
           "kiti")
        & Core_Locale_Catalog
          ("sl",
           "zdaj",
           B ("76636572616A"),
           "danes",
           "jutri",
           " nazaj",
           B ("C48D657A20"),
           "sekunda",
           "sekunde",
           "minuta",
           "minute",
           "ura",
           "ure",
           "dan",
           "dni",
           "teden",
           "tedni",
           "mesec",
           "meseci",
           "leto",
           "leta",
           "bajt",
           "bajti",
           " tis.",
           " mio.",
           " mrd.",
           " bln.",
           B ("7469736FC48D"),
           "milijon",
           "milijarda",
           "bilijon",
           "meter",
           "metri",
           "kilometer",
           "kilometri",
           "gram",
           "grami",
           "kilogram",
           "kilogrami",
           "liter",
           "litri",
           "centimeter",
           "centimetri",
           "milimeter",
           "milimetri",
           "miligram",
           "miligrami",
           "mililiter",
           "mililitri",
           "in")
        & Added_Core_Locale_Catalog
          ("sl",
           "milisekunda",
           "milisekunde",
           "mikrosekunda",
           "mikrosekunde",
           "teden",
           "tedni",
           "mesec",
           "meseci",
           "leto",
           "leta",
           "nikoli",
           "enkrat",
           "dvakrat",
           "krat",
           "krat",
           "priblizno",
           "manj kot",
           "na sekundo",
           "na minuto",
           "na uro",
           "na dan",
           "na teden",
           "drug",
           "drugi")
        & Core_Locale_Catalog
          ("id",
           "sekarang",
           "kemarin",
           "hari ini",
           "besok",
           " yang lalu",
           "dalam ",
           "detik",
           "detik",
           "menit",
           "menit",
           "jam",
           "jam",
           "hari",
           "hari",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "byte",
           "byte",
           " rb",
           " jt",
           " M",
           " T",
           "ribu",
           "juta",
           "miliar",
           "triliun",
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
           "sentimeter",
           "sentimeter",
           "milimeter",
           "milimeter",
           "miligram",
           "miligram",
           "mililiter",
           "mililiter",
           "dan")
        & Added_Core_Locale_Catalog
          ("id",
           "milidetik",
           "milidetik",
           "mikrodetik",
           "mikrodetik",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "tidak pernah",
           "sekali",
           "dua kali",
           "kali",
           "kali",
           "sekitar",
           "kurang dari",
           "per detik",
           "per menit",
           "per jam",
           "per hari",
           "per minggu",
           "lain",
           "lainnya")
        & Core_Locale_Catalog
          ("ms",
           "sekarang",
           "semalam",
           "hari ini",
           "esok",
           " yang lalu",
           "dalam ",
           "detik",
           "detik",
           "minit",
           "minit",
           "jam",
           "jam",
           "hari",
           "hari",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "bait",
           "bait",
           " rb",
           " jt",
           " B",
           " T",
           "ribu",
           "juta",
           "bilion",
           "trilion",
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
           "sentimeter",
           "sentimeter",
           "milimeter",
           "milimeter",
           "miligram",
           "miligram",
           "mililiter",
           "mililiter",
           "dan")
        & Added_Core_Locale_Catalog
          ("ms",
           "milidetik",
           "milidetik",
           "mikrodetik",
           "mikrodetik",
           "minggu",
           "minggu",
           "bulan",
           "bulan",
           "tahun",
           "tahun",
           "tidak pernah",
           "sekali",
           "dua kali",
           "kali",
           "kali",
           "kira-kira",
           "kurang daripada",
           "sesaat",
           "seminit",
           "sejam",
           "sehari",
           "seminggu",
           "lain",
           "lain-lain")
        & Core_Locale_Catalog
          ("eo",
           "nun",
           B ("68696572C485AD"),
           B ("686F646961C5AD"),
           B ("6D6F726761C5AD"),
           B ("20616E7461C5AD65"),
           "post ",
           "sekundo",
           "sekundoj",
           "minuto",
           "minutoj",
           "horo",
           "horoj",
           "tago",
           "tagoj",
           "semajno",
           "semajnoj",
           "monato",
           "monatoj",
           "jaro",
           "jaroj",
           "bajto",
           "bajtoj",
           " mil",
           " mln",
           " mld",
           " bln",
           "mil",
           "miliono",
           "miliardo",
           "biliono",
           "metro",
           "metroj",
           "kilometro",
           "kilometroj",
           "gramo",
           "gramoj",
           "kilogramo",
           "kilogramoj",
           "litro",
           "litroj",
           "centimetro",
           "centimetroj",
           "milimetro",
           "milimetroj",
           "miligramo",
           "miligramoj",
           "mililitro",
           "mililitroj",
           "kaj")
        & Added_Core_Locale_Catalog
          ("eo",
           "milisekundo",
           "milisekundoj",
           "mikrosekundo",
           "mikrosekundoj",
           "semajno",
           "semajnoj",
           "monato",
           "monatoj",
           "jaro",
           "jaroj",
           "neniam",
           "unufoje",
           "dufoje",
           "fojo",
           "fojoj",
           "proksimume",
           "malpli ol",
           "po sekundo",
           "po minuto",
           "po horo",
           "po tago",
           "po semajno",
           "alia",
           "aliaj")
        & Core_Locale_Catalog
          ("vi",
           "bay gio",
           "hom qua",
           "hom nay",
           "ngay mai",
           " truoc",
           "trong ",
           "giay",
           "giay",
           "phut",
           "phut",
           "gio",
           "gio",
           "ngay",
           "ngay",
           "tuan",
           "tuan",
           "thang",
           "thang",
           "nam",
           "nam",
           "byte",
           "byte",
           " nghin",
           " tr",
           " ty",
           " nghin ty",
           "nghin",
           "trieu",
           "ty",
           "nghin ty",
           "met",
           "met",
           "kilomet",
           "kilomet",
           "gam",
           "gam",
           "kilogam",
           "kilogam",
           "lit",
           "lit",
           "xentimet",
           "xentimet",
           "milimet",
           "milimet",
           "miligam",
           "miligam",
           "mililit",
           "mililit",
           "va")
        & Added_Core_Locale_Catalog
          ("vi",
           "mili giay",
           "mili giay",
           "micro giay",
           "micro giay",
           "tuan",
           "tuan",
           "thang",
           "thang",
           "nam",
           "nam",
           "khong bao gio",
           "mot lan",
           "hai lan",
           "lan",
           "lan",
           "khoang",
           "it hon",
           "moi giay",
           "moi phut",
           "moi gio",
           "moi ngay",
           "moi tuan",
           "khac",
           "khac")
        & Core_Locale_Catalog
          ("sw",
           "sasa",
           "jana",
           "leo",
           "kesho",
           " iliyopita",
           "baada ya ",
           "sekunde",
           "sekunde",
           "dakika",
           "dakika",
           "saa",
           "saa",
           "siku",
           "siku",
           "wiki",
           "wiki",
           "mwezi",
           "miezi",
           "mwaka",
           "miaka",
           "baiti",
           "baiti",
           " elfu",
           " mln",
           " bln",
           " tril",
           "elfu",
           "milioni",
           "bilioni",
           "trilioni",
           "mita",
           "mita",
           "kilomita",
           "kilomita",
           "gramu",
           "gramu",
           "kilogramu",
           "kilogramu",
           "lita",
           "lita",
           "sentimita",
           "sentimita",
           "milimita",
           "milimita",
           "miligramu",
           "miligramu",
           "mililita",
           "mililita",
           "na")
        & Added_Core_Locale_Catalog
          ("sw",
           "milisekunde",
           "milisekunde",
           "mikrosekunde",
           "mikrosekunde",
           "wiki",
           "wiki",
           "mwezi",
           "miezi",
           "mwaka",
           "miaka",
           "kamwe",
           "mara moja",
           "mara mbili",
           "mara",
           "mara",
           "takriban",
           "chini ya",
           "kwa sekunde",
           "kwa dakika",
           "kwa saa",
           "kwa siku",
           "kwa wiki",
           "nyingine",
           "nyingine")
        & Core_Locale_Catalog
          ("af",
           "nou",
           "gister",
           "vandag",
           "more",
           " gelede",
           "oor ",
           "sekonde",
           "sekondes",
           "minuut",
           "minute",
           "uur",
           "ure",
           "dag",
           "dae",
           "week",
           "weke",
           "maand",
           "maande",
           "jaar",
           "jaar",
           "greep",
           "grepe",
           " k",
           " mln",
           " mld",
           " bln",
           "duisend",
           "miljoen",
           "miljard",
           "biljoen",
           "meter",
           "meters",
           "kilometer",
           "kilometers",
           "gram",
           "gram",
           "kilogram",
           "kilogram",
           "liter",
           "liter",
           "sentimeter",
           "sentimeters",
           "millimeter",
           "millimeters",
           "milligram",
           "milligram",
           "milliliter",
           "milliliter",
           "en")
        & Added_Core_Locale_Catalog
          ("af",
           "millisekonde",
           "millisekondes",
           "mikrosekonde",
           "mikrosekondes",
           "week",
           "weke",
           "maand",
           "maande",
           "jaar",
           "jaar",
           "nooit",
           "een keer",
           "twee keer",
           "keer",
           "keer",
           "ongeveer",
           "minder as",
           "per sekonde",
           "per minuut",
           "per uur",
           "per dag",
           "per week",
           "ander",
           "ander")
        & Core_Locale_Catalog
          ("hu",
           "most",
           "tegnap",
           "ma",
           "holnap",
           " ezelott",
           "ennyi ido mulva: ",
           "masodperc",
           "masodperc",
           "perc",
           "perc",
           "ora",
           "ora",
           "nap",
           "nap",
           "het",
           "het",
           "honap",
           "honap",
           "ev",
           "ev",
           "bajt",
           "bajt",
           " e",
           " M",
           " Mrd",
           " B",
           "ezer",
           "millio",
           "milliard",
           "billio",
           "meter",
           "meter",
           "kilometer",
           "kilometer",
           "gramm",
           "gramm",
           "kilogramm",
           "kilogramm",
           "liter",
           "liter",
           "centimeter",
           "centimeter",
           "millimeter",
           "millimeter",
           "milligramm",
           "milligramm",
           "milliliter",
           "milliliter",
           "es")
        & Added_Core_Locale_Catalog
          ("hu",
           "ezredmasodperc",
           "ezredmasodperc",
           "mikromasodperc",
           "mikromasodperc",
           "het",
           "het",
           "honap",
           "honap",
           "ev",
           "ev",
           "soha",
           "egyszer",
           "ketszer",
           "alkalom",
           "alkalom",
           "korulbelul",
           "kevesebb mint",
           "masodpercenkent",
           "percenkent",
           "orankent",
           "naponta",
           "hetente",
           "masik",
           "masik")
        & Core_Locale_Catalog
          ("sk",
           "teraz",
           "vcera",
           "dnes",
           "zajtra",
           " dozadu",
           "o ",
           "sekunda",
           "sekundy",
           "minuta",
           "minuty",
           "hodina",
           "hodiny",
           "den",
           "dni",
           "tyzden",
           "tyzdne",
           "mesiac",
           "mesiace",
           "rok",
           "roky",
           "bajt",
           "bajty",
           " tis.",
           " mil.",
           " mld.",
           " bil.",
           "tisic",
           "milion",
           "miliarda",
           "bilion",
           "meter",
           "metre",
           "kilometer",
           "kilometre",
           "gram",
           "gramy",
           "kilogram",
           "kilogramy",
           "liter",
           "litre",
           "centimeter",
           "centimetre",
           "milimeter",
           "milimetre",
           "miligram",
           "miligramy",
           "mililiter",
           "mililitre",
           "a")
        & Added_Core_Locale_Catalog
          ("sk",
           "milisekunda",
           "milisekundy",
           "mikrosekunda",
           "mikrosekundy",
           "tyzden",
           "tyzdne",
           "mesiac",
           "mesiace",
           "rok",
           "roky",
           "nikdy",
           "raz",
           "dvakrat",
           "raz",
           "krat",
           "priblizne",
           "menej ako",
           "za sekundu",
           "za minutu",
           "za hodinu",
           "za den",
           "za tyzden",
           "iny",
           "ine")
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
