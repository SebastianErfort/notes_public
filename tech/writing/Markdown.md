---
url: "https://daringfireball.net/projects/markdown/"
visibility: public
---
## References
- [Cheat Markdown cheatsheet](file://.config/cheat/cheatsheets/personal/markdown)
- [Markdown Cheatsheet AdamP@MarkdownHere](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- https://www.markdownguide.org/
  - [Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)
- [[YAML]]


# Tools & Software
```dataview
TABLE WITHOUT ID
  file.link AS "Name",
  desc-short AS "Description"
WHERE type = "software" AND category = "markdown"
SORT title
```

# Snippets
[Snippets folder](file://src)

## Tables

| Item | Price | # In stock |
|--------------|:-----:|-----------:|
| Juicy Apples | 1.99 | 739 |
| Bananas | 1.89 | 6 |
- use `|` for columns (and vertical lines), `-` for rows and horizontal lines
- leading and closing `|` can be omitted (in some Markdown implementations?)
- use `:` for alignment

## Footnotes
Example [^1]
[^1]: Footnote text

## Code blocks
[_List of Markdown code block languages_](https://markdown.land/markdown-code-block)
![[list_markdown_codeblock_languages.txt]]

## Columns

Two fixed-width columns
<div style="display: flex; justify-content: space-between; width: 100%">
<div style="width: 45%">
Column 1
</div>
<div style="width: 45%">
Column 2
</div>
</div>

## Custom CSS

<!-- Doesn't work atm
Font Awesome icons: include relevant `.css` files, then use HTML
<i class="fa-brands fa-linux"></i> -->


# [[mermaid| Graphs: Mermaid]]

# Flavours, Specifications and Implementations

- Python-Markdown: Python implementation of [John Gruber’s Markdown](https://daringfireball.net/projects/markdown/)
- [Goldmark](https://github.com/yuin/goldmark/): CommonMark compliant
- Kramdown: [Website](https://kramdown.gettalong.org/) | [Documentation](https://kramdown.gettalong.org/documentation.html) | [Quick reference](https://kramdown.gettalong.org/quickref.html) | [Github](https://github.com/gettalong/kramdown)
- [GitLab Flavored Markdown (GLFM)](https://docs.gitlab.com/ee/user/markdown.html)
- [GitHub Markdown Specs](https://github.github.com/gfm/)

Discussion
- [Blank lines before lists, revisited](https://talk.commonmark.org/t/blank-lines-before-lists-revisited/1990/5)

## [CommonMark](http://commonmark.org/)
used by [[Obsidian]], [[Pandoc]] mastermind John MacFarlane is one of the founders and maintainers
[Specification](https://spec.commonmark.org/0.30/) | [Forum](https://talk.commonmark.org/) | [Tutorial](https://commonmark.org/help/tutorial/)


# Presentations

## LaTeX Beamer

## reveal.js
See [[personal/tech/software/Software#Pandoc|Software: Pandoc]] and [[personal/tech/software/Software#reveal.js|Software: reveal.js]]
