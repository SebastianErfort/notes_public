---
title: MkDocs
type: software
category: documentation
url: "https://www.mkdocs.org/"
docs: "https://www.mkdocs.org/"
source: "https://github.com/mkdocs/mkdocs"
developer: "Copyright © 2014 [Tom Christie](https://twitter.com/starletdreaming), Maintained by the [MkDocs Team](https://www.mkdocs.org/about/release-notes/#maintenance-team)\n"
desc-short: "MkDocs is a **fast**, **simple** and **downright gorgeous** static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file. Start by reading the [introductory tutorial](https://www.mkdocs.org/getting-started/), then check the [User Guide](https://www.mkdocs.org/user-guide/) for more information.\n"
tags:
docker-image: squidfunk/mkdocs-material
visibility: public
---
`= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

## Getting Started
1. install `mkdocs` package (from package repos or via [[Python#pip|pip]])
    ```bash
    pip install mkdocs
    ```
1. create new project
    ```bash
    mkdocs new my-project
    ```
  will result in files/folders
    ```
    .
    ├── docs
    │   └── index.md
    └── mkdocs.yml
    ```
1. dump our Markdown files in `docs/`, e.g. as Git submodule
    ```bash
    git submodule add URL docs
    ```
    or in separate subdirectories if we include more sources (adding submodules to our Wiki repo doesn't work for the GitLab Wiki as it doesn't pull submodules, **but** it sucks anyway)
1. start server for local testing
    ```bash
    mkdocs serve
    ```


## Documentation
- [Writing with Markdown](https://www.mkdocs.org/user-guide/writing-your-docs/#writing-with-markdown)
  - [Internal Links](https://www.mkdocs.org/user-guide/writing-your-docs/#internal-links)
> MkDocs uses the [Python Markdown](https://python-markdown.github.io/) library to translate Markdown files into HTML


## Config
- [Environment variables](https://www.mkdocs.org/user-guide/configuration/#environment-variables)
    ```yaml
    site_name: !ENV SITE_NAME
    ```

### Themes
- [Cinder](https://sourcefoundry.org/cinder/)
- [mkdocs-terminal/](https://ntno.github.io/mkdocs-terminal/)

#### mkdocs-material
[PyPI](https://pypi.org/project/mkdocs-material/)
See [Website](https://squidfunk.github.io/mkdocs-material/)
- [Getting started](https://squidfunk.github.io/mkdocs-material/getting-started/)
- [plugins: search](https://squidfunk.github.io/mkdocs-material/setup/setting-up-site-search/#setting-up-site-search)
- [plugins: tags](https://squidfunk.github.io/mkdocs-material/setup/setting-up-tags/#setting-up-tags): support for tags in page front matter and search function
  Caveat: slightly more picky about YAML syntax than Obsidian
    - create a [Tags Index](https://squidfunk.github.io/mkdocs-material/setup/setting-up-tags/#adding-a-tags-index): `[TAGS]`
    - hide tags on a page: add following to front matter, `hide: [tags]`
- Markdown
  - [Reference](https://squidfunk.github.io/mkdocs-material/reference/)
  - [[#Markdown Extensions]]
- Navigation/sidebar
  - [Navigation Tabs](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/#navigation-tabs)
  ```yaml
  theme:
    features:
      - navigation.top  # back-to-top button
      - toc.follow  # auto-scroll toc sidebar

  ```

### Markdown

#### Markdown Extensions
[Markdown Extensions](https://www.mkdocs.org/user-guide/configuration/#markdown_extensions)
See [list](https://python-markdown.github.io/extensions/) of [[Python-Markdown]] extensions

- [TOC](https://python-markdown.github.io/extensions/toc/)
- [Footnotes](https://python-markdown.github.io/extensions/footnotes/)
- [Admonition](https://python-markdown.github.io/extensions/admonition/#admonition): not configurable, compatibility with Obsidian call-outs would require work
- [Definition Lists](https://python-markdown.github.io/extensions/definition_lists/)
- [`mdx_truly_sane_lists`](https://github.com/radude/mdx_truly_sane_lists): `pip install mdx-truly-sane-lists`
  > Extension for Python-Markdown that makes lists truly sane. Custom indents for nested lists and fix for messy linebreaks and paragraphs between lists.
  
  Issues: [#16: doesn't support mixing indentations](https://github.com/radude/mdx_truly_sane_lists/issues/16) | [#7: list not rendering without preceding empty line] #todo/tech/markdown/mkdocs

[[#mkdocs-material]] documentation

- [Tasklist](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#tasklist): to-do/check lists
  - [Footnotes](https://squidfunk.github.io/mkdocs-material/reference/footnotes/)
- [Formatting](https://squidfunk.github.io/mkdocs-material/reference/formatting/): strikeout, highlight, underline, sub- and super-script, keyboard keys (short-code for HTML tag `<kbd>`)
- [Table of Contents](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown/?h=#table-of-contents)
- [Emoji](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#emoji)
- [Diagrams](https://squidfunk.github.io/mkdocs-material/reference/diagrams/): Superfences for [[Markdown#Graphs Mermaid]]
- [Annotations](https://squidfunk.github.io/mkdocs-material/reference/annotations/#usage)
  - [Code blocks](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/): different ways to set up syntax highlighting for code blocks, either during build time using [Pygments](https://pygments.org) or during runtime using a JavaScript syntax highlighter
    - [Code copy button](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#code-copy-button)
    - [Code annotations](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#code-annotations)
    - [Embedding external files](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#embedding-external-files)
  - [Snippets](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#snippets): adds the ability to embed content from arbitrary files into a document, including other documents or source files, by using a simple syntax

Example
```yaml
---
# some sections error'd with 2 spaces indentation, keep 4!
site_name:
# site_url:
repo_name: GitLab
repo_url:
edit_uri_template: '-/wikis/{path!q}/edit'  # doesn't work yet
# dev_addr: '127.0.0.1:8000'  # address used when running mkdocs serve
plugins:
    - search:
        lang: en
theme:
  name: material
  palette:
    primary: custom  # see https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/#custom-colors
extra_css:
  - stylesheets/extra.css
markdown_extensions:
    - pymdownx.tasklist
    - footnotes
    - toc:
        permalink: "🔗"  # Generate permanent links at the end of each header
        baselevel: 2
        # marker: '[[_TOC_]]'  # no effect, material documentation doesn't mention this keyword
        # permalink_title:  # can maybe used with variable/template to get heading text instead of icon?
    - wikilinks  # see https://python-markdown.github.io/extensions/wikilinks/
    - attr_list
    - pymdownx.emoji:
        emoji_index: !!python/name:materialx.emoji.twemoji
        emoji_generator: !!python/name:materialx.emoji.to_svg
    - pymdownx.superfences:
        custom_fences:
            - name: mermaid
              class: mermaid
              format: !!python/name:pymdownx.superfences.fence_code_format
    - pymdownx.highlight:
        linenums: true
...

```


## Plugins
- [tags](https://squidfunk.github.io/mkdocs-material/setup/setting-up-tags)
- [exclude](https://github.com/apenwarr/mkdocs-exclude): mkdocs plugin that lets you exclude files or trees from your output
    ```yaml
    plugins:
    - exclude:
        glob:
          - exclude/this/path/*
          - "*.tmp"
        regex:
          - '.*\.(tmp|bin|tar)$'
    ```
- [mkdocs-macros](https://mkdocs-macros-plugin.readthedocs.io/en/latest/): A plugin for unleashing the power of Mkdocs, by using variables and macros
- [mkdocs-gitlab-plugin](https://gitlab.inria.fr/vidjil/mkdocs-gitlab-plugin): MkDocs plugin to transform strings such as #1234, %56, or !789 into links to a Gitlab repository.
- [mkdocs-ezlinked-plugin](https://pypi.org/project/mkdocs-ezlinked-plugin/): enables easier linking between pages
- [mkdocs-obsidian-support-plugin](https://github.com/ndy2/mkdocs-obsidian-support-plugin): convert Obsidian call-outs and wiki-link images to mkdocs-material compatible code
    Problems
    - callouts with open/closed modifiers `[!info]+/-` aren't handled and the `+/-` becomes a list bullet point


## [YAML Metadata or Front Matter](https://www.mkdocs.org/user-guide/writing-your-docs/#yaml-style-meta-data)

Example

```yaml
---
title: My Document
summary: A brief description of my document.
authors:
    - Waylan Limberg
    - Tom Christie
date: 2018-07-10
some_url: https://example.com
---
```


## Integrations
- [[personal/tech/software/Gitlab#GitLab Pages|GitLab Pages]]: [Template repo](https://gitlab.com/pages/mkdocs) | [Demo website](https://pages.gitlab.io/mkdocs/)
- Obsidian: [[Obsidian#Obsidian GitHub Publisher|Obsidian GitHub Publisher]]

### Search
> A search plugin is provided by default with MkDocs which uses [lunr.js](https://lunrjs.com/) as a search engine.[^1]

[^1]: https://www.mkdocs.org/user-guide/configuration/#search

## References
- [catalog](https://github.com/mkdocs/catalog): A list of awesome MkDocs projects and plugins.
- [Blog: Create a Personal Site](https://www.codeinsideout.com/blog/site-setup/create-site-project)