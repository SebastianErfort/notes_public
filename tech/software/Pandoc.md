---
title: Pandoc
tags: sw/Pandoc sw/Markdown sw/LaTeX web/HTML web/CSS
people:
  - John MacFarlane
type: software
category: markdown
desc-short: |
  If you need to convert files from one markup format into another, pandoc is your swiss-army knife. Pandoc can convert between the following formats:
visibility: public
---

## Features
  - [Line Blocks](https://pandoc.org/MANUAL.html#line-blocks)

## Resources
- [Pandoc Markdown CSS Theme](https://jez.io/pandoc-markdown-css-theme/): CSS files and a template for using Pandoc to generate standalone HTML files, Makefile to start a local Jekyll server for editing/viewing. ALl in [GitHub repo](https://github.com/jez/pandoc-markdown-css-theme).
- [Blog post: Convert Markdown to HTML with Pandoc](https://www.arthurkoziel.com/convert-md-to-html-pandoc/)


## Filters
[What are pandoc filters?](https://github.com/jgm/pandocfilters/#what-are-pandoc-filters)
Pandoc filters are pipes that read a JSON serialization of the Pandoc AST from stdin, transform it in some way, and write it to stdout.
Available filters:
- [github.com/pandoc/lua-filters](https://github.com/pandoc/lua-filters)
  ```bash
  RELEASE_URL=https://github.com/pandoc/lua-filters/releases/latest
  PANDOC_DIR=~/.local/share/pandoc
  curl -LSs $RELEASE_URL/download/lua-filters.tar.gz | \
      tar --strip-components=1 --one-top-level=$PANDOC_DIR -zvxf -
  ```
  - [[#^eddf73|revealjs-codeblock]]
- [pandocfilters](https://github.com/jgm/pandocfilters/):A python module for writing [pandoc](http://pandoc.org/) filters
  - `tikz.py`: process raw latex tikz environments into images
- [Pandoc Mermaid filter](https://github.com/raghur/mermaid-filter) ^959dc1
  ```bash
  npm install --global mermaid-filter
  ```
- [pandoc-plot](https://laurentrdc.github.io/pandoc-plot/MANUAL.html): plots from code blocks for Markdown and LaTeX

### pandoc-crossref
![[github.png|20]][pandoc-crossref](https://github.com/lierdakil/pandoc-crossref): filter for numbering figures, equations, tables and cross-references to them

### Mermaid
[mermaid-filter](https://github.com/raghur/mermaid-filter): Pandoc filter for creating diagrams in mermaid syntax blocks in markdown docs


## Markdown
### YAML frontmatter
See [Pandoc templates](file://rsc/markdown/pandoc)


## Presentations and Slide Shows
See https://pandoc.org/MANUAL.html#slide-shows
- Structuring
  - change heading level to result in new slide: `--shift-heading-level-by=-1`
- Incremental lists
- Pauses
- Theme: `-V theme=moon`

### reveal.js
See [[revealjs|reveal.js]]
```bash
pandoc -t revealjs -s slides.md -o slides.html
```

#### Filters
[revealjs-codeblock](https://github.com/pandoc/lua-filters/tree/master/revealjs-codeblock): This [[lua]] filter overwrites the code block HTML for `revealjs` output to enable the [code presenting features](https://revealjs.com/code/) of [reveal.js](https://revealjs.com/). A custom template is required to include [highlight.js](https://highlightjs.org/) (which [comes with reveal.js](https://revealjs.com/code/#theming) as a plugin). ^eddf73


# Converting
See [Pandoc documentation](https://pandoc.org/getting-started.html#step-6-converting-a-file)

Convert Markdown to HTML
```bash
pandoc --standalone --metadata title="" file.md -o file.html
```
optionally use a custom template file for the header/footer.


# Templates
- [Variables](https://pandoc.org/MANUAL.html#interpolated-variables)