---
title: Prettier
desc-short: |
  Prettier is an opinionated code formatter. It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary.
url: https://prettier.io/
source: https://github.com/prettier/prettier
type: software
category:
  - formatter
tags:
  - dev/linting
  - dev/style
  - dev/formatting
---

# `=this.title`

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

- supports Markdown (front matter), YAML, JS, HTML, CSS, ...
- :warning: for Markdown same problem as with [[markdownlint|markdownlint-cli]], indents under-indented content left, removing indentation (version? there have been improvements, e.g. in v1.14)
