# Agent instructions

This repository is an Ada 2022 Humanize library crate.

## Toolchain

Use Alire GNAT 15 only. Do not run plain system `gnat*`, `gnatmake`, `gnatls`,
`gnatprove`, or `gprbuild` in this workspace. Use `alr exec -- ...` for compiler
and builder commands so PATH cannot select a different GNAT installation.

The development, release, build-overlay, tests, and tooling manifests must pin:

```toml
[[depends-on]]
gnat_native = "=15.2.1"
```

Confirm the selected compiler with:

```sh
alr exec -- gnatls --version
```

## Validation

Preferred validation:

```sh
alr build
cd tests && alr build && ./bin/tests
cd ..
cd check_humanize && alr build && ./bin/check_humanize
```

When GNAT/GPRBuild are unavailable through Alire, state that clearly and run the
static checks the environment supports.

## Boundaries

`humanize` depends on `i18n`. `project_tools` is for `check_humanize` tooling
only and must not become a runtime dependency of the library crate.
