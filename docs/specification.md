# Humanize v0.1 Specification — Ada 2022 Alire Library Crate

## 1. Purpose

`humanize` is an Ada 2022 Alire library crate for converting machine-oriented values into human-readable localized text.

Humanize v0.1 supports:

* relative datetime humanization;
* simple duration humanization;
* byte-size humanization;
* English and Danish catalog fragments;
* convenience result APIs;
* bounded caller-owned output APIs;
* rendering through the existing `i18n` runtime.

Humanize does not implement its own localization runtime.

The dependency direction is:

```text
Humanize → I18N
```

`i18n` must not know about `humanize`.

## 2. Crate and Namespace

Alire crate name:

```toml
name = "humanize"
```

Root Ada namespace:

```ada
Humanize
```

Public packages for v0.1:

```text
Humanize
Humanize.Status
Humanize.Messages
Humanize.Contexts
Humanize.Catalogs
Humanize.Datetimes
Humanize.Durations
Humanize.Bytes
```

Required internal/private packages:

```text
Humanize.Selections
Humanize.I18N_Rendering
Humanize.Datetime_Classification
Humanize.Duration_Classification
Humanize.Byte_Classification
```

Deferred public packages:

```text
Humanize.Numbers
Humanize.Units
```

## 3. Architectural Boundary

Humanize owns:

* value normalization;
* rule selection;
* threshold policy;
* byte-unit policy;
* duration decomposition policy;
* semantic message-key selection;
* construction of render arguments;
* bounded API behavior;
* Humanize catalog fragments.

`i18n` owns:

* locale identifiers;
* catalog loading;
* catalog shard composition;
* message lookup;
* locale fallback;
* ICU-subset parsing/compilation/rendering;
* plural/select/selectordinal mechanics;
* argument storage;
* render statuses;
* diagnostics.

Humanize shall only import stable public `i18n` packages:

```ada
with I18N;
with I18N.Runtime;
with I18N.Result;
with I18N.Arguments;
with I18N.Locales;
with I18N.Plurals;
```

Humanize shall not import private/internal `i18n` packages such as parser, compiler, AST, cache, renderer, buffer, validation, or compatibility packages.

## 4. Text Encoding

Humanize v0.1 returns UTF-8-compatible Ada `String` text, matching the current public `i18n` result model.

No `Wide_Wide_String` public API is part of v0.1.

## 5. Output API Policy

Every public formatter in v0.1 provides two output forms:

1. Convenience API returning `Humanize.Status.Text_Result`.
2. Bounded API writing into a caller-owned `String`.

Bounded APIs use:

```ada
Target  : in out String;
Written : out Natural;
Status  : out Humanize.Status.Status_Code;
```

Bounded API rules:

* `Target` should be a 1-based buffer, for example `String (1 .. 256)`.
* If `Target'First /= 1`, the operation returns `Invalid_Options`, `Written = 0`.
* On `Ok`, `Written` is the number of characters written.
* On `Ok`, the rendered text is `Target (1 .. Written)`.
* On `Buffer_Overflow`, `Written` is the number of prefix characters copied.
* On `Buffer_Overflow`, callers must treat the output as incomplete.
* On any non-overflow failure, `Written = 0`.
* Humanize classification must not allocate heap memory.
* Rendering allocation behavior follows the public `i18n` API used by the rendering adapter.

## 6. Public Ada Package Specifications

### 6.1 `humanize.ads`

```ada
--  Root namespace for the Humanize Ada 2022 library.
--
--  Humanize classifies machine values into semantic localization keys and
--  renders them through the public I18N runtime. Humanize does not own locale
--  fallback, message parsing, plural rules, or catalog rendering.
package Humanize is
   pragma Preelaborate;
end Humanize;
```

### 6.2 `humanize-messages.ads`

```ada
package Humanize.Messages is
   pragma Preelaborate;

   --  Stable semantic message identifiers used by Humanize classifiers.
   --
   --  The enum gives internal type safety. Key returns the stable public
   --  catalog key string rendered through I18N.
   type Message_Id is
     (No_Message,

      Datetime_Now,
      Datetime_Day_Previous,
      Datetime_Day_Current,
      Datetime_Day_Next,

      Datetime_Relative_Second_Past,
      Datetime_Relative_Second_Future,
      Datetime_Relative_Minute_Past,
      Datetime_Relative_Minute_Future,
      Datetime_Relative_Hour_Past,
      Datetime_Relative_Hour_Future,
      Datetime_Relative_Day_Past,
      Datetime_Relative_Day_Future,
      Datetime_Relative_Week_Past,
      Datetime_Relative_Week_Future,
      Datetime_Relative_Month_Past,
      Datetime_Relative_Month_Future,
      Datetime_Relative_Year_Past,
      Datetime_Relative_Year_Future,

      Duration_Unit_Second,
      Duration_Unit_Minute,
      Duration_Unit_Hour,
      Duration_Unit_Day,

      Bytes_Byte,
      Bytes_KB,
      Bytes_MB,
      Bytes_GB,
      Bytes_TB,
      Bytes_KiB,
      Bytes_MiB,
      Bytes_GiB,
      Bytes_TiB);

   --  Return the stable catalog key for Id.
   --
   --  No_Message returns the empty string.
   function Key
     (Id : Message_Id)
      return String;

end Humanize.Messages;
```

