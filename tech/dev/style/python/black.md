---
title: Black
type: software
category:
  - linter
url: https://black.readthedocs.io/en/stable/
docs: https://black.readthedocs.io/en/stable/
source: https://github.com/psf/black
developer: https://github.com/psf
desc-short: The uncompromising Python code formatter
desc: Black is the uncompromising Python code formatter. By using it, you agree to cede control over minutiae of hand-formatting. In return, Black gives you speed, determinism, and freedom from pycodestyle nagging about formatting. You will save time and mental energy for more important matters.Blackened code looks the same regardless of the project you're reading. Formatting becomes transparent after a while and you can focus on the content instead.Black makes code review faster by producing the smallest diffs possible.Try it out now using the Black Playground. Watch the PyCon 2019 talk to learn more.
visibility: public
---
# `=this.title`

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

[[pre-commit]] hooks ^13286c

- [Black repo @GH](https://github.com/psf/black)
- [Black pre-commit mirror repo @GH](https://github.com/psf/black-pre-commit-mirror) (faster, only pre-commit stuff)