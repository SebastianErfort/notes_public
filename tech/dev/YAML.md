---
title: YAML
visibility: public
tags:
  - dev/yaml
type: language
category:
  - markup
url: https://yaml.org/
---
# YAML

`= ("[Website](" + this.url + ")")` | [YAML 1.2.2 Specification](https://yaml.org/spec/1.2.2/)


## Language

### Strings

YAML multi-line string (block scalar), see <https://yaml-multiline.info/>: syntax explained, with examples

```yaml
# Block scalars (extended, multi-line strings)
key: |
  Block scalars support extended escaping and 3 parameters to modify how white-space and newlines are treated.
```

^7903df

Example

```yaml
# |2 will preserve leading white space by telling yaml there are 2 spaces of
# additional indentation
host_config: |2
    "host": "server.domain.com"
# ignore linebreaks until next key
description: >-
  Tasted a lot like banana
  with a slight sour note.
```


## Linting

- yamllint: [Documentation](https://yamllint.readthedocs.io/en/stable/index.html) | [![|20](github.png) GitHub](https://github.com/adrienverge/yamllint)
    - supports extracting and processing of **YAML front matter in Markdown** files
- yamlfmt: [Source: github.com/google/yamlfmt](https://github.com/google/yamlfmt) |
- yamlfix: [GitHub](https://github.com/lyz-code/yamlfix) | [Documentation](https://lyz-code.github.io/yamlfix/)

YAML front matter in Markdown files: see [[public/tech/writing/Markdown#Linting and Style|Markdown: Linting and Style]].


## Tools

- [[yq]]: YAML parser, also supports front matter in (Markdown) files