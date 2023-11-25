---
title: yq
type: software
category: utility
url: "https://mikefarah.gitbook.io/yq/"
docs: "https://mikefarah.gitbook.io/yq/"
github: "https://github.com/mikefarah/yq"
developer: "https://github.com/mikefarah"
desc-short: |
  yq is a portable command-line YAML, JSON, XML, CSV, TOML and properties processor
tags:
  - dev/bash
  - dev/cli
  - dev/golang
  - dev/yaml
  - dev/toml
  - dev/json
  - dev/csv
  - dev/xml
  - dev/tools
visibility: public
---
`= ("[Website](" + this.website + ")")` |  `= ("[Github](" + this.github + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

`= ("[Documentation](" + this.docs + ")")`

- [Front Matter](https://mikefarah.gitbook.io/yq/usage/front-matter) #dev/yaml/frontmatter
- [Split into multiple files](https://mikefarah.gitbook.io/yq/usage/split-into-multiple-files)
- [Evaluate expressions](https://mikefarah.gitbook.io/yq/commands/evaluate)
- output to Shell variable declaration

## Commands

### Front Matter

```bash
yq --front-matter=process '.a="chocolate"' <file>
yq --front-matter=extract '.a="chocolate"' <file>
```

### Tests and comparison

```bash
yq '.[] | tag="!!str"' # value is string
```

## Output

### Formatting

<https://github.com/mikefarah/yq/discussions/1138>

```bash
# double-quote strings
yq ... --style=double ...
```

## References

- <https://towardsdatascience.com/yq-mastering-yaml-processing-in-command-line-e1ff5ebc0823>
