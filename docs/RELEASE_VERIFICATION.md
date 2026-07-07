# Release Verification Status

This document records what must be verified before tagging a Humanize release.
Documentation and metadata describe the intended public contract; the compiler
and the test suite remain the authority for Ada visibility, the `Humanize -> I18N`
boundary, and behavior.

## Verified GNAT 15/GPRbuild checks

Humanize must be built with Alire GNAT 15 only. The development, release,
build-overlay, tests, and tooling manifests pin `gnat_native = "=15.2.1"`.
Confirm the selected compiler with:

```sh
alr exec -- gnatls --version
```

Do not run plain system `gnat*`, `gnatmake`, `gnatls`, `gnatprove`, or
`gprbuild` in this workspace. Use `alr exec -- ...` for compiler and builder
commands so PATH cannot select a different GNAT installation.

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

`check_humanize` also builds `examples/examples.gpr`, runs GNATdoc, validates
the public GNATdoc tags, verifies example inventory documentation, checks that
compiler `.stderr` logs are empty, and enforces the Humanize/tooling and
Humanize/i18n import boundaries. It also stages and verifies a pin-free release
tree at `/tmp/humanize-release-stage`.

## Remaining publication checks

Before publishing or tagging a release, also run:

```sh
alr exec -- gprbuild -P examples/examples.gpr
alr exec -- gnatdoc -P humanize.gpr
```

`alr test` is part of the required release gate and runs the manifest-declared
test action. The release is not publication-ready if any required local
publication command fails.

## Manifest Staging

Humanize keeps separate manifests for development and publication:

* `alire.toml` is the development manifest and intentionally pins `i18n` to the
  sibling `../i18n` checkout.
* `alire.release.toml` is the pin-free release manifest template.
* `alire.build.toml` is the local build overlay: it starts with the release
  manifest content and appends the development pin.

Both dependency manifests require `i18n >= 1.1.0`. The release checker rejects a
release template containing local pins and verifies that the build overlay keeps
the expected local `i18n` pin.

## Staged Release Tree

The focused staged-release command is:

```sh
cd check_humanize
alr build
./bin/check_humanize --staged-release-only
```

This creates `/tmp/humanize-release-stage`, copies the release source tree while
excluding development/build artifacts such as `.git`, `alire/`, `obj/`, `lib/`,
`check_humanize/`, `alire.lock`, and `alire.build.toml`, then writes
`alire.release.toml` as the staged `alire.toml`.

The staged verification requires the pin-free staged manifest to pass
`Project_Tools.Alire_Manifests.Require_Staged_Crate_Source` and
`Require_No_Local_Pins`. Because Humanize may be tested before the required
`i18n >= 1.1.0` release is available from the public Alire index, the checker
then creates a temporary `/tmp/humanize-release-stage/alire.build.toml` overlay
that pins `i18n` to the local sibling checkout and activates it for the build
phase. The pin-free publication manifest is preserved as
`/tmp/humanize-release-stage/alire.publish.toml`.

After activating that temporary build overlay, the checker runs:

```sh
cd /tmp/humanize-release-stage
alr build
cd tests
alr exec -- gprbuild -P tests.gpr
alr exec -- ./bin/tests
cd ..
alr exec -- gprbuild -P examples/examples.gpr
./examples/bin/humanize_demo
```

The staged `./bin/tests` run includes
`Humanize.Tests.Compatibility`, a golden-output corpus for common Humanize
expectations across dates, durations, bytes, numbers, units, lists, strings,
phrases, summaries, comparisons, colors, parsing, and invalid edge cases.
Those cases are intentionally runtime-independent API expectations, not a
clone of another library's API.

The demo output is compared exactly against
`examples/EXPECTED_OUTPUT.md`. A release is not publication-ready if the staged
tree check fails. Once `i18n >= 1.1.0` is available from the Alire index, this
temporary build-overlay step can be removed to prove dependency resolution from
the pin-free staged manifest directly.

## Strict Dependency State

Before tagging a release, run the strict dependency check:

```sh
cd check_humanize
./bin/check_humanize --release-strict --staged-release-only
```

`--release-strict` requires the sibling `../i18n` and `../project_tools` git
worktrees to be clean before running the requested release checks. This is
opt-in so day-to-day local verification can still run while those sibling
tooling/dependency repos are under active development.

## Dependency and boundary checks

Humanize depends on `i18n` and must keep the dependency one-way:

* the Alire manifests declare `i18n >= 1.1.0`;
* the development/build manifests pin `i18n` to `../i18n` for local development;
* the release manifest is pin-free;
* `i18n` never depends on `humanize`;
* all direct calls into `I18N.Runtime`, `I18N.Arguments`, and
  `I18N.Result.Output_Text` are isolated in the private package
  `Humanize.I18N_Rendering` (HUM-INV-003);
* the domain packages `Humanize.Datetimes`, `Humanize.Durations`, and
  `Humanize.Bytes` do not import `I18N.Runtime` directly (HUM-INV-002).

The architecture test in `tests/src/humanize-tests-architecture.adb` keeps the
fast semantic invariants: every `Message_Id` maps to a non-empty unique key and
every key resolves in every shipped locale after `Humanize.Catalogs.Load_Defaults`.
The release checker owns source/package policy scans, including unexpected
public or private `I18N` imports and localized text leakage in classifiers.

## Catalog statement

Humanize ships built-in English, Danish, German, French, Spanish, Italian,
Portuguese, and Dutch native catalog fragments as in-source string constants.
It also ships complete generated-source fragments for Swedish, Norwegian,
Norwegian Bokmal, Finnish, Polish, Czech, Turkish, Romanian, Lithuanian,
Slovenian, Indonesian, Malay, Esperanto, Vietnamese, Swahili, Afrikaans,
Hungarian, Slovak, Russian, Ukrainian, Japanese, Korean, Chinese, Arabic, and
Hindi locale codes. Generated-source
fragments use native script or native Latin orthography for the core Humanize
date, duration, byte, compact-number, unit, frequency, rate, and list words,
with long-form wording for the broad engineering-unit tail.
Region-tagged contexts resolve through `i18n` locale fallback to the shipped
base fragments. All fragments load through the public `I18N.Runtime.Load_Text`
API with the caller-selected duplicate policy (default `Reject_Duplicates`).
Rejected duplicate loads are non-destructive; explicit `Keep_First` and
`Override_Previous` loads are verified as pass-through behavior. Humanize never
parses catalog messages itself and never inspects private `i18n` structures.

## Local Shell Noise

The release checker enforces empty compiler `.stderr` logs after its build steps.
Messages emitted by a developer's login shell before a command starts, such as a
local `xmodmap` startup warning, are outside the Ada project and should be fixed
in the user's shell startup files. They are not accepted as compiler warnings and
must not appear in generated `.stderr` logs.

## Final acceptance rule

A release may be tagged only after:

* the verified GNAT/GPRbuild and AUnit checks remain passing;
* `check_humanize` reports success;
* `check_humanize --staged-release-only` reports success for
  `/tmp/humanize-release-stage`;
* `check_humanize --release-strict --staged-release-only` reports success after
  sibling dependencies are committed/tagged;
* the `Humanize -> I18N` boundary holds and `i18n` does not depend on `humanize`;
* documentation and machine-readable metadata are regenerated from the final tree.
