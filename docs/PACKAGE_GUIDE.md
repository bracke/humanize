# Humanize Package Guide

This guide is the short entry map for users choosing public packages. It keeps
the long feature matrix out of the critical path for first-time use.

## Common Tasks

* Use `Humanize.Contexts`, `Humanize.Catalogs`, and `Humanize.Locales` to load
  catalogs, create locale-aware contexts, and inspect shipped locale metadata.
* Use `Humanize.Bytes`, `Humanize.Durations`, `Humanize.Numbers`,
  `Humanize.Units`, `Humanize.Lists`, `Humanize.Frequencies`, and
  `Humanize.Rates` for common localized formatting.
* Use `Humanize.Parsing` as the compatibility parsing facade. Prefer public parser children
  such as `Humanize.Parsing.Numbers`,
  `Humanize.Parsing.Durations`, `Humanize.Parsing.Colors`, and
  `Humanize.Parsing.Date_Times` for new focused imports; private children such
  as `Humanize.Parsing.Bytes` are not caller APIs.
* Use the focused `Humanize.Strings.*` child packages when the parent string
  facade feels too broad.
* Use the focused `Humanize.Colors.*` child packages to import only CSS,
  contrast, model, name, or palette concerns.
* Use `Humanize.Cross_Domain` for deterministic labels that cross package
  boundaries, such as progress, product codes, checksums, validation
  constraints, terminal layouts, and network diagnostics.

## Stability Classes

`docs/PUBLIC_API_CLASSES.toml` is the generated-maintained stability map. It
defines the allowed classes and records one `unit_class` row for each public
package in `docs/PUBLIC_API.toml`:

* `primary-facade` packages are the default user-facing imports.
* `specialized-child-facade` packages are stable focused imports for large
  feature families.
* `support-type-facade` packages expose shared result, status, style, bounded
  text, and metadata types.
* `internal` packages are implementation, generated-data, support, or tooling
  packages and must remain outside `Library_Interface`.

## Examples

The `examples/` directory has one broad demo and focused demos for parsing,
bounded output, colors, cross-domain labels, product/details labels, and
public child-package imports. The staged public API consumer under
`tests/public_api_consumer/` is the compatibility smoke test for downstream
code.
