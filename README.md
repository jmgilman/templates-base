# Base Template

> A foundational Copier template

This is the base [Copier] template which serves as the foundation for all other
templates.

## Usage

```
copier copy gh:jmgilman/templates-base <dest>
```

## Overview

The base template provides a [Nix] foundation for all of my open-source
projects. It uses the [std] Nix framework for organizing the Nix code within
the repository. It ships with a preconfigured [devshell], however, no
dependencies are included by default (those should be added by consumers).
Finally, it includes a `.envrc` file to automatically support [direnv].

## Nix

Nix is primarily used to offer a development shell for the project. This allows
isolating project-specific dependencies to the project itself and reduces
cluttering a system with transient dependencies. Additionally, the dependencies
provided by the development shell are locked, allowing reproducible environments
for contributors.

It's important to note that I _do not_ use Nix for packaging project code. This
is typically handled by different tooling. The purpose of Nix is to solely
provide an isolated, reproducible development environment.

The development shell uses [Nixago] for automatically creating various dotfiles
in the root of the repository. In particular, this base template ships with
support for:

- Using [Conform] for validating commits adhere to [Conventional Commits][cc]
- Using [Lefthook] for running pre-commit hooks
- Using [treefmt] for formatting files

Formatting and commit validation will automatically be ran as a pre-commit hook.


[cc]: https://www.conventionalcommits.org/en/v1.0.0/
[conform]: https://github.com/edmundhung/conform
[copier]: https://github.com/copier-org/copier
[devshell]: https://github.com/numtide/devshell
[direnv]: https://direnv.net/
[lefthook]: https://github.com/evilmartians/lefthook
[nix]: https://nixos.org/
[nixago]: https://github.com/nix-community/nixago
[std]: https://github.com/divnix/std
[treefmt]: https://github.com/numtide/treefmt