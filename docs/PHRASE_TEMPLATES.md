# Phrase templates

Humanize's phrase formatters (pagination, counts, durations, domain phrases)
write their English wording in code. Every other locale renders the phrase
through a catalog key, `humanize.phrase.<name>`, when the locale's catalog has
one. Without a translation the English wording stands.

A translation is an ICU MessageFormat entry, `<locale>.humanize.phrase.<name> =
...`, in the locale's phrase catalog fragment. The arguments are the ones listed
here.

- **Numbers** arrive as plain ASCII digits. Write `{total, number}` for the
  locale's own digits and grouping, or `{total}` for the digits as given.
  Choose a plural form with `{total, plural, one {...} other {...}}`.
- **`one` / `other`** are the caller's singular and plural noun, already in the
  caller's language. Choose between them by the locale's plural rules on the
  number the phrase counts: `{total, plural, one {{one}} other {{other}}}`.
  Languages with more forms (few, many) still have only these two nouns.
- **Text arguments** (`first`, `severity`, ...) are inserted as given, or
  selected on with `{severity, select, ...}`.

The English column is what the formatter writes in English, as a template.

## Lists

| Key | Arguments | English |
|---|---|---|
| `all_count` | total, one, other | `all {total} {total, plural, one {{one}} other {{other}}}` |
| `filtered_count.none` | matching, total, one, other | `no {other} match` |
| `filtered_count.all` | matching, total, one, other | `all {total} {total, plural, one {{one}} other {{other}}} match` |
| `filtered_count.some` | matching, total, one, other | `{matching} of {total} {total, plural, one {{one}} other {{other}}} match` |
| `more_count` | visible, remaining | `{visible} shown, +{remaining} more` |
| `others_count` | first, remaining | `{first} and {remaining, plural, one {1 other} other {{remaining} others}}` |
| `page_count` | page, total | `page {page} of {total}` |
| `page_navigation.only` | | `only page` |
| `page_navigation.first` | | `first page, next available` |
| `page_navigation.last` | | `last page, previous available` |
| `page_navigation.middle` | | `previous and next available` |
| `page_size` | size, one, other | `{size} {size, plural, one {{one}} other {{other}}} per page` |
| `pagination_range` | first, last, total, one, other | `{first}-{last} of {total} {total, plural, one {{one}} other {{other}}}` |
| `position_count` | position, total | `{position} of {total}` |
| `selection_count` | selected, total, one, other | `{selected} of {total} {total, plural, one {{one}} other {{other}}} selected` |
| `showing_count` | showing, total, one, other | `showing {showing} of {total} {total, plural, one {{one}} other {{other}}}` |
| `validation_count` | count, severity (error, warning, info) | `{count, plural, =0 {no {severity, select, error {errors} warning {warnings} other {notices}}} one {1 {severity, select, error {error} warning {warning} other {notice}}} other {{count} {severity, select, error {errors} warning {warnings} other {notices}}}}` |
| `collection.empty` | visible, total, hidden, one, other | `no {other}` |
| `collection.none_shown` | visible, total, hidden, one, other | `no {total, plural, one {{one}} other {{other}}} shown` |
| `collection.showing_hidden` | visible, total, hidden, one, other | `showing {visible} of {total} {total, plural, one {{one}} other {{other}}}, {hidden} hidden` |
| `collection.showing` | visible, total, hidden, one, other | `showing {visible} of {total} {total, plural, one {{one}} other {{other}}}` |
| `collection.shown_hidden` | visible, total, hidden, one, other | `{visible} {visible, plural, one {{one}} other {{other}}} shown, {hidden} hidden` |
| `collection.shown` | visible, total, hidden, one, other | `{visible} {visible, plural, one {{one}} other {{other}}} shown` |
| `collection.visible_out_of` | visible, total, hidden, one, other | `{visible} {visible, plural, one {{one}} other {{other}}} visible out of {total} {total, plural, one {{one}} other {{other}}}` |
