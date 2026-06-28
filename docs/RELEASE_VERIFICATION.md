# Release Verification Status

This document records what must be verified before tagging a Humanize release.
Documentation and metadata describe the intended public contract; the compiler
and the test suite remain the authority for Ada visibility, the `Humanize -> I18N`
boundary, and behavior.

## Verified GNAT/GPRbuild checks

Run these checks for every release candidate:

```sh
alr build
cd tests
alr build
./bin/tests
cd ..
cd check_humanize
alr build
./bin/check_humanize
cd ..
alr test
```

These checks establish that the library builds against `i18n`, the test project
builds, the AUnit suite runs successfully, and the `project_tools`-based release
guard (`check_humanize`) passes.

## Remaining publication checks

Before publishing or tagging a release, also run:

```sh
alr exec -- gprbuild -P examples/examples.gpr
alr exec -- gnatdoc -P humanize.gpr
```

`alr test` is part of the required release gate and runs the manifest-declared
test action. The release is not publication-ready if any required local
publication command fails.

## Dependency and boundary checks

Humanize depends on `i18n` and must keep the dependency one-way:

* the Alire manifest declares `i18n` as a dependency and pins it to `../i18n`
  for local development;
* `i18n` never depends on `humanize`;
* all direct calls into `I18N.Runtime`, `I18N.Arguments`, and
  `I18N.Result.Output_Text` are isolated in the private package
  `Humanize.I18N_Rendering` (HUM-INV-003);
* the domain packages `Humanize.Datetimes`, `Humanize.Durations`, and
  `Humanize.Bytes` do not import `I18N.Runtime` directly (HUM-INV-002).

The architecture test in `tests/src/humanize-tests-architecture.adb` enforces
the domain boundary and that every `Message_Id` resolves in both English and
Danish after `Humanize.Catalogs.Load_Defaults`.

## Catalog statement

Humanize ships built-in English and Danish catalog fragments as in-source string
constants and loads them through the public `I18N.Runtime.Load_Text` API with the
caller-selected duplicate policy (default `Reject_Duplicates`). Humanize never
parses catalog messages itself and never inspects private `i18n` structures.

## Final acceptance rule

A release may be tagged only after:

* the verified GNAT/GPRbuild and AUnit checks remain passing;
* `check_humanize` reports success;
* the `Humanize -> I18N` boundary holds and `i18n` does not depend on `humanize`;
* documentation and machine-readable metadata are regenerated from the final tree.
