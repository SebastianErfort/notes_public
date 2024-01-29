---
title: MkDocs
type: software
category: documentation
url: "https://www.mkdocs.org/"
docs: "https://www.mkdocs.org/"
source: "https://github.com/mkdocs/mkdocs"
developer: "Copyright © 2014 [Tom Christie](https://twitter.com/starletdreaming), Maintained by the [MkDocs Team](https://www.mkdocs.org/about/release-notes/#maintenance-team)\n"
desc-short: "MkDocs is a **fast**, **simple** and **downright gorgeous** static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file. Start by reading the [introductory tutorial](https://www.mkdocs.org/getting-started/), then check the [User Guide](https://www.mkdocs.org/user-guide/) for more information.\n"
tags: ["writing/docs", "docs/mkdocs"]
docker-image: squidfunk/mkdocs-material
visibility: public
---
# MkDocs

`= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

> [!warning] Caveats
>
> - use only relative links, not absolute links, for compatibility between different Markdown viewers/editors
>     - using Markdown extensions such as mkdocs-ezlinked locate files and make it significantly easier to use links
>     - [[personal/projects/templates/obsidian|obsidian]]: activate shortest possible paths in settings to achieve compatible links.
 
## Getting Started

1. install `mkdocs` package and other requirements (from package repos or via `pip`, consider creating a new Python virtual environment)

    ```bash
    pip install -r requirements.txt
    ```

    or only MkDocs package

    ```bash
    pip install mkdocs
    ```

1. create new project

    ```bash
    mkdocs new my-project
    ```

    will create files/folders

    ```
    my-project/
    ├── docs/
    │   └── index.md
    └── mkdocs.yml
    ```

1. dump our Markdown files in `docs/`, e.g. as Git submodule

    ```bash
    git submodule add URL docs
    ```

    or in separate subdirectories if you include more sources. [[git#Sparse Checkout|Git's sparse checkout]] can be helpful if you want to integrate repos containing more than documentation as this lets you chose which files and directories you want to have present.
1. start server for local testing or build (output to `public/`)

    ```bash
    mkdocs serve
    # or
    mkdocs build
    ```


## CLI

[MkDocs documentation: CLI](https://www.mkdocs.org/user-guide/cli)

## Config

In file `mkdocs.yml`.

- [Environment variables](https://www.mkdocs.org/user-guide/configuration/#environment-variables)

    ```yaml
    site_name: !ENV SITE_NAME
    ```

Examples

- [MkDocs config Python Markdown extensions](https://github.com/facelessuser/pymdown-extensions/blob/main/mkdocs.yml)

### Themes

- [Cinder](https://sourcefoundry.org/cinder/)
- [mkdocs-terminal](https://ntno.github.io/mkdocs-terminal/)

#### mkdocs-material

See [Website](https://squidfunk.github.io/mkdocs-material/) | [PyPI](https://pypi.org/project/mkdocs-material/)

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

## Markdown in MkDocs

To ensure compatibility between MkDocs and other Markdown renderers, try to stick to [[Python-Markdown#Specifications|Python-Markdown Specifications]].
A number of Markdown extensions and MkDocs plugins is used, see `mkdocs.yml`. The script `util/markdown.sh` contains a number of functions to edit Markdown files in a batch

- `md_fix_lists_empty_line`: add empty lines before Markdown lists that wouldn't render as lists in MkDocs otherwise
- `md_fix_linestart_obsidian-tag`: add text before Obsidian inline tage that would render as headings in MkDocs otherwise
- `fm_fix_tags_format`: ensure tags in YAML front matter are proper YAML arrays (Obsidian accepts just a space as separator)


#### Markdown Extensions

> [!todo] Clean
> - [ ] categorise extensions/plugins

See [MkDocs documentation on markdown extensions](https://www.mkdocs.org/user-guide/configuration/#markdown_extensions), [list of Python-Markdown extensions](https://python-markdown.github.io/extensions/) and [[Python-Markdown]]

- [TOC](https://python-markdown.github.io/extensions/toc/)
- [Footnotes](https://python-markdown.github.io/extensions/footnotes/)
- [Admonition](https://python-markdown.github.io/extensions/admonition/#admonition): not configurable, full compatibility with Obsidian call-outs would require work
- [Definition Lists](https://python-markdown.github.io/extensions/definition_lists/)
- [`mdx_truly_sane_lists`](https://github.com/radude/mdx_truly_sane_lists): `pip install mdx-truly-sane-lists`
  > Extension for Python-Markdown that makes lists truly sane. Custom indents for nested lists and fix for messy linebreaks and paragraphs between lists.
  
  Issues: [#16: doesn't support mixing indentations](https://github.com/radude/mdx_truly_sane_lists/issues/16) | [#7: list not rendering without preceding empty line] #todo/tech/markdown/mkdocs
- [mdx-breakless-lists](https://github.com/adamb70/mdx-breakless-lists/tree/master): don't require empty line before lists, uses regex to enter empty line in processing, so one doesn't have to change the source

[[#mkdocs-material]] documentation

- [Tasklist](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#tasklist): to-do/check lists
    - [Footnotes](https://squidfunk.github.io/mkdocs-material/reference/footnotes/)
- [Formatting](https://squidfunk.github.io/mkdocs-material/reference/formatting/): strikeout, highlight, underline, sub- and super-script, keyboard keys (short-code for HTML tag `<kbd>`)
- [Table of Contents](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown/?h=#table-of-contents)
- [Emoji](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#emoji)
- [Diagrams](https://squidfunk.github.io/mkdocs-material/reference/diagrams/): Superfences for [[Markdown#Graphs Mermaid]] (there is also [[#^9b0fb2|mkdocs-mermaid2-plugin]]) ^4d7ac7
- [Annotations](https://squidfunk.github.io/mkdocs-material/reference/annotations/#usage)
    - [Code blocks](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/): different ways to set up syntax highlighting for code blocks, either during build time using [Pygments](https://pygments.org) or during runtime using a JavaScript syntax highlighter
        - [Code copy button](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#code-copy-button)
        - [Code annotations](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#code-annotations)
        - [Embedding external files](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#embedding-external-files)
    - [Snippets](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#snippets): adds the ability to embed content from arbitrary files into a document, including other documents or source files, by using a simple syntax

<!-- TODO embed a file once I created a [[templates/mkdocs|MkDocs template]] -->
> [!example]- Example `mkdocs.yml` configuration
> ```yaml
> ---
> # some sections error'd with 2 spaces indentation, keep 4!
> site_name:
> # site_url:
> repo_name: GitLab
> repo_url:
> edit_uri_template: '-/wikis/{path!q}/edit'  # doesn't work yet
> # dev_addr: '127.0.0.1:8000'  # address used when running mkdocs serve
> plugins:
>     - search:
>         lang: en
> theme:
>   name: material
>   palette:
>     primary: custom  # see https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/#custom-colors
> extra_css:
>   - assets/css/extra.css
> markdown_extensions:
>     - pymdownx.tasklist
>     - footnotes
>     - toc:
>         permalink: "🔗"  # Generate permanent links at the end of each header
>         baselevel: 2
>         # marker: '[[_TOC_]]'  # no effect, material documentation doesn't mention this keyword
>         # permalink_title:  # can maybe used with variable/template to get heading text instead of icon?
>     - wikilinks  # see https://python-markdown.github.io/extensions/wikilinks/
>     - attr_list
>     - pymdownx.emoji:
>         emoji_index: !!python/name:materialx.emoji.twemoji
>         emoji_generator: !!python/name:materialx.emoji.to_svg
>     - pymdownx.superfences:
>         custom_fences:
>             - name: mermaid
>               class: mermaid
>               format: !!python/name:pymdownx.superfences.fence_code_format
>     - pymdownx.highlight:
>         linenums: true
> ...
> 
> ```

### Plugins

- [mkdocs-ezlinked-plugin](https://pypi.org/project/mkdocs-ezlinked-plugin/): enables easier linking between pages
- [mkdocs-autolinks-plugin](https://github.com/midnightprioriem/mkdocs-autolinks-plugin): Simplified relative linking between chapters.
- [tags](https://squidfunk.github.io/mkdocs-material/setup/setting-up-tags)
- [mkdocs-mermaid2-plugin](https://github.com/fralau/mkdocs-mermaid2-plugin): A Mermaid graphs plugin for mkdocs (difference to [[#^4d7ac7|Diagrams superfences]]?) ^9b0fb2
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

- [mkdocs-exclude-search](https://github.com/chrieke/mkdocs-exclude-search): Exclude selected files or sections from the search index.
- [mkdocs-table-reader-plugin](https://github.com/timvink/mkdocs-table-reader-plugin
- [mkdocs-redirects](https://github.com/datarobot/mkdocs-redirects): Page redirects for moved/renamed pages
- [mkdocs-macros](https://mkdocs-macros-plugin.readthedocs.io/en/latest/): A plugin for unleashing the power of Mkdocs, by using variables and macros
- [mkdocs-gitlab-plugin](https://gitlab.inria.fr/vidjil/mkdocs-gitlab-plugin): MkDocs plugin to transform strings such as #1234, %56, or !789 into links to a GitLab repository.
- [mkdocs-ezlinked-plugin](https://pypi.org/project/mkdocs-ezlinked-plugin/): enables easier linking between pages
- Obsidian compatibility: (Wiki-)links, admonitions/callouts, (nested) tags
    - [mkdocs-obsidian-support-plugin](https://github.com/ndy2/mkdocs-obsidian-support-plugin): convert Obsidian call-outs and wiki-link images to mkdocs-material compatible code
        Issues:
        - callouts with open/closed modifiers `[!info]+/-` aren't handled and the `+/-` becomes a list bullet point
    - [mkdocs-obsidian-bridge](https://github.com/GooRoo/mkdocs-obsidian-bridge): currently only handling links (allow partial path, selecting file with shortest match, style dead links)


## Editing

See also [[Markdown]].

- [Writing with Markdown](https://www.mkdocs.org/user-guide/writing-your-docs/#writing-with-markdown)
    - [Internal Links](https://www.mkdocs.org/user-guide/writing-your-docs/#internal-links)

> MkDocs uses the [Python Markdown](https://python-markdown.github.io/) library to translate Markdown files into HTML

[YAML Metadata or Front Matter](https://www.mkdocs.org/user-guide/writing-your-docs/#yaml-style-meta-data)

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

> [!tip] Live-reload running `mkdocs serve`
> This command by default rebuilds every page, without caching. When editing a single page this can be very frustrating as it may take a while until the results are rendered. With certain caveats,[^dirty] `mkdocs serve --dirty` can be used, to only rebuild pages that were changed.


## Features

- [embedding external files](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#embedding-external-files): [pymdown-extension snippets](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/) (Obsidian syntax for embedding other notes could be translated to use this, see [[mkdocs_obsidian_compatibility|project MkDocs-Obsidian compatibility]] #idea/tech/mkdocs #idea/tech/obsidian)
    - [snippets notation](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/#snippets-notation)
    - can be used to keep a central file of references, e.g. a glossary, that can be included and things like hyperlinks defined therein can be accessed
    


## Integrations

- [[git/GitLab#GitLab Pages|GitLab Pages]]: [Template repo](https://gitlab.com/pages/mkdocs) | [Demo website](https://pages.gitlab.io/mkdocs/)
- Obsidian: [[personal/projects/templates/obsidian#Obsidian GitHub Publisher|Obsidian GitHub Publisher]]
- [[mkdocstrings]]

### Search

> A search plugin is provided by default with MkDocs which uses [lunr.js](https://lunrjs.com/) as a search engine.[^search]

[^search]: <https://www.mkdocs.org/user-guide/configuration/#search>


## Compatibility

### Obsidian

As can be expected not all Markdown renders the same as different specifications are used.[^markdown-specs] I have been working on a [MkDocs template] with some changes to the default Markdown config and adding some extensions/plugins to achieve as much as possible compatibility. The [list of to-dos] is getting shorter, but some critical features are yet missing.

Then there are some quite helpful plugins in Obsidian, especially [[Dataview]]. There have been requests in the forums, but no solution yet.
Maybe one day there will be a MkDocs DataView plugin, or system-independent plugins. For now, [[Dataview#Export|export rendered DataView results from Obsidian]].

> [!todo] add missing links

[^markdown-specs]: [[personal/projects/templates/obsidian#Markdown|Obsidian: mostly CommonMark]] vs [[#Markdown|MkDocs: Python-Markdown]]


## References

- [catalog](https://github.com/mkdocs/catalog): A list of awesome MkDocs projects and plugins.
- [Blog: Create a Personal Site](https://www.codeinsideout.com/blog/site-setup/create-site-project)

[^dirty]: <https://github.com/mkdocs/mkdocs/issues/2384>
