with Humanize.Catalogs.Encoding;

package body Humanize.Catalogs.Core_Data is

   --  Provenance: Humanize-owned catalog data maintained in source. Review
   --  this body with docs/QUALITY_GUARDS.md before changing locale coverage.

   LF : constant String := [1 => ASCII.LF];

   ATILDE : String renames Humanize.Catalogs.Encoding.ATILDE;
   EGRAVE : String renames Humanize.Catalogs.Encoding.EGRAVE;
   FEMORD : String renames Humanize.Catalogs.Encoding.FEMORD;
   IACUTE : String renames Humanize.Catalogs.Encoding.IACUTE;
   OACUTE : String renames Humanize.Catalogs.Encoding.OACUTE;
   ORDM   : String renames Humanize.Catalogs.Encoding.ORDM;
   OTILDE : String renames Humanize.Catalogs.Encoding.OTILDE;

   --  Locale-neutral entries: CLDR-backed patterns that messages renders in
   --  the requested locale ("vor 2 Stunden", "í gær", "5 klukkustundir"), so
   --  relative times, the named days and duration units read natively in
   --  every locale CLDR covers rather than in a hand-kept few.
   Neutral : constant String :=
     "und.humanize.datetime.now = {zero, relative, second}" & LF
     & "und.humanize.datetime.day.previous = {minus_one, relative, day}" & LF
     & "und.humanize.datetime.day.current = {zero, relative, day}" & LF
     & "und.humanize.datetime.day.next = {plus_one, relative, day}" & LF
     & "und.humanize.datetime.relative.second.past = {past_count, relative, second}" & LF
     & "und.humanize.datetime.relative.second.future = {count, relative, second}" & LF
     & "und.humanize.datetime.relative.minute.past = {past_count, relative, minute}" & LF
     & "und.humanize.datetime.relative.minute.future = {count, relative, minute}" & LF
     & "und.humanize.datetime.relative.hour.past = {past_count, relative, hour}" & LF
     & "und.humanize.datetime.relative.hour.future = {count, relative, hour}" & LF
     & "und.humanize.datetime.relative.day.past = {past_count, relative, day}" & LF
     & "und.humanize.datetime.relative.day.future = {count, relative, day}" & LF
     & "und.humanize.datetime.relative.week.past = {past_count, relative, week}" & LF
     & "und.humanize.datetime.relative.week.future = {count, relative, week}" & LF
     & "und.humanize.datetime.relative.month.past = {past_count, relative, month}" & LF
     & "und.humanize.datetime.relative.month.future = {count, relative, month}" & LF
     & "und.humanize.datetime.relative.year.past = {past_count, relative, year}" & LF
     & "und.humanize.datetime.relative.year.future = {count, relative, year}" & LF
     & "und.humanize.duration.unit.second = {value, unit, second/unit-width-long}" & LF
     & "und.humanize.duration.unit.minute = {value, unit, minute/unit-width-long}" & LF
     & "und.humanize.duration.unit.hour = {value, unit, hour/unit-width-long}" & LF
     & "und.humanize.duration.unit.day = {value, unit, day/unit-width-long}" & LF;

   --  English catalog fragment. Catalog values are unquoted; i18n trims the
   --  text after the first '=' separator.
   English : constant String :=
     "en.humanize.bytes.byte = "
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
     "da.humanize.bytes.byte = "
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
     "de.humanize.bytes.byte = "
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
     "fr.humanize.bytes.byte = "
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
     "es.humanize.bytes.byte = "
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
     "it.humanize.bytes.byte = "
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
     "pt.humanize.bytes.byte = "
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

   function Default_Catalog return String is
   begin
      return Neutral & English & Danish & German & French & Spanish & Italian & Portuguese;
   end Default_Catalog;

end Humanize.Catalogs.Core_Data;
