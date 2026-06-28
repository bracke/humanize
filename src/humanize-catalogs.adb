package body Humanize.Catalogs is

   LF : constant String := [1 => ASCII.LF];

   --  UTF-8 byte sequence for the Danish letter 'å' (U+00E5). Written as
   --  explicit bytes so the catalog is UTF-8 regardless of how the compiler
   --  interprets the source encoding for String literals.
   AA : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);

   --  English catalog fragment. Catalog values are unquoted; i18n trims the
   --  text after the first '=' separator.
   English : constant String :=
     "en.humanize.datetime.now = now" & LF
     & "en.humanize.datetime.day.previous = yesterday" & LF
     & "en.humanize.datetime.day.current = today" & LF
     & "en.humanize.datetime.day.next = tomorrow" & LF
     & "en.humanize.datetime.relative.second.past = "
     & "{count, plural, one {# second ago} other {# seconds ago}}" & LF
     & "en.humanize.datetime.relative.second.future = "
     & "{count, plural, one {in # second} other {in # seconds}}" & LF
     & "en.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {# minute ago} other {# minutes ago}}" & LF
     & "en.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {in # minute} other {in # minutes}}" & LF
     & "en.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {# hour ago} other {# hours ago}}" & LF
     & "en.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {in # hour} other {in # hours}}" & LF
     & "en.humanize.datetime.relative.day.past = "
     & "{count, plural, one {# day ago} other {# days ago}}" & LF
     & "en.humanize.datetime.relative.day.future = "
     & "{count, plural, one {in # day} other {in # days}}" & LF
     & "en.humanize.datetime.relative.week.past = "
     & "{count, plural, one {# week ago} other {# weeks ago}}" & LF
     & "en.humanize.datetime.relative.week.future = "
     & "{count, plural, one {in # week} other {in # weeks}}" & LF
     & "en.humanize.datetime.relative.month.past = "
     & "{count, plural, one {# month ago} other {# months ago}}" & LF
     & "en.humanize.datetime.relative.month.future = "
     & "{count, plural, one {in # month} other {in # months}}" & LF
     & "en.humanize.datetime.relative.year.past = "
     & "{count, plural, one {# year ago} other {# years ago}}" & LF
     & "en.humanize.datetime.relative.year.future = "
     & "{count, plural, one {in # year} other {in # years}}" & LF
     & "en.humanize.duration.unit.second = "
     & "{count, plural, one {# second} other {# seconds}}" & LF
     & "en.humanize.duration.unit.minute = "
     & "{count, plural, one {# minute} other {# minutes}}" & LF
     & "en.humanize.duration.unit.hour = "
     & "{count, plural, one {# hour} other {# hours}}" & LF
     & "en.humanize.duration.unit.day = "
     & "{count, plural, one {# day} other {# days}}" & LF
     & "en.humanize.bytes.byte = "
     & "{count, plural, one {# byte} other {# bytes}}" & LF
     & "en.humanize.bytes.kb = {value} kB" & LF
     & "en.humanize.bytes.mb = {value} MB" & LF
     & "en.humanize.bytes.gb = {value} GB" & LF
     & "en.humanize.bytes.tb = {value} TB" & LF
     & "en.humanize.bytes.kib = {value} KiB" & LF
     & "en.humanize.bytes.mib = {value} MiB" & LF
     & "en.humanize.bytes.gib = {value} GiB" & LF
     & "en.humanize.bytes.tib = {value} TiB" & LF;

   --  Danish catalog fragment. 'å' is spliced via AA to keep UTF-8 output.
   Danish : constant String :=
     "da.humanize.datetime.now = nu" & LF
     & "da.humanize.datetime.day.previous = i g" & AA & "r" & LF
     & "da.humanize.datetime.day.current = i dag" & LF
     & "da.humanize.datetime.day.next = i morgen" & LF
     & "da.humanize.datetime.relative.second.past = "
     & "{count, plural, one {for # sekund siden} "
     & "other {for # sekunder siden}}" & LF
     & "da.humanize.datetime.relative.second.future = "
     & "{count, plural, one {om # sekund} other {om # sekunder}}" & LF
     & "da.humanize.datetime.relative.minute.past = "
     & "{count, plural, one {for # minut siden} "
     & "other {for # minutter siden}}" & LF
     & "da.humanize.datetime.relative.minute.future = "
     & "{count, plural, one {om # minut} other {om # minutter}}" & LF
     & "da.humanize.datetime.relative.hour.past = "
     & "{count, plural, one {for # time siden} other {for # timer siden}}" & LF
     & "da.humanize.datetime.relative.hour.future = "
     & "{count, plural, one {om # time} other {om # timer}}" & LF
     & "da.humanize.datetime.relative.day.past = "
     & "{count, plural, one {for # dag siden} other {for # dage siden}}" & LF
     & "da.humanize.datetime.relative.day.future = "
     & "{count, plural, one {om # dag} other {om # dage}}" & LF
     & "da.humanize.datetime.relative.week.past = "
     & "{count, plural, one {for # uge siden} other {for # uger siden}}" & LF
     & "da.humanize.datetime.relative.week.future = "
     & "{count, plural, one {om # uge} other {om # uger}}" & LF
     & "da.humanize.datetime.relative.month.past = "
     & "{count, plural, one {for # m" & AA & "ned siden} "
     & "other {for # m" & AA & "neder siden}}" & LF
     & "da.humanize.datetime.relative.month.future = "
     & "{count, plural, one {om # m" & AA & "ned} "
     & "other {om # m" & AA & "neder}}" & LF
     & "da.humanize.datetime.relative.year.past = "
     & "{count, plural, one {for # " & AA & "r siden} "
     & "other {for # " & AA & "r siden}}" & LF
     & "da.humanize.datetime.relative.year.future = "
     & "{count, plural, one {om # " & AA & "r} other {om # " & AA & "r}}" & LF
     & "da.humanize.duration.unit.second = "
     & "{count, plural, one {# sekund} other {# sekunder}}" & LF
     & "da.humanize.duration.unit.minute = "
     & "{count, plural, one {# minut} other {# minutter}}" & LF
     & "da.humanize.duration.unit.hour = "
     & "{count, plural, one {# time} other {# timer}}" & LF
     & "da.humanize.duration.unit.day = "
     & "{count, plural, one {# dag} other {# dage}}" & LF
     & "da.humanize.bytes.byte = "
     & "{count, plural, one {# byte} other {# bytes}}" & LF
     & "da.humanize.bytes.kb = {value} kB" & LF
     & "da.humanize.bytes.mb = {value} MB" & LF
     & "da.humanize.bytes.gb = {value} GB" & LF
     & "da.humanize.bytes.tb = {value} TB" & LF
     & "da.humanize.bytes.kib = {value} KiB" & LF
     & "da.humanize.bytes.mib = {value} MiB" & LF
     & "da.humanize.bytes.gib = {value} GiB" & LF
     & "da.humanize.bytes.tib = {value} TiB" & LF;

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
         Text        => English & Danish,
         Result      => Result,
         Policy      => Policy);
   end Load_Defaults;

end Humanize.Catalogs;
