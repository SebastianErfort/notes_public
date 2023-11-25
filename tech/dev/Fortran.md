---
visibility: public
title: Fortran
---
### Style & Linting

[fortran-linter PyPi](https://pypi.org/project/fortran-linter/)

- Punctuation should be followed by a space, this include `,`, `;` and `)`.
- Binary operators (`==`, `+`, ...) should be surrounded by spaces
- The following special characters are surrounded by at least one space: `::`, `=`.
- A line should not exceed 120 characters (this is somehow already extreme). The maximum line length can be controlled from the CLI.
- One should use `use mpi` instead of `include "mpif.h"`. Note that this is not fixed by default as it may break codes where `include "mpif.h"` follows and `implicit none` statement.
- Spaces are preferred over tabs, trailing whitespaces are cleaned.
- Warnings are raised if you use `real(8) :: foo`. One should rather use `integer, parameter :: dp = selected_real_kind(15); real(dp) :: foo` or `use iso_fortran_env; real(real64) :: foo`
[CanESM Fortran Style Guide](https://canesm.readthedocs.io/en/latest/contributing/fortran-standard.html)