Required key mapping:

```text
No_Message                             -> ""

Datetime_Now                           -> humanize.datetime.now
Datetime_Day_Previous                  -> humanize.datetime.day.previous
Datetime_Day_Current                   -> humanize.datetime.day.current
Datetime_Day_Next                      -> humanize.datetime.day.next

Datetime_Relative_Second_Past          -> humanize.datetime.relative.second.past
Datetime_Relative_Second_Future        -> humanize.datetime.relative.second.future
Datetime_Relative_Minute_Past          -> humanize.datetime.relative.minute.past
Datetime_Relative_Minute_Future        -> humanize.datetime.relative.minute.future
Datetime_Relative_Hour_Past            -> humanize.datetime.relative.hour.past
Datetime_Relative_Hour_Future          -> humanize.datetime.relative.hour.future
Datetime_Relative_Day_Past             -> humanize.datetime.relative.day.past
Datetime_Relative_Day_Future           -> humanize.datetime.relative.day.future
Datetime_Relative_Week_Past            -> humanize.datetime.relative.week.past
Datetime_Relative_Week_Future          -> humanize.datetime.relative.week.future
Datetime_Relative_Month_Past           -> humanize.datetime.relative.month.past
Datetime_Relative_Month_Future         -> humanize.datetime.relative.month.future
Datetime_Relative_Year_Past            -> humanize.datetime.relative.year.past
Datetime_Relative_Year_Future          -> humanize.datetime.relative.year.future

Duration_Unit_Second                   -> humanize.duration.unit.second
Duration_Unit_Minute                   -> humanize.duration.unit.minute
Duration_Unit_Hour                     -> humanize.duration.unit.hour
Duration_Unit_Day                      -> humanize.duration.unit.day

Bytes_Byte                             -> humanize.bytes.byte
Bytes_KB                               -> humanize.bytes.kb
Bytes_MB                               -> humanize.bytes.mb
Bytes_GB                               -> humanize.bytes.gb
Bytes_TB                               -> humanize.bytes.tb
Bytes_KiB                              -> humanize.bytes.kib
Bytes_MiB                              -> humanize.bytes.mib
Bytes_GiB                              -> humanize.bytes.gib
Bytes_TiB                              -> humanize.bytes.tib
```

### 6.3 `humanize-status.ads`

```ada
with Ada.Strings.Unbounded;
with Humanize.Messages;

package Humanize.Status is

   type Status_Code is
     (Ok,
      Invalid_Value,
      Invalid_Options,
      Missing_Message,
      Missing_Argument,
      Invalid_Argument,
      Render_Error,
      Runtime_Error,
      Buffer_Overflow,
      Internal_Error);

   type Text_Result is record
      Status : Status_Code := Internal_Error;
      Text   : Ada.Strings.Unbounded.Unbounded_String;
      Key    : Humanize.Messages.Message_Id := Humanize.Messages.No_Message;
   end record;

   function Is_Ok
     (Item : Text_Result)
      return Boolean
   is (Item.Status = Ok);

   function Status_Image
     (Status : Status_Code)
      return String;

end Humanize.Status;
```

Status mapping from `i18n`:

```text
I18N.Result.Success          -> Humanize.Status.Ok
I18N.Result.Missing_Key      -> Humanize.Status.Missing_Message
I18N.Result.Missing_Argument -> Humanize.Status.Missing_Argument
I18N.Result.Invalid_Argument -> Humanize.Status.Invalid_Argument
I18N.Result.Formatting_Error -> Humanize.Status.Render_Error
I18N.Result.Execution_Error  -> Humanize.Status.Runtime_Error
I18N.Result.Buffer_Overflow  -> Humanize.Status.Buffer_Overflow
I18N.Result.Internal_Error   -> Humanize.Status.Internal_Error
```

### 6.4 `humanize-contexts.ads`

```ada
with Ada.Strings.Unbounded;
with I18N.Locales;
with I18N.Runtime;

package Humanize.Contexts is

   --  Non-owning reference to a caller-owned I18N runtime.
   --
   --  The referenced runtime must outlive every Humanize context that uses it.
   type Runtime_Access is not null access constant I18N.Runtime.Instance;

   type Context is private;

   function Create
     (Runtime : Runtime_Access;
      Locale  : I18N.Locales.Locale_Id)
      return Context;

   function Locale
     (Item : Context)
      return I18N.Locales.Locale_Id;

   function Runtime
     (Item : Context)
      return Runtime_Access;

private

   type Context is record
      Runtime_Ref : Runtime_Access;
      Locale_Text : Ada.Strings.Unbounded.Unbounded_String;
   end record;

end Humanize.Contexts;
```

Context ownership rules:

```text
Application owns I18N.Runtime.Instance.
Humanize.Contexts.Context is non-owning.
The I18N runtime must outlive the Humanize context.
Humanize does not initialize, finalize, or mutate the runtime during formatting.
Humanize catalog loading is explicit through Humanize.Catalogs.
```

Example use:

```ada
Runtime : aliased I18N.Runtime.Runtime;

Context : Humanize.Contexts.Context :=
  Humanize.Contexts.Create
    (Runtime => Runtime'Access,
     Locale  => "da-DK");
```

### 6.5 `humanize-catalogs.ads`

```ada
with I18N.Runtime;

package Humanize.Catalogs is

   --  Load the built-in Humanize v0.1 catalog fragments into Runtime.
   --
   --  The default catalog set contains English and Danish entries for every
   --  required v0.1 Humanize key.
   --
   --  Loading is delegated to the public I18N.Runtime.Load_Text operation.
   --  Duplicate behavior follows the supplied I18N duplicate policy.
   procedure Load_Defaults
     (Runtime : in out I18N.Runtime.Instance;
      Result  : out I18N.Runtime.Load_Result;
      Policy  : I18N.Runtime.Duplicate_Policy :=
        I18N.Runtime.Reject_Duplicates);

end Humanize.Catalogs;
```

Catalog loading policy:

```text
Default duplicate policy: Reject_Duplicates.
Applications may explicitly use Keep_First or Override_Previous.
Humanize never silently overrides application catalog keys.
Humanize catalog fragments only define humanize.* keys.
```

### 6.6 `humanize-datetimes.ads`

```ada
with Ada.Calendar;
with Humanize.Contexts;
with Humanize.Status;

package Humanize.Datetimes is

   type Relative_Style is
     (Auto,
      Elapsed,
      Calendar);

   type Datetime_Options is record
      Style                 : Relative_Style := Auto;
      Now_Threshold_Seconds : Natural := 45;
      Use_Calendar_Words    : Boolean := True;
      Prefer_Weeks          : Boolean := True;
      Prefer_Months         : Boolean := True;
   end record;

   Default_Datetime_Options : constant Datetime_Options :=
     (Style                 => Auto,
      Now_Threshold_Seconds => 45,
      Use_Calendar_Words    => True,
      Prefer_Weeks          => True,
      Prefer_Months         => True);

   function Relative
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Options   : Datetime_Options := Default_Datetime_Options)
      return Humanize.Status.Text_Result;

   procedure Relative_Into
     (Context   : Humanize.Contexts.Context;
      Value     : Ada.Calendar.Time;
      Reference : Ada.Calendar.Time;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code;
      Options   : Datetime_Options := Default_Datetime_Options);

end Humanize.Datetimes;
```

Datetime v0.1 does not provide an implicit-clock overload. The caller supplies `Reference` explicitly.

### 6.7 `humanize-durations.ads`

```ada
with Humanize.Contexts;
with Humanize.Status;

package Humanize.Durations is

   type Duration_Seconds is new Long_Long_Integer;

   type Duration_Unit is
     (Second,
      Minute,
      Hour,
      Day);

   type Duration_Options is record
      Largest_Unit  : Duration_Unit := Day;
      Smallest_Unit : Duration_Unit := Second;
   end record;

   Default_Duration_Options : constant Duration_Options :=
     (Largest_Unit  => Day,
      Smallest_Unit => Second);

   function Format
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Options : Duration_Options := Default_Duration_Options)
      return Humanize.Status.Text_Result;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Seconds : Duration_Seconds;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Duration_Options := Default_Duration_Options);

end Humanize.Durations;
```

Duration v0.1 renders a single largest useful unit only. Localized list joining is deferred.

### 6.8 `humanize-bytes.ads`

```ada
with Humanize.Contexts;
with Humanize.Status;

package Humanize.Bytes is

   type Byte_Count is mod 2 ** 64;

   type Byte_Unit_System is
     (Binary,
      Decimal);

   subtype Fraction_Digit_Count is Natural range 0 .. 3;

   type Byte_Options is record
      Unit_System             : Byte_Unit_System := Binary;
      Maximum_Fraction_Digits : Fraction_Digit_Count := 1;
      Suppress_Trailing_Zero  : Boolean := True;
   end record;

   Default_Byte_Options : constant Byte_Options :=
     (Unit_System             => Binary,
      Maximum_Fraction_Digits => 1,
      Suppress_Trailing_Zero  => True);

   function Format
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Options : Byte_Options := Default_Byte_Options)
      return Humanize.Status.Text_Result;

   procedure Format_Into
     (Context : Humanize.Contexts.Context;
      Bytes   : Byte_Count;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Byte_Options := Default_Byte_Options);

end Humanize.Bytes;
```

## 7. Required Internal Package Specifications

### 7.1 `humanize-selections.ads`

```ada
private with Ada.Strings.Unbounded;
with Humanize.Messages;

private package Humanize.Selections is

   subtype Count_Value is Long_Long_Integer range 0 .. Long_Long_Integer'Last;

   type Argument_Kind is
     (No_Arguments,
      Count_Argument,
      Value_Argument);

   type Message_Selection is record
      Key       : Humanize.Messages.Message_Id := Humanize.Messages.No_Message;
      Arguments : Argument_Kind := No_Arguments;
      Count     : Count_Value := 0;
      Value     : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   function No_Arg
     (Key : Humanize.Messages.Message_Id)
      return Message_Selection;

   function Count
     (Key   : Humanize.Messages.Message_Id;
      Value : Count_Value)
      return Message_Selection;

   function Text_Value
     (Key   : Humanize.Messages.Message_Id;
      Value : String)
      return Message_Selection;

end Humanize.Selections;
```

Classifiers return `Message_Selection`, never localized text.

### 7.2 `humanize-i18n_rendering.ads`

```ada
with Humanize.Contexts;
with Humanize.Messages;
with Humanize.Selections;
with Humanize.Status;

private package Humanize.I18N_Rendering is

   function Available
     (Context : Humanize.Contexts.Context;
      Key     : Humanize.Messages.Message_Id)
      return Boolean;

   function Render
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection)
      return Humanize.Status.Text_Result;

   procedure Render_Into
     (Context   : Humanize.Contexts.Context;
      Selection : Humanize.Selections.Message_Selection;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);

end Humanize.I18N_Rendering;
```

`Humanize.I18N_Rendering` is the only package that calls:

```ada
I18N.Runtime.Render
I18N.Runtime.Render_Into
I18N.Runtime.Resolve
I18N.Arguments.Set_Natural
I18N.Arguments.Set_Integer
I18N.Arguments.Set
I18N.Result.Output_Text
```

Domain packages must not call `I18N.Runtime` directly.

## 8. Datetime Semantics

### 8.1 Time Model

Humanize v0.1 uses `Ada.Calendar.Time`.

Elapsed differences are computed from:

```ada
Value - Reference
```

Calendar-day words such as “yesterday”, “today”, and “tomorrow” are computed by splitting `Ada.Calendar.Time` using `Ada.Calendar.Split`, extracting year/month/day, and comparing proleptic Gregorian day ordinals derived from those split dates.

Humanize v0.1 does not own a time zone database.

A future version may add explicit civil-date/civil-datetime APIs.

### 8.2 Direction

```text
Value < Reference  -> past
Value > Reference  -> future
near Reference     -> now, if within threshold
```

### 8.3 Elapsed Seconds

`Elapsed_Seconds` is the absolute elapsed duration rounded down toward zero to whole seconds.

### 8.4 Calendar Day Delta

```text
Day_Delta = Date_Ordinal(Value_Date) - Date_Ordinal(Reference_Date)
```

Examples:

```text
Day_Delta = -1 -> previous calendar day
Day_Delta =  0 -> same calendar day
Day_Delta =  1 -> next calendar day
```

### 8.5 Relative Style

`Elapsed`:

```text
Never use yesterday/today/tomorrow.
Always use elapsed units after now-threshold handling.
```

`Calendar`:

```text
Use yesterday/today/tomorrow for Day_Delta -1, 0, or 1 when calendar words are enabled.
Otherwise use elapsed units.
```

`Auto`:

```text
Use yesterday/tomorrow for Day_Delta -1 or 1 when calendar words are enabled.
Do not use today for same-day non-now values.
Same-day non-now values use elapsed units.
```

This gives practical timestamp behavior:

```text
4 hours ago -> "4 hours ago"
```

while still giving calendar-sensitive crossing-midnight behavior:

```text
Reference: 2026-03-21 00:10
Value:     2026-03-20 23:55
Auto:      "yesterday"
Elapsed:   "15 minutes ago"
```

### 8.6 Datetime Rule Order

Given `Options`, `Value`, and `Reference`:

```text
1. If Target buffer lower bound is invalid in bounded API:
      Invalid_Options

2. If Elapsed_Seconds <= Now_Threshold_Seconds:
      humanize.datetime.now

3. If Use_Calendar_Words and Style = Calendar:
      Day_Delta = -1 -> humanize.datetime.day.previous
      Day_Delta =  0 -> humanize.datetime.day.current
      Day_Delta =  1 -> humanize.datetime.day.next

4. If Use_Calendar_Words and Style = Auto:
      Day_Delta = -1 -> humanize.datetime.day.previous
      Day_Delta =  1 -> humanize.datetime.day.next

5. Otherwise choose elapsed unit:
      < 60 seconds      -> seconds
      < 3600 seconds    -> minutes
      < 86400 seconds   -> hours
      < 7 days          -> days
      < 30 days         -> weeks, if Prefer_Weeks
      < 365 days        -> months, if Prefer_Months
      otherwise         -> years

6. Direction chooses .past or .future key.

7. Count is floor-toward-zero and never less than 1 for a nonzero elapsed value.
```

### 8.7 Elapsed Unit Counts

```text
seconds = Elapsed_Seconds
minutes = Elapsed_Seconds / 60
hours   = Elapsed_Seconds / 3600
days    = Elapsed_Seconds / 86400
weeks   = days / 7
months  = days / 30
years   = days / 365
```

All divisions are integer floor divisions.

## 9. Datetime Semantic Fallback

Special calendar keys have semantic fallback.

```text
humanize.datetime.day.previous
  fallback -> humanize.datetime.relative.day.past, count = 1

humanize.datetime.day.current
  fallback -> humanize.datetime.now

humanize.datetime.day.next
  fallback -> humanize.datetime.relative.day.future, count = 1
```

Fallback is performed by Humanize by checking key availability through `Humanize.I18N_Rendering.Available`.

Generic relative keys do not have further semantic fallback. If missing, return `Missing_Message`.

## 10. Duration Semantics

Duration v0.1 accepts `Duration_Seconds`.

Rules:

```text
Seconds < 0:
  Invalid_Value

Largest_Unit < Smallest_Unit:
  Invalid_Options

Seconds = 0:
  render Smallest_Unit with count = 0

Seconds > 0:
  choose the largest unit between Smallest_Unit and Largest_Unit whose whole count is at least 1

If no unit count is at least 1:
  render Smallest_Unit with count = 0
```

Unit sizes:

```text
Second = 1
Minute = 60
Hour   = 3600
Day    = 86400
```

Examples with default options:

```text
0      -> 0 seconds
1      -> 1 second
59     -> 59 seconds
60     -> 1 minute
90     -> 1 minute
3600   -> 1 hour
3661   -> 1 hour
86400  -> 1 day
```

Multi-unit rendering such as `1 hour, 1 minute` is deferred.

## 11. Byte Formatting Semantics

### 11.1 Unit Systems

Binary:

```text
1 KiB = 1024
1 MiB = 1024 ** 2
1 GiB = 1024 ** 3
1 TiB = 1024 ** 4
```

Decimal:

```text
1 kB = 1000
1 MB = 1000 ** 2
1 GB = 1000 ** 3
1 TB = 1000 ** 4
```

### 11.2 Unit Selection

If `Bytes < base`, use `humanize.bytes.byte` with `count`.

Otherwise choose the largest unit whose threshold is less than or equal to `Bytes`.

Binary chooses among:

```text
KiB, MiB, GiB, TiB
```

Decimal chooses among:

```text
kB, MB, GB, TB
```

### 11.3 Numeric Formatting

Humanize v0.1 formats byte-size numeric values internally as locale-neutral ASCII argument text.

Rules:

```text
Decimal separator: "."
Grouping: none
Default maximum fractional digits: 1
Rounding: nearest, halves away from zero
Trailing .0: suppressed when Suppress_Trailing_Zero = True
```

Examples with default options:

```text
1 byte
2 bytes
1024 binary  -> 1 KiB
1536 binary  -> 1.5 KiB
1000 decimal -> 1 kB
1500 decimal -> 1.5 kB
```

Locale-aware number formatting is deferred to a later version.

## 12. Catalog Schema

Every v0.1 key has a fixed argument contract.

| Key                                        | Required args | Uses plural? |
| ------------------------------------------ | ------------: | -----------: |
| `humanize.datetime.now`                    |          none |           no |
| `humanize.datetime.day.previous`           |          none |           no |
| `humanize.datetime.day.current`            |          none |           no |
| `humanize.datetime.day.next`               |          none |           no |
| `humanize.datetime.relative.second.past`   |       `count` |          yes |
| `humanize.datetime.relative.second.future` |       `count` |          yes |
| `humanize.datetime.relative.minute.past`   |       `count` |          yes |
| `humanize.datetime.relative.minute.future` |       `count` |          yes |
| `humanize.datetime.relative.hour.past`     |       `count` |          yes |
| `humanize.datetime.relative.hour.future`   |       `count` |          yes |
| `humanize.datetime.relative.day.past`      |       `count` |          yes |
| `humanize.datetime.relative.day.future`    |       `count` |          yes |
| `humanize.datetime.relative.week.past`     |       `count` |          yes |
| `humanize.datetime.relative.week.future`   |       `count` |          yes |
| `humanize.datetime.relative.month.past`    |       `count` |          yes |
| `humanize.datetime.relative.month.future`  |       `count` |          yes |
| `humanize.datetime.relative.year.past`     |       `count` |          yes |
| `humanize.datetime.relative.year.future`   |       `count` |          yes |
| `humanize.duration.unit.second`            |       `count` |          yes |
| `humanize.duration.unit.minute`            |       `count` |          yes |
| `humanize.duration.unit.hour`              |       `count` |          yes |
| `humanize.duration.unit.day`               |       `count` |          yes |
| `humanize.bytes.byte`                      |       `count` |          yes |
| `humanize.bytes.kb`                        |       `value` |           no |
| `humanize.bytes.mb`                        |       `value` |           no |
| `humanize.bytes.gb`                        |       `value` |           no |
| `humanize.bytes.tb`                        |       `value` |           no |
| `humanize.bytes.kib`                       |       `value` |           no |
| `humanize.bytes.mib`                       |       `value` |           no |
| `humanize.bytes.gib`                       |       `value` |           no |
| `humanize.bytes.tib`                       |       `value` |           no |

`count` is serialized with `I18N.Arguments.Set_Natural` or `Set_Integer`.

`value` is serialized with `I18N.Arguments.Set`.

## 13. Required English Catalog Fragment

```text
en.humanize.datetime.now = "now"
en.humanize.datetime.day.previous = "yesterday"
en.humanize.datetime.day.current = "today"
en.humanize.datetime.day.next = "tomorrow"

en.humanize.datetime.relative.second.past = "{count, plural, one {# second ago} other {# seconds ago}}"
en.humanize.datetime.relative.second.future = "{count, plural, one {in # second} other {in # seconds}}"
en.humanize.datetime.relative.minute.past = "{count, plural, one {# minute ago} other {# minutes ago}}"
en.humanize.datetime.relative.minute.future = "{count, plural, one {in # minute} other {in # minutes}}"
en.humanize.datetime.relative.hour.past = "{count, plural, one {# hour ago} other {# hours ago}}"
en.humanize.datetime.relative.hour.future = "{count, plural, one {in # hour} other {in # hours}}"
en.humanize.datetime.relative.day.past = "{count, plural, one {# day ago} other {# days ago}}"
en.humanize.datetime.relative.day.future = "{count, plural, one {in # day} other {in # days}}"
en.humanize.datetime.relative.week.past = "{count, plural, one {# week ago} other {# weeks ago}}"
en.humanize.datetime.relative.week.future = "{count, plural, one {in # week} other {in # weeks}}"
en.humanize.datetime.relative.month.past = "{count, plural, one {# month ago} other {# months ago}}"
en.humanize.datetime.relative.month.future = "{count, plural, one {in # month} other {in # months}}"
en.humanize.datetime.relative.year.past = "{count, plural, one {# year ago} other {# years ago}}"
en.humanize.datetime.relative.year.future = "{count, plural, one {in # year} other {in # years}}"

en.humanize.duration.unit.second = "{count, plural, one {# second} other {# seconds}}"
en.humanize.duration.unit.minute = "{count, plural, one {# minute} other {# minutes}}"
en.humanize.duration.unit.hour = "{count, plural, one {# hour} other {# hours}}"
en.humanize.duration.unit.day = "{count, plural, one {# day} other {# days}}"

en.humanize.bytes.byte = "{count, plural, one {# byte} other {# bytes}}"
en.humanize.bytes.kb = "{value} kB"
en.humanize.bytes.mb = "{value} MB"
en.humanize.bytes.gb = "{value} GB"
en.humanize.bytes.tb = "{value} TB"
en.humanize.bytes.kib = "{value} KiB"
en.humanize.bytes.mib = "{value} MiB"
en.humanize.bytes.gib = "{value} GiB"
en.humanize.bytes.tib = "{value} TiB"
```

## 14. Required Danish Catalog Fragment

```text
da.humanize.datetime.now = "nu"
da.humanize.datetime.day.previous = "i går"
da.humanize.datetime.day.current = "i dag"
da.humanize.datetime.day.next = "i morgen"

da.humanize.datetime.relative.second.past = "{count, plural, one {for # sekund siden} other {for # sekunder siden}}"
da.humanize.datetime.relative.second.future = "{count, plural, one {om # sekund} other {om # sekunder}}"
da.humanize.datetime.relative.minute.past = "{count, plural, one {for # minut siden} other {for # minutter siden}}"
da.humanize.datetime.relative.minute.future = "{count, plural, one {om # minut} other {om # minutter}}"
da.humanize.datetime.relative.hour.past = "{count, plural, one {for # time siden} other {for # timer siden}}"
da.humanize.datetime.relative.hour.future = "{count, plural, one {om # time} other {om # timer}}"
da.humanize.datetime.relative.day.past = "{count, plural, one {for # dag siden} other {for # dage siden}}"
da.humanize.datetime.relative.day.future = "{count, plural, one {om # dag} other {om # dage}}"
da.humanize.datetime.relative.week.past = "{count, plural, one {for # uge siden} other {for # uger siden}}"
da.humanize.datetime.relative.week.future = "{count, plural, one {om # uge} other {om # uger}}"
da.humanize.datetime.relative.month.past = "{count, plural, one {for # måned siden} other {for # måneder siden}}"
da.humanize.datetime.relative.month.future = "{count, plural, one {om # måned} other {om # måneder}}"
da.humanize.datetime.relative.year.past = "{count, plural, one {for # år siden} other {for # år siden}}"
da.humanize.datetime.relative.year.future = "{count, plural, one {om # år} other {om # år}}"

da.humanize.duration.unit.second = "{count, plural, one {# sekund} other {# sekunder}}"
da.humanize.duration.unit.minute = "{count, plural, one {# minut} other {# minutter}}"
da.humanize.duration.unit.hour = "{count, plural, one {# time} other {# timer}}"
da.humanize.duration.unit.day = "{count, plural, one {# dag} other {# dage}}"

da.humanize.bytes.byte = "{count, plural, one {# byte} other {# bytes}}"
da.humanize.bytes.kb = "{value} kB"
da.humanize.bytes.mb = "{value} MB"
da.humanize.bytes.gb = "{value} GB"
da.humanize.bytes.tb = "{value} TB"
da.humanize.bytes.kib = "{value} KiB"
da.humanize.bytes.mib = "{value} MiB"
da.humanize.bytes.gib = "{value} GiB"
da.humanize.bytes.tib = "{value} TiB"
```

Humanize v0.1 requires correct `one`/`other` plural behavior for English and Danish through `i18n`.

## 15. Performance Requirements

Humanize v0.1 guarantees:

```text
Datetime classification: bounded fixed rule checks
Duration classification: bounded fixed rule checks
Byte classification: bounded fixed rule checks
Classification heap allocation: none
Localized rendering: delegated to I18N
Convenience result API: may allocate for owned text result
Bounded API: caller-visible output path uses caller-owned buffer
```

Humanize shall not parse catalog messages.

Humanize shall not inspect private `i18n` catalog structures.

## 16. Threading and Reentrancy

Humanize formatting operations are reentrant if:

```text
The supplied I18N runtime is initialized and not being mutated concurrently.
No task calls I18N.Runtime.Load_*, Initialize, or Finalize concurrently on the same runtime.
Shared diagnostics callbacks, if any, are externally thread-safe.
```

Humanize itself shall not maintain mutable global formatting state.

Built-in catalog text constants are read-only.

## 17. Invariants

```text
HUM-INV-001:
  Classifiers never return localized text.

HUM-INV-002:
  Domain packages do not import I18N.Runtime directly.

HUM-INV-003:
  All I18N status mapping happens in Humanize.I18N_Rendering.

HUM-INV-004:
  Every public Message_Id except No_Message maps to exactly one catalog key.

HUM-INV-005:
  Every v0.1 catalog key has English and Danish entries.

HUM-INV-006:
  Every v0.1 catalog key has a documented argument schema.

HUM-INV-007:
  Datetime APIs with explicit Reference are deterministic.

HUM-INV-008:
  Binary and decimal byte units are never mixed.

HUM-INV-009:
  Humanize does not own or mutate I18N runtime lifetime.

HUM-INV-010:
  Bounded APIs never report Ok unless the complete output fits in Target.
```

## 18. Test Requirements

AUnit tests shall cover:

### Datetime

```text
now threshold
yesterday in Auto
tomorrow in Auto
today in Calendar style
same-day hours ago in Auto
Elapsed style disables yesterday/tomorrow
seconds ago
minutes ago
hours ago
days ago
weeks ago
months ago
years ago
future seconds/minutes/hours/days
calendar semantic fallback
explicit Reference determinism
```

### Duration

```text
negative duration -> Invalid_Value
0 seconds
1 second
2 seconds
59 seconds
60 seconds
90 seconds
1 hour
1 day
Smallest_Unit / Largest_Unit invalid combination
```

### Bytes

```text
0 bytes
1 byte
2 bytes
1023 binary -> bytes
1024 binary -> 1 KiB
1536 binary -> 1.5 KiB
999 decimal -> bytes
1000 decimal -> 1 kB
1500 decimal -> 1.5 kB
binary/decimal distinction
fraction suppression
fraction digit limit
```

### I18N Integration

```text
English output through real I18N.Runtime
Danish output through real I18N.Runtime
missing key -> Missing_Message
missing argument -> Missing_Argument
invalid argument -> Invalid_Argument
runtime error -> Runtime_Error
count argument uses strict decimal string
value argument uses deterministic byte formatter text
```

### Bounded APIs

```text
exact-fit buffer
oversized buffer
one-character-too-small buffer
zero-length buffer
invalid non-1-based buffer
overflow status
Written value on success
Written value on overflow
Written = 0 on non-overflow failure
```

### Architecture

```text
domain packages do not with I18N.Runtime
no localized strings in classifiers
every Message_Id has catalog schema coverage
all v0.1 keys exist in en and da catalog fragments
```

## 19. Deferred Features

Deferred until v0.2+:

```text
Humanize.Numbers public API
ordinals
compact numbers
full locale-aware decimal formatting
multi-unit duration lists
localized list joining
explicit Civil_Date / Civil_Date_Time API
timezone database integration
full CLDR catalog import
custom runtime rule plugins
application-defined domain classifiers
```

## 20. Implementation Slices

### Slice 1 — Datetime Foundation

Implement:

```text
Humanize
Humanize.Messages
Humanize.Status
Humanize.Contexts
Humanize.Selections
Humanize.I18N_Rendering
Humanize.Catalogs
Humanize.Datetimes
Humanize.Datetime_Classification
English/Danish datetime catalog entries
AUnit datetime tests
AUnit bounded datetime tests
```

Acceptance:

```text
Relative datetime works through real I18N.Runtime.
No domain package imports I18N.Runtime.
Convenience and bounded APIs both work.
```

### Slice 2 — Duration

Implement:

```text
Humanize.Durations
Humanize.Duration_Classification
English/Danish duration catalog entries
AUnit duration tests
AUnit bounded duration tests
```

Acceptance:

```text
Single-largest-unit duration formatting works.
Negative durations return Invalid_Value.
Invalid unit options return Invalid_Options.
```

### Slice 3 — Bytes

Implement:

```text
Humanize.Bytes
Humanize.Byte_Classification
byte numeric formatter
English/Danish byte catalog entries
AUnit byte tests
AUnit bounded byte tests
```

Acceptance:

```text
Binary and decimal byte formatting work.
Byte values use deterministic ASCII numeric argument text.
Bounded byte rendering reports overflow correctly.
```

## 21. v0.1 Completion Criteria

Humanize v0.1 is complete when:

```text
The crate builds as a separate Ada 2022 Alire library crate.
The crate depends on i18n.
i18n does not depend on humanize.
All direct i18n rendering calls are isolated in Humanize.I18N_Rendering.
Relative datetime works in English and Danish.
Simple duration formatting works in English and Danish.
Binary and decimal byte formatting work.
Convenience and bounded APIs exist for every v0.1 formatter.
Missing messages and render failures map to Humanize statuses.
AUnit tests cover all public behavior.
No localized strings are embedded in rule-selection code.
Every invariant HUM-INV-001 through HUM-INV-010 is tested or covered by code review.
```

## 22. v0.2 Additions

Humanize v0.2 extends the v0.1 contract without changing it. New public surface:

* `Humanize.Numbers` — `Ordinal` (locale-aware ordinals via i18n
  selectordinal: English `21 -> 21st`; German/Danish `21 -> 21.`) and `Compact`
  (`1200 -> 1.2K`, with localized suffixes), each with convenience and bounded
  forms.
* `Humanize.Durations.Format_Components` / `Format_Components_Into` — multi-unit
  duration rendering (for example `1 hour, 30 minutes`). Components are joined
  with a `", "` separator.
* `Humanize.Datetimes.Relative_Civil` / `Relative_Civil_Into` — a civil
  date/time component API (`Civil_Date_Time`). Impossible civil dates return
  `Invalid_Value`. No time zone database is owned; components are interpreted in
  the local zone via `Ada.Calendar`.
* German (`de`) catalog fragment. Shipped locales: `en`, `da`, `de`.

The architectural boundary is unchanged: classifiers stay pure (HUM-INV-001),
domain packages (now including `Humanize.Numbers`) do not call `I18N.Runtime`
directly (HUM-INV-002), and all i18n rendering and status mapping stays in
`Humanize.I18N_Rendering` (HUM-INV-003).

Still out of scope (deferred beyond v0.2): a time zone database, runtime CLDR
data import, locale-aware decimal grouping, locale-specific list patterns, and
runtime rule plugins.

## 23. v0.3 Additions

* Locale-aware numeric value formatting (`Humanize.Number_Formatting`): the
  Humanize-formatted `{value}` arguments (byte sizes, compact numbers) now use
  the locale's decimal separator and digit grouping — `en` `1,023.5`, `de`/`da`
  `1.023,5`, `fr` `1 023,5`. Symbols are resolved by language subtag in a pure
  helper; count integers still render through i18n unchanged.
* French (`fr`) catalog fragment; shipped locales: `en`, `da`, `de`, `fr`.
* Multi-unit duration lists join the final component with the locale conjunction
  (`humanize.list.and`: "and"/"og"/"und"/"et").

Still out of scope: time zone database, runtime CLDR data import, full CLDR
list/number patterns (long-form compact, currency, percent), and runtime rule
plugins.

## 24. v0.4 Additions

* `Humanize.Units` — a new public domain package humanizing whole unit
  quantities (`Meter`, `Kilometer`, `Gram`, `Kilogram`, `Liter`) with plural
  forms. Like the other formatters it selects a key and renders through
  `Humanize.I18N_Rendering`; it never calls `I18N.Runtime` (HUM-INV-002).
  Fractional quantities are deferred because i18n plural selection is
  integer-only.
* Spanish (`es`) and Italian (`it`) catalog fragments. Shipped locales: `en`,
  `da`, `de`, `fr`, `es`, `it`.
* Locale-grouped counts: catalog count branches render `{value}` (a
  locale-grouped image of the count) while still selecting the plural/ordinal
  category from the raw `{count}`. `Humanize.I18N_Rendering` sets both arguments.
* Compact tier promotion: when rounding a compact value reaches 1000, the tier
  is promoted (`999_999` → `1M`, not `1000K`).
* Gendered ordinals: `Humanize.Numbers.Ordinal` takes an `Ordinal_Gender`
  (`Masculine`/`Feminine`); Romance locales carry a distinct feminine key
  (`humanize.number.ordinal.feminine`), others reuse the masculine form.

Still out of scope: time zone database, runtime CLDR import, fractional units,
long-form compact numbers, currency/percent/scientific formatting, and runtime
rule plugins.

## 25. v0.5 Additions

* Fractional plural agreement. i18n 1.1 adds an overloaded
  `I18N.Plurals.Cardinal` taking CLDR operands (i, v, f) and teaches the public
  render paths to accept decimal plural selectors. Humanize passes a decimal
  "count" (the ASCII value) alongside the localized "value" via a new
  `Decimal_Argument` selection, so fractional quantities agree in number
  (French "1,5 kilometre" singular; English "1.5 kilometers").
* `Humanize.Units` fractional overloads (`Format`/`Format_Into` taking a
  `Long_Float`), plus new metric units (centimeter, millimeter, milligram,
  milliliter).
* `Humanize.Numbers.Compact` `Style` parameter: Long renders the spelled-out
  scale word ("1.2 million") with plural agreement.
* `Humanize.Numbers.Percent` / `Percent_Into`.
* Portuguese (`pt`). Shipped locales: en, da, de, fr, es, it, pt.

Still out of scope: time zone database, runtime CLDR import, currency and
scientific-notation formatting, and runtime rule plugins.
