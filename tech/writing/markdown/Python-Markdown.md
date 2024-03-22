---
title: Python-Markdown
type: language
category:
  - markdown
url: https://python-markdown.github.io/
docs: https://python-markdown.github.io/
source: https://github.com/Python-Markdown/markdown/
desc-short: |
  This is a Python implementation of John Gruber’s [Markdown](https://daringfireball.net/projects/markdown/). It is almost completely compliant with the reference implementation, though there are a few very minor [differences](https://python-markdown.github.io/#differences). See John’s [Syntax Documentation](https://daringfireball.net/projects/markdown/syntax) for the syntax rules.
tags:
  - dev/markdown
visibility: public
aliases:
  - PyMarkdown
---
`= ("[Website](" + this.website + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

## Specifications

`=this.title` uses

- 4 spaces of indentation
- requires empty lines before lists and around fenced code blocks

## Extensions

![[public/tech/documentation/MkDocs#Markdown Extensions]]


## Extensions

### MagicLink

[Documentation MagicLink](https://facelessuser.github.io/pymdown-extensions/extensions/magiclink/)

This plugin allows to have URLs to GitHub, GitLab, ... repos and more shortened to the common shorthand you find on these services. Especially for GitLab, it will use the handy codes `@<user>`, `#<issue number>`, `!<merge request>`, etc. Reversely, it should be possible to use shorthands in pages and have them be linked to the configured provider and repo.

Configure [custom repository host](https://facelessuser.github.io/pymdown-extensions/extensions/magiclink/#custom-repository-hosts) for shortening references to custom host, e.g. self-hosted GitLab server

`mkdocs.yml`
```yaml
markdown_extensions:
  - pymdownx.magiclink:
      custom:
          myserver:
              host: "https://mydomain.com"
              label: mystuff
              type: gitlab
```

Took me a bit to understand this is the way to enter the config in the MkDocs config. However, it doesn't seem to work all that well

- links aren't shortened
- only `@<provider>:<username>` works with expicitely giving the provider name one chose (e.g. `myserver`) - would be nice to make this default

I started having a look into the code, maybe that will tell me why things aren't working well or how to contribute fixes.