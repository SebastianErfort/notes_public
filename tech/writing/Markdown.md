---
url: "https://daringfireball.net/projects/markdown/"
visibility: public
title: Markdown
related:
  - "[[dev/YAML|YAML]]"
  - "[[productivity/obsidian/Obsidian]]"
  - "[[features|Obsidian features]]"
---

# Markdown

| Resource | Links |
| ---- | ---- |
| Cheatsheets | [MarkdownHere](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)<br>[www.markdownguide.org](https://www.markdownguide.org/cheat-sheet/)<br>[Cheatsheet jonschlinkert] |
| [[#Linting and Style\|Linting & Style]] | [[markdownlint]], [Obsidian Linter](personal/projects/templates/obsidian.md#^f0ca06) |
| Related | `=(join(this.related, ", "))` |
| My stuff | [Cheat Markdown cheatsheet (local)](file://.config/cheat/cheatsheets/personal/markdown) |
| References | [markdownguide.org] |

## Tools & Software

```dataview
TABLE WITHOUT ID
  file.link AS "Name",
  desc-short AS "Description",
  (join(category)) AS "Category"
WHERE type = "software" AND contains(category,"markdown")
SORT title
```

## Features

There's a great number of cheatsheets and similar references for standard features, see the table at the beginning. The following only contains some additions and examples.

### Links

| Type                           | Description |
| ------------------------------ | ----------- |
| stand-alone URLs `https://...` |  should be inside `<...>` to be processed properly by some Markdown parsers |
| regular inline links `[link text](url "alt text")` | `alt text` is optional, some viewers render it as a tooltip, to handle special characters that would require escaping, such as spaces, some parsers allow URLs in `<...>` again |
| [Wiki-links] `[[url\|link text]]` | helpful extension in some parsers and can be used like `[[url\|link text]]`
| HTML `<a href="url" title="alt text">link text</a>` | helpful when using HTML as mixing with Markdown is not a good idea |

^8eab7a

### Lists

Description lists are non-standard in Markdown and require HTML

```html
<dl>
<dt>Item</dt>
<dd>Description</dd>
</dl>
```

### Tables

<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 45%">

```markdown
| Item | Price | # In stock |
|--------------|:-----:|-----------:|
| Juicy Apples | 1.99 | 739 |
| Bananas | 1.89 | 6 |
```

</div>
<div style="width: 45%">

| Item | Price | # In stock |
|--------------|:-----:|-----------:|
| Juicy Apples | 1.99 | 739 |
| Bananas | 1.89 | 6 |
</div>
</div>

- use `|` for columns (and vertical lines), `-` for rows and horizontal lines
- leading and closing `|` can be omitted (in some Markdown implementations?)
- use `:` for alignment

### Code blocks

[List of Markdown code block languages](https://markdown.land/markdown-code-block)

### Columns

Columns can be achieved with HTML, rendering is dependent on the reader/parser used though.

Two fixed-width columns
<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 45%">
Column 1
</div>
<div style="width: 45%">
Column 2
</div>
</div>

### Custom CSS

Many Markdown viewers/parsers allow the inclusion of custom [[CSS]] code for styling. This can for example be used to set up classes with certain styles, to facilitate applying visual effects.


### (YAML) Front Matter

Many parsers support a block of metadata at the beginning of a Markdown file, usually written in [[dev/YAML|YAML]], sometimes in [[TOML]]. What keys are accepted/used by the parsers varies, but a lot of useful things can be achieved with this.

Example

```yaml
---
title: My Document
date: 2024-01-01
---
```

Parsers

- [gray-matter](https://github.com/jonschlinkert/gray-matter)
- [[yq]]: YAML parser that can be used to extract and process YAML front matter

### Mermaid Graphs

See [[mermaid|notes on Mermaid]].


## Specifications, Implementations and Parsers

- [[CommonMark]]
    - [MyST]: extension on CommonMark aimed at scientific writing
- [GitHub Flavored Markdown Spec (GFM)](https://github.github.com/gfm/): based on [[#CommonMark]]
- [GitLab Flavored Markdown (GLFM)](https://docs.gitlab.com/ee/user/markdown.html)
- [[Python-Markdown]]: Python implementation of [John Gruber’s Markdown](https://daringfireball.net/projects/markdown/), used e.g. in [[public/tech/documentation/MkDocs]]
- [Goldmark](https://github.com/yuin/goldmark/): CommonMark compliant
- Kramdown: [Website](https://kramdown.gettalong.org/) | [Documentation](https://kramdown.gettalong.org/documentation.html) | [Quick reference](https://kramdown.gettalong.org/quickref.html) | [Github](https://github.com/gettalong/kramdown)

Parsers/processors

- [remarkable](https://github.com/jonschlinkert/remarkable)
    > Markdown parser, done right. Commonmark support, extensions, syntax plugins, high speed - all in one. Gulp and metalsmith plugins available. Used by Facebook, Docusaurus and many others! Use [https://github.com/breakdance/breakdance](https://github.com/breakdance/breakdance) for HTML-to-markdown conversion. Use [https://github.com/jonschlinkert/markdown-toc](https://github.com/jonschlinkert/markdown-toc) to generate a table of contents.

References

- [MkDocs-Material: Markdown Extensions](https://squidfunk.github.io/mkdocs-material/setup/extensions/?h=exten)

Discussion

- [Blank lines before lists, revisited](https://talk.commonmark.org/t/blank-lines-before-lists-revisited/1990/5)


### CommonMark

[Website](http://commonmark.org/) | [Specification](https://spec.commonmark.org/0.30/) | [Forum](https://talk.commonmark.org/) | [Tutorial](https://commonmark.org/help/tutorial/)

[[Pandoc]] developer John MacFarlane is one of the founders and maintainers. Used by [[obsidian/Obsidian]].


### Linting and Style

⚠ Linting Markdown satisfyingly, including the front matter, is a pile of wank. Tons of packages and giant mess.

- [[markdownlint]]
    - markdownlint-cli: CLI  for markdownlint with fixing capabilities
    - markdownlint-cli2: CLI  for markdownlint with fixing capabilities
- [[prettier]]
- [[mdformat]]
    - [mdformat-toc](https://github.com/hukkin/mdformat-toc): Mdformat plugin to generate a table of contents (last commit 2022)
    - [mdformat-frontmatter]

Front matter

| Package | Description | Language |
| ---- | ---- | ---- |
| [mdformat-frontmatter] |  |  |
| [[dev/YAML#Linting\|YAML > Linting]] (no fixing) | ignores body, treating everything between `---` as YAML (except code blocks with `---`) |  |
| [remark-lint-frontmatter-schema](https://github.com/JulianCataldo/remark-lint-frontmatter-schema) | from JavaScript and VSCode ecosystems 🤮 Didn't get it to run, some shit about [pnpm](javascript#pnpm) failing to install crap after moving tons of [npm](javascript#npm)-installed packages into the void ✨ | JavaScript |
| [yaml-fm-lint](https://github.com/leneti/yaml-fm-lint) | "A NodeJS script, which extracts yaml front matter from markdown files and lints the extracted data" |  |
| [spatie/yaml-front-matter](https://github.com/spatie/yaml-front-matter) | "A to the point yaml front matter parser" | PHP |
| [YAML linters](dev/YAML#Linting) | YAML only (extract and pass front matter manually) |  |

All of these seem to fail on ill-formatted [[public/tech/dev/YAML#^7903df|YAML block scalars]]. If the content is under-indented they just die on a missing colon 🤦‍♂

## Presentations

### reveal.js

See notes on [[Pandoc]] and [[revealjs|reveal.js]].


## References

- [Cheatsheet markdown-here]

[Cheatsheet jonschlinkert]: <https://gist.github.com/jonschlinkert/5854601>
[Cheatsheet markdown-here]: <https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet>
[markdownguide.org]: <https://www.markdownguide.org>
[Wiki-links]: <https://python-markdown.github.io/extensions/wikilinks/>
[mdformat-frontmatter]: <https://github.com/butler54/mdformat-frontmatter>
[MyST]: <https://myst-parser.readthedocs.io/en/latest/index.html>
