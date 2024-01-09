---
title: Markdownlint
type: software
category: markdown/linter
source: "https://github.com/DavidAnson/markdownlint"
desc-short: |
  A Node.js style checker and lint tool for Markdown/CommonMark files.
tags:
  - dev/markdown/linting
  - dev/markdown/markdownlint
  - dev/linting
visibility: public
---

# `=this.title`

> [!warning] Needs update
> Information on markdownlint, markdownlint-cli and now markdownlint-cli2 not properly separated

`= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`
See also: [[Markdown]]

`= ("[Documentation](" + this.docs + ")")`

- [Rules](https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md)

## Configuration

- sets of rules can be collected in a style, e.g. `relaxed.json` , see [example styles](https://github.com/DavidAnson/markdownlint/tree/main/style)

### markdownlint-cli

For defaults see [example YAML config file on GitHub](https://github.com/DavidAnson/markdownlint/blob/main/schema/.markdownlint.yaml).

Config files: `~/.mdlrc` or specify through argument

```bash
markdownlint -c markdownlint.yml
```

Does support overrides, e.g. for sub-dirs to some extent.^[https://github.com/igorshubovych/markdownlint-cli/issues/53]

### markdownlint-cli2

- [markdownlint-cli2 on GitHub](https://github.com/DavidAnson/markdownlint-cli2)
- [markdownlint-cli2-formatter-summarize](https://www.npmjs.com/package/markdownlint-cli2-formatter-summarize): An output formatter for markdownlint-cli2 that summarizes the results

## Essential Fixes

Especially relevant for publishing Markdown notes, for example with [[MkDocs]]

- indentation: notes don't render correctly if indent is wrong
- newlines around certain elements required for proper rendering: lists, fenced code blocks, ...
- frontmatter: some Markdown parsers choke on invalid YAML syntax, e.g. empty keys or strings with colons, such as URLs `https:...`

## Integrations

- [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli): MarkdownLint Command Line Interface
    - run using Docker

      ```bash
      docker run -v $PWD:/workdir ghcr.io/igorshubovych/markdownlint-cli:latest "*.md"
      ```

- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2): A fast, flexible, configuration-based command-line interface for linting Markdown/CommonMark files with the markdownlint library
- Editors
    - (N)VIM
        - [coc-markdownlint](https://github.com/fannheyward/coc-markdownlint): markdownlint extension for coc.nvim
