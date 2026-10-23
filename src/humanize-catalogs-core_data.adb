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
     & "und.humanize.duration.unit.day = {value, unit, day/unit-width-long}" & LF
     --  Decimal byte sizes in CLDR's own unit names ("4,5 Mo", "2 КБ"); the
     --  binary KiB family, which CLDR does not name, stays per locale.
     & "und.humanize.bytes.byte = {value, unit, byte/unit-width-long}" & LF
     & "und.humanize.bytes.kb = {value, unit, kilobyte/unit-width-short}" & LF
     & "und.humanize.bytes.mb = {value, unit, megabyte/unit-width-short}" & LF
     & "und.humanize.bytes.gb = {value, unit, gigabyte/unit-width-short}" & LF
     & "und.humanize.bytes.tb = {value, unit, terabyte/unit-width-short}" & LF
     --  A measurement in CLDR's unit for it, selected by the formatter.
     & "und.humanize.unit.measure = {suffix, select,"
     & " bit {{value, unit, bit/unit-width-short}}"
     & " kilobit {{value, unit, kilobit/unit-width-short}}"
     & " megabit {{value, unit, megabit/unit-width-short}}"
     & " gigabit {{value, unit, gigabit/unit-width-short}}"
     & " bit_per_second {{value, unit, bit/unit-width-short/second}}"
     & " kilobit_per_second {{value, unit, kilobit/unit-width-short/second}}"
     & " megabit_per_second {{value, unit, megabit/unit-width-short/second}}"
     & " gigabit_per_second {{value, unit, gigabit/unit-width-short/second}}"
     & " byte_per_second {{value, unit, byte/unit-width-short/second}}"
     & " kilobyte_per_second {{value, unit, kilobyte/unit-width-short/second}}"
     & " megabyte_per_second {{value, unit, megabyte/unit-width-short/second}}"
     & " gigabyte_per_second {{value, unit, gigabyte/unit-width-short/second}}"
     & " kilogram_per_cubic_meter {{value, unit, kilogram/unit-width-short/cubic-meter}}"
     & " meter_per_square_second {{value, unit, meter-per-square-second/unit-width-short}}"
     & " newton_meter {{value, unit, newton-meter/unit-width-short}}"
     & " liter_per_100_kilometer {{value, unit, liter-per-100-kilometer/unit-width-short}}"
     & " milliliter_per_second {{value, unit, milliliter/unit-width-short/second}}"
     & " liter_per_second {{value, unit, liter/unit-width-short/second}}"
     & " milliampere {{value, unit, milliampere/unit-width-short}}"
     & " ampere {{value, unit, ampere/unit-width-short}}"
     & " volt {{value, unit, volt/unit-width-short}}"
     & " ohm {{value, unit, ohm/unit-width-short}}"
     & " farad {{value, unit, farad/unit-width-short}}"
     & " henry {{value, unit, henry/unit-width-short}}"
     & " mole_per_liter {{value, unit, mole/unit-width-short/liter}}"
     & " mile_per_gallon {{value, unit, mile-per-gallon/unit-width-short}}"
     & " mile_per_hour {{value, unit, mile-per-hour/unit-width-short}}"
     & " second {{value, unit, second/unit-width-short}}"
     & " millisecond {{value, unit, millisecond/unit-width-short}}"
     & " microsecond {{value, unit, microsecond/unit-width-short}}"
     & " point {{value, unit, point/unit-width-short}}"
     & " pixel_per_inch {{value, unit, pixel-per-inch/unit-width-short}}"
     & " dot_per_inch {{value, unit, dot-per-inch/unit-width-short}}"
     & " candela_per_square_meter {{value, unit, candela/unit-width-short/square-meter}}"
     & " percent {{value, unit, percent/unit-width-short}}"
     & " hertz {{value, unit, hertz/unit-width-short}}"
     & " inch {{value, unit, inch/unit-width-short}}"
     & " other {}}" & LF
     --  An SI symbol CLDR has no unit for, after the localized number.
     & "und.humanize.unit.symbol = {value, number} {suffix}" & LF
     --  A number in words, by CLDR's spell-out rules.
     & "und.humanize.number.spellout = {value, number, ::spellout}" & LF
     --  A count and the caller's noun, in the locale's plural category.
     & "und.humanize.lists.count = {count, plural, one {# {value}} other {# {suffix}}}" & LF
     --  A compact duration: CLDR's narrow units, joined by its narrow unit list.
     & "und.humanize.duration.narrow = {suffix, select,"
     & " second {{value, unit, second/unit-width-narrow}}"
     & " minute {{value, unit, minute/unit-width-narrow}}"
     & " hour {{value, unit, hour/unit-width-narrow}}"
     & " day {{value, unit, day/unit-width-narrow}}"
     & " week {{value, unit, week/unit-width-narrow}}"
     & " month {{value, unit, month/unit-width-narrow}}"
     & " year {{value, unit, year/unit-width-narrow}}"
     & " other {}}" & LF
     & "und.humanize.list.unit_narrow = {value, list, unit-narrow}" & LF
     --  Ordinal words, a percentage in words and a plain number, by CLDR.
     & "und.humanize.number.ordinal_words = {value, number, ::ordinal-words}" & LF
     & "und.humanize.number.percent_unit = {value, unit, percent/unit-width-full-name}" & LF
     & "und.humanize.number.plain = {value, number}" & LF
     --  The generic phrase key; each phrase has its own key below it.
     & "und.humanize.phrase = {value}" & LF
     --  A calendar difference's parts: CLDR's long units and unit list.
     --  The unit in the case the locale's frame governs (calendar_difference.case.*).
     & "und.humanize.phrase.calendar_difference.part = {unit, select,"
     & " year {{case, select,"
     & " accusative {{value, unit, year/unit-width-long@accusative}}"
     & " dative {{value, unit, year/unit-width-long@dative}}"
     & " genitive {{value, unit, year/unit-width-long@genitive}}"
     & " instrumental {{value, unit, year/unit-width-long@instrumental}}"
     & " locative {{value, unit, year/unit-width-long@locative}}"
     & " prepositional {{value, unit, year/unit-width-long@prepositional}}"
     & " elative {{value, unit, year/unit-width-long@elative}}"
     & " illative {{value, unit, year/unit-width-long@illative}}"
     & " partitive {{value, unit, year/unit-width-long@partitive}}"
     & " other {{value, unit, year/unit-width-long}}}}"
     & " month {{case, select,"
     & " accusative {{value, unit, month/unit-width-long@accusative}}"
     & " dative {{value, unit, month/unit-width-long@dative}}"
     & " genitive {{value, unit, month/unit-width-long@genitive}}"
     & " instrumental {{value, unit, month/unit-width-long@instrumental}}"
     & " locative {{value, unit, month/unit-width-long@locative}}"
     & " prepositional {{value, unit, month/unit-width-long@prepositional}}"
     & " elative {{value, unit, month/unit-width-long@elative}}"
     & " illative {{value, unit, month/unit-width-long@illative}}"
     & " partitive {{value, unit, month/unit-width-long@partitive}}"
     & " other {{value, unit, month/unit-width-long}}}}"
     & " day {{case, select,"
     & " accusative {{value, unit, day/unit-width-long@accusative}}"
     & " dative {{value, unit, day/unit-width-long@dative}}"
     & " genitive {{value, unit, day/unit-width-long@genitive}}"
     & " instrumental {{value, unit, day/unit-width-long@instrumental}}"
     & " locative {{value, unit, day/unit-width-long@locative}}"
     & " prepositional {{value, unit, day/unit-width-long@prepositional}}"
     & " elative {{value, unit, day/unit-width-long@elative}}"
     & " illative {{value, unit, day/unit-width-long@illative}}"
     & " partitive {{value, unit, day/unit-width-long@partitive}}"
     & " other {{value, unit, day/unit-width-long}}}}"
     & " other {}}" & LF
     & "und.humanize.phrase.calendar_difference.join = {value, list, unit}" & LF
     & "und.humanize.phrase.summary.join = {value, list}" & LF
     --  A count and the caller's noun, or the noun alone, in the locale's
     --  plural category with the noun forms the caller registered.
     & "und.humanize.phrase.count = {count, plural, zero {# {zero}} one {# {one}} two {# {two}}"
     & " few {# {few}} many {# {many}} other {# {other}}}" & LF
     & "und.humanize.phrase.noun = {count, plural, zero {{zero}} one {{one}} two {{two}}"
     & " few {{few}} many {{many}} other {{other}}}" & LF
     --  The noun in a case: where a language has no entry, the nominative.
     & "und.humanize.phrase.noun.accusative = {count, plural, zero {{zero}} one {{accusative_one}}"
     & " two {{two}} few {{few}} many {{many}} other {{accusative_other}}}" & LF
     --  "last week", "this month", "next year": CLDR's relative names.
     & "und.humanize.phrase.calendar_relation.week.past = {minus_one, relative, week}" & LF
     & "und.humanize.phrase.calendar_relation.week.current = {zero, relative, week}" & LF
     & "und.humanize.phrase.calendar_relation.week.next = {plus_one, relative, week}" & LF
     & "und.humanize.phrase.calendar_relation.month.past = {minus_one, relative, month}" & LF
     & "und.humanize.phrase.calendar_relation.month.current = {zero, relative, month}" & LF
     & "und.humanize.phrase.calendar_relation.month.next = {plus_one, relative, month}" & LF
     & "und.humanize.phrase.calendar_relation.year.past = {minus_one, relative, year}" & LF
     & "und.humanize.phrase.calendar_relation.year.current = {zero, relative, year}" & LF
     & "und.humanize.phrase.calendar_relation.year.next = {plus_one, relative, year}" & LF
     --  An amount in a currency CLDR knows, by the locale's currency pattern
     --  and symbol (one branch per ISO code in i18n's currency data).
     & "und.humanize.number.currency = {suffix, select,"
     & " ADP {{value, number, ::currency/ADP}}"
     & " AED {{value, number, ::currency/AED}}"
     & " AFA {{value, number, ::currency/AFA}}"
     & " AFN {{value, number, ::currency/AFN}}"
     & " ALK {{value, number, ::currency/ALK}}"
     & " ALL {{value, number, ::currency/ALL}}"
     & " AMD {{value, number, ::currency/AMD}}"
     & " ANG {{value, number, ::currency/ANG}}"
     & " AOA {{value, number, ::currency/AOA}}"
     & " AOK {{value, number, ::currency/AOK}}"
     & " AON {{value, number, ::currency/AON}}"
     & " AOR {{value, number, ::currency/AOR}}"
     & " ARA {{value, number, ::currency/ARA}}"
     & " ARL {{value, number, ::currency/ARL}}"
     & " ARM {{value, number, ::currency/ARM}}"
     & " ARP {{value, number, ::currency/ARP}}"
     & " ARS {{value, number, ::currency/ARS}}"
     & " ATS {{value, number, ::currency/ATS}}"
     & " AUD {{value, number, ::currency/AUD}}"
     & " AWG {{value, number, ::currency/AWG}}"
     & " AZM {{value, number, ::currency/AZM}}"
     & " AZN {{value, number, ::currency/AZN}}"
     & " BAD {{value, number, ::currency/BAD}}"
     & " BAM {{value, number, ::currency/BAM}}"
     & " BAN {{value, number, ::currency/BAN}}"
     & " BBD {{value, number, ::currency/BBD}}"
     & " BDT {{value, number, ::currency/BDT}}"
     & " BEC {{value, number, ::currency/BEC}}"
     & " BEF {{value, number, ::currency/BEF}}"
     & " BEL {{value, number, ::currency/BEL}}"
     & " BGL {{value, number, ::currency/BGL}}"
     & " BGM {{value, number, ::currency/BGM}}"
     & " BGN {{value, number, ::currency/BGN}}"
     & " BGO {{value, number, ::currency/BGO}}"
     & " BHD {{value, number, ::currency/BHD}}"
     & " BIF {{value, number, ::currency/BIF}}"
     & " BMD {{value, number, ::currency/BMD}}"
     & " BND {{value, number, ::currency/BND}}"
     & " BOB {{value, number, ::currency/BOB}}"
     & " BOL {{value, number, ::currency/BOL}}"
     & " BOP {{value, number, ::currency/BOP}}"
     & " BOV {{value, number, ::currency/BOV}}"
     & " BRB {{value, number, ::currency/BRB}}"
     & " BRC {{value, number, ::currency/BRC}}"
     & " BRE {{value, number, ::currency/BRE}}"
     & " BRL {{value, number, ::currency/BRL}}"
     & " BRN {{value, number, ::currency/BRN}}"
     & " BRR {{value, number, ::currency/BRR}}"
     & " BRZ {{value, number, ::currency/BRZ}}"
     & " BSD {{value, number, ::currency/BSD}}"
     & " BTN {{value, number, ::currency/BTN}}"
     & " BUK {{value, number, ::currency/BUK}}"
     & " BWP {{value, number, ::currency/BWP}}"
     & " BYB {{value, number, ::currency/BYB}}"
     & " BYN {{value, number, ::currency/BYN}}"
     & " BYR {{value, number, ::currency/BYR}}"
     & " BZD {{value, number, ::currency/BZD}}"
     & " CAD {{value, number, ::currency/CAD}}"
     & " CDF {{value, number, ::currency/CDF}}"
     & " CHE {{value, number, ::currency/CHE}}"
     & " CHF {{value, number, ::currency/CHF}}"
     & " CHW {{value, number, ::currency/CHW}}"
     & " CLE {{value, number, ::currency/CLE}}"
     & " CLF {{value, number, ::currency/CLF}}"
     & " CLP {{value, number, ::currency/CLP}}"
     & " CNH {{value, number, ::currency/CNH}}"
     & " CNX {{value, number, ::currency/CNX}}"
     & " CNY {{value, number, ::currency/CNY}}"
     & " COP {{value, number, ::currency/COP}}"
     & " COU {{value, number, ::currency/COU}}"
     & " CRC {{value, number, ::currency/CRC}}"
     & " CSD {{value, number, ::currency/CSD}}"
     & " CSK {{value, number, ::currency/CSK}}"
     & " CUC {{value, number, ::currency/CUC}}"
     & " CUP {{value, number, ::currency/CUP}}"
     & " CVE {{value, number, ::currency/CVE}}"
     & " CYP {{value, number, ::currency/CYP}}"
     & " CZK {{value, number, ::currency/CZK}}"
     & " DDM {{value, number, ::currency/DDM}}"
     & " DEM {{value, number, ::currency/DEM}}"
     & " DJF {{value, number, ::currency/DJF}}"
     & " DKK {{value, number, ::currency/DKK}}"
     & " DOP {{value, number, ::currency/DOP}}"
     & " DZD {{value, number, ::currency/DZD}}"
     & " ECS {{value, number, ::currency/ECS}}"
     & " ECV {{value, number, ::currency/ECV}}"
     & " EEK {{value, number, ::currency/EEK}}"
     & " EGP {{value, number, ::currency/EGP}}"
     & " ERN {{value, number, ::currency/ERN}}"
     & " ESA {{value, number, ::currency/ESA}}"
     & " ESB {{value, number, ::currency/ESB}}"
     & " ESP {{value, number, ::currency/ESP}}"
     & " ETB {{value, number, ::currency/ETB}}"
     & " EUR {{value, number, ::currency/EUR}}"
     & " FIM {{value, number, ::currency/FIM}}"
     & " FJD {{value, number, ::currency/FJD}}"
     & " FKP {{value, number, ::currency/FKP}}"
     & " FRF {{value, number, ::currency/FRF}}"
     & " GBP {{value, number, ::currency/GBP}}"
     & " GEK {{value, number, ::currency/GEK}}"
     & " GEL {{value, number, ::currency/GEL}}"
     & " GHC {{value, number, ::currency/GHC}}"
     & " GHS {{value, number, ::currency/GHS}}"
     & " GIP {{value, number, ::currency/GIP}}"
     & " GMD {{value, number, ::currency/GMD}}"
     & " GNF {{value, number, ::currency/GNF}}"
     & " GNS {{value, number, ::currency/GNS}}"
     & " GQE {{value, number, ::currency/GQE}}"
     & " GRD {{value, number, ::currency/GRD}}"
     & " GTQ {{value, number, ::currency/GTQ}}"
     & " GWE {{value, number, ::currency/GWE}}"
     & " GWP {{value, number, ::currency/GWP}}"
     & " GYD {{value, number, ::currency/GYD}}"
     & " HKD {{value, number, ::currency/HKD}}"
     & " HNL {{value, number, ::currency/HNL}}"
     & " HRD {{value, number, ::currency/HRD}}"
     & " HRK {{value, number, ::currency/HRK}}"
     & " HTG {{value, number, ::currency/HTG}}"
     & " HUF {{value, number, ::currency/HUF}}"
     & " IDR {{value, number, ::currency/IDR}}"
     & " IEP {{value, number, ::currency/IEP}}"
     & " ILP {{value, number, ::currency/ILP}}"
     & " ILR {{value, number, ::currency/ILR}}"
     & " ILS {{value, number, ::currency/ILS}}"
     & " INR {{value, number, ::currency/INR}}"
     & " IQD {{value, number, ::currency/IQD}}"
     & " IRR {{value, number, ::currency/IRR}}"
     & " ISJ {{value, number, ::currency/ISJ}}"
     & " ISK {{value, number, ::currency/ISK}}"
     & " ITL {{value, number, ::currency/ITL}}"
     & " JMD {{value, number, ::currency/JMD}}"
     & " JOD {{value, number, ::currency/JOD}}"
     & " JPY {{value, number, ::currency/JPY}}"
     & " KES {{value, number, ::currency/KES}}"
     & " KGS {{value, number, ::currency/KGS}}"
     & " KHR {{value, number, ::currency/KHR}}"
     & " KMF {{value, number, ::currency/KMF}}"
     & " KPW {{value, number, ::currency/KPW}}"
     & " KRH {{value, number, ::currency/KRH}}"
     & " KRO {{value, number, ::currency/KRO}}"
     & " KRW {{value, number, ::currency/KRW}}"
     & " KWD {{value, number, ::currency/KWD}}"
     & " KYD {{value, number, ::currency/KYD}}"
     & " KZT {{value, number, ::currency/KZT}}"
     & " LAK {{value, number, ::currency/LAK}}"
     & " LBP {{value, number, ::currency/LBP}}"
     & " LKR {{value, number, ::currency/LKR}}"
     & " LRD {{value, number, ::currency/LRD}}"
     & " LSL {{value, number, ::currency/LSL}}"
     & " LTL {{value, number, ::currency/LTL}}"
     & " LTT {{value, number, ::currency/LTT}}"
     & " LUC {{value, number, ::currency/LUC}}"
     & " LUF {{value, number, ::currency/LUF}}"
     & " LUL {{value, number, ::currency/LUL}}"
     & " LVL {{value, number, ::currency/LVL}}"
     & " LVR {{value, number, ::currency/LVR}}"
     & " LYD {{value, number, ::currency/LYD}}"
     & " MAD {{value, number, ::currency/MAD}}"
     & " MAF {{value, number, ::currency/MAF}}"
     & " MCF {{value, number, ::currency/MCF}}"
     & " MDC {{value, number, ::currency/MDC}}"
     & " MDL {{value, number, ::currency/MDL}}"
     & " MGA {{value, number, ::currency/MGA}}"
     & " MGF {{value, number, ::currency/MGF}}"
     & " MKD {{value, number, ::currency/MKD}}"
     & " MKN {{value, number, ::currency/MKN}}"
     & " MLF {{value, number, ::currency/MLF}}"
     & " MMK {{value, number, ::currency/MMK}}"
     & " MNT {{value, number, ::currency/MNT}}"
     & " MOP {{value, number, ::currency/MOP}}"
     & " MRO {{value, number, ::currency/MRO}}"
     & " MRU {{value, number, ::currency/MRU}}"
     & " MTL {{value, number, ::currency/MTL}}"
     & " MTP {{value, number, ::currency/MTP}}"
     & " MUR {{value, number, ::currency/MUR}}"
     & " MVP {{value, number, ::currency/MVP}}"
     & " MVR {{value, number, ::currency/MVR}}"
     & " MWK {{value, number, ::currency/MWK}}"
     & " MXN {{value, number, ::currency/MXN}}"
     & " MXP {{value, number, ::currency/MXP}}"
     & " MXV {{value, number, ::currency/MXV}}"
     & " MYR {{value, number, ::currency/MYR}}"
     & " MZE {{value, number, ::currency/MZE}}"
     & " MZM {{value, number, ::currency/MZM}}"
     & " MZN {{value, number, ::currency/MZN}}"
     & " NAD {{value, number, ::currency/NAD}}"
     & " NGN {{value, number, ::currency/NGN}}"
     & " NIC {{value, number, ::currency/NIC}}"
     & " NIO {{value, number, ::currency/NIO}}"
     & " NLG {{value, number, ::currency/NLG}}"
     & " NOK {{value, number, ::currency/NOK}}"
     & " NPR {{value, number, ::currency/NPR}}"
     & " NZD {{value, number, ::currency/NZD}}"
     & " OMR {{value, number, ::currency/OMR}}"
     & " PAB {{value, number, ::currency/PAB}}"
     & " PEI {{value, number, ::currency/PEI}}"
     & " PEN {{value, number, ::currency/PEN}}"
     & " PES {{value, number, ::currency/PES}}"
     & " PGK {{value, number, ::currency/PGK}}"
     & " PHP {{value, number, ::currency/PHP}}"
     & " PKR {{value, number, ::currency/PKR}}"
     & " PLN {{value, number, ::currency/PLN}}"
     & " PLZ {{value, number, ::currency/PLZ}}"
     & " PTE {{value, number, ::currency/PTE}}"
     & " PYG {{value, number, ::currency/PYG}}"
     & " QAR {{value, number, ::currency/QAR}}"
     & " RHD {{value, number, ::currency/RHD}}"
     & " ROL {{value, number, ::currency/ROL}}"
     & " RON {{value, number, ::currency/RON}}"
     & " RSD {{value, number, ::currency/RSD}}"
     & " RUB {{value, number, ::currency/RUB}}"
     & " RUR {{value, number, ::currency/RUR}}"
     & " RWF {{value, number, ::currency/RWF}}"
     & " SAR {{value, number, ::currency/SAR}}"
     & " SBD {{value, number, ::currency/SBD}}"
     & " SCR {{value, number, ::currency/SCR}}"
     & " SDD {{value, number, ::currency/SDD}}"
     & " SDG {{value, number, ::currency/SDG}}"
     & " SDP {{value, number, ::currency/SDP}}"
     & " SEK {{value, number, ::currency/SEK}}"
     & " SGD {{value, number, ::currency/SGD}}"
     & " SHP {{value, number, ::currency/SHP}}"
     & " SIT {{value, number, ::currency/SIT}}"
     & " SKK {{value, number, ::currency/SKK}}"
     & " SLE {{value, number, ::currency/SLE}}"
     & " SLL {{value, number, ::currency/SLL}}"
     & " SOS {{value, number, ::currency/SOS}}"
     & " SRD {{value, number, ::currency/SRD}}"
     & " SRG {{value, number, ::currency/SRG}}"
     & " SSP {{value, number, ::currency/SSP}}"
     & " STD {{value, number, ::currency/STD}}"
     & " STN {{value, number, ::currency/STN}}"
     & " SUR {{value, number, ::currency/SUR}}"
     & " SVC {{value, number, ::currency/SVC}}"
     & " SYP {{value, number, ::currency/SYP}}"
     & " SZL {{value, number, ::currency/SZL}}"
     & " THB {{value, number, ::currency/THB}}"
     & " TJR {{value, number, ::currency/TJR}}"
     & " TJS {{value, number, ::currency/TJS}}"
     & " TMM {{value, number, ::currency/TMM}}"
     & " TMT {{value, number, ::currency/TMT}}"
     & " TND {{value, number, ::currency/TND}}"
     & " TOP {{value, number, ::currency/TOP}}"
     & " TPE {{value, number, ::currency/TPE}}"
     & " TRL {{value, number, ::currency/TRL}}"
     & " TRY {{value, number, ::currency/TRY}}"
     & " TTD {{value, number, ::currency/TTD}}"
     & " TWD {{value, number, ::currency/TWD}}"
     & " TZS {{value, number, ::currency/TZS}}"
     & " UAH {{value, number, ::currency/UAH}}"
     & " UAK {{value, number, ::currency/UAK}}"
     & " UGS {{value, number, ::currency/UGS}}"
     & " UGX {{value, number, ::currency/UGX}}"
     & " USD {{value, number, ::currency/USD}}"
     & " USN {{value, number, ::currency/USN}}"
     & " USS {{value, number, ::currency/USS}}"
     & " UYI {{value, number, ::currency/UYI}}"
     & " UYP {{value, number, ::currency/UYP}}"
     & " UYU {{value, number, ::currency/UYU}}"
     & " UYW {{value, number, ::currency/UYW}}"
     & " UZS {{value, number, ::currency/UZS}}"
     & " VEB {{value, number, ::currency/VEB}}"
     & " VED {{value, number, ::currency/VED}}"
     & " VEF {{value, number, ::currency/VEF}}"
     & " VES {{value, number, ::currency/VES}}"
     & " VND {{value, number, ::currency/VND}}"
     & " VNN {{value, number, ::currency/VNN}}"
     & " VUV {{value, number, ::currency/VUV}}"
     & " WST {{value, number, ::currency/WST}}"
     & " XAF {{value, number, ::currency/XAF}}"
     & " XAG {{value, number, ::currency/XAG}}"
     & " XAU {{value, number, ::currency/XAU}}"
     & " XBA {{value, number, ::currency/XBA}}"
     & " XBB {{value, number, ::currency/XBB}}"
     & " XBC {{value, number, ::currency/XBC}}"
     & " XBD {{value, number, ::currency/XBD}}"
     & " XCD {{value, number, ::currency/XCD}}"
     & " XCG {{value, number, ::currency/XCG}}"
     & " XDR {{value, number, ::currency/XDR}}"
     & " XEU {{value, number, ::currency/XEU}}"
     & " XFO {{value, number, ::currency/XFO}}"
     & " XFU {{value, number, ::currency/XFU}}"
     & " XOF {{value, number, ::currency/XOF}}"
     & " XPD {{value, number, ::currency/XPD}}"
     & " XPF {{value, number, ::currency/XPF}}"
     & " XPT {{value, number, ::currency/XPT}}"
     & " XRE {{value, number, ::currency/XRE}}"
     & " XSU {{value, number, ::currency/XSU}}"
     & " XTS {{value, number, ::currency/XTS}}"
     & " XUA {{value, number, ::currency/XUA}}"
     & " XXX {{value, number, ::currency/XXX}}"
     & " YDD {{value, number, ::currency/YDD}}"
     & " YER {{value, number, ::currency/YER}}"
     & " YUD {{value, number, ::currency/YUD}}"
     & " YUM {{value, number, ::currency/YUM}}"
     & " YUN {{value, number, ::currency/YUN}}"
     & " YUR {{value, number, ::currency/YUR}}"
     & " ZAL {{value, number, ::currency/ZAL}}"
     & " ZAR {{value, number, ::currency/ZAR}}"
     & " ZMK {{value, number, ::currency/ZMK}}"
     & " ZMW {{value, number, ::currency/ZMW}}"
     & " ZRN {{value, number, ::currency/ZRN}}"
     & " ZRZ {{value, number, ::currency/ZRZ}}"
     & " ZWD {{value, number, ::currency/ZWD}}"
     & " ZWG {{value, number, ::currency/ZWG}}"
     & " ZWL {{value, number, ::currency/ZWL}}"
     & " ZWR {{value, number, ::currency/ZWR}}"
     & " other {}}" & LF
     --  The clock label: the time in the locale's own hour cycle, a weekday,
     --  a date, and CLDR's "last Monday" / "next Monday".
     & "und.humanize.datetime.clock.time = {value, time, ::jm}" & LF
     & "und.humanize.datetime.clock.weekday = {value, date, ::EEEE}" & LF
     & "und.humanize.datetime.clock.date = {value, date, medium}" & LF
     --  Calendar_Date_Label's presets outside English, as CLDR writes dates.
     & "und.humanize.phrase.calendar_date.short = {value, date, short}" & LF
     & "und.humanize.phrase.calendar_date.medium = {value, date, medium}" & LF
     & "und.humanize.phrase.calendar_date.long = {value, date, full}" & LF
     & "und.humanize.phrase.calendar_date.weekday = {value, date, ::yMMMEd}" & LF
     & "und.humanize.phrase.calendar_date.month_year = {value, date, ::yMMM}" & LF
     & "und.humanize.phrase.calendar_date.quarter = {value, date, ::yQQQ}" & LF
     & "und.humanize.datetime.weekday.previous = "
     & "{value, select,"
     & " mon {{minus_one, relative, mon}}"
     & " tue {{minus_one, relative, tue}}"
     & " wed {{minus_one, relative, wed}}"
     & " thu {{minus_one, relative, thu}}"
     & " fri {{minus_one, relative, fri}}"
     & " sat {{minus_one, relative, sat}}"
     & " sun {{minus_one, relative, sun}}"
     & " other {}}" & LF
     & "und.humanize.datetime.weekday.next = "
     & "{value, select,"
     & " mon {{plus_one, relative, mon}}"
     & " tue {{plus_one, relative, tue}}"
     & " wed {{plus_one, relative, wed}}"
     & " thu {{plus_one, relative, thu}}"
     & " fri {{plus_one, relative, fri}}"
     & " sat {{plus_one, relative, sat}}"
     & " sun {{plus_one, relative, sun}}"
     & " other {}}" & LF;

   --  English catalog fragment. Catalog values are unquoted; i18n trims the
   --  text after the first '=' separator.
   English : constant String :=
     "en.humanize.bytes.kib = {value, number} KiB" & LF
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
     "da.humanize.bytes.kib = {value, number} KiB" & LF
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
     "de.humanize.bytes.kib = {value, number} KiB" & LF
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
     "fr.humanize.bytes.kib = {value, number} KiB" & LF
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
     "es.humanize.bytes.kib = {value, number} KiB" & LF
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
     "it.humanize.bytes.kib = {value, number} KiB" & LF
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
     "pt.humanize.bytes.kib = " & "{value, number} KiB" & LF
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
