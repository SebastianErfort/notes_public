# Plugins & Extensions

### Community

- Editing
    - [vimrc support for VIM editing mode](obsidian://show-plugin?id=obsidian-vimrc-support)
    - [obsidian-markdown-formatting-assistant-plugin](https://github.com/Reocin/obsidian-markdown-formatting-assistant-plugin)
    - [obsidian-linter] ^f0ca06
        - [Blog obsidian.rocks: Obsidian Linter](https://obsidian.rocks/automate-your-notes-with-obsidian-linter/)
- Functionality/UX
    - [Obsidian Advanced URI](https://vinzent03.github.io/obsidian-advanced-uri/)
    - [Query Control](https://github.com/nothingislost/obsidian-query-control): add controls to embedded queries (exp./deprec.?)
    - [Embed Code File](https://github.com/almariah/embed-code-file): embed code files from Obsidian vault or remote file (eg., GitHub)
    - [breadcrumbs](https://github.com/SkepticMystic/breadcrumbs): [GitHub](https://github.com/SkepticMystic/breadcrumbs) "Visualise a custom hierarchy in your Obsidian vault"
    - Markdown Attributes: use widely used[^mkdocs-attrlist] syntax with curly braces `{}` to add (HTML) attributes to Markdown elements (development currently down to maintenance mode).
        > [!idea] this should make it possible to give elements a certain HTML id and link to them. Hasn't worked in my test though.

    - Supercharged links: add attributes to internal links using the target file's properties, e.g. a certain icon if the linked note if of a specific type
- Appearance/UI
    - [obsidian-emoji-toolbar](https://github.com/oliveryh/obsidian-emoji-toolbar)
    - [Obsidian-Code-Styler](https://github.com/mayurankv/Obsidian-Code-Styler): styling codeblocks and inline code
    - [obsidian-banners](https://github.com/noatpad/obsidian-banners): adds banners to your notes
    - [obsidian_supercharged_links](https://github.com/mdelobelle/obsidian_supercharged_links): "obsidian plugin to add attributes and context menu options to internal links"
- Productivity
    - [Kanban](https://github.com/mgmeyers/obsidian-kanban)
- Writing
    - [Article LaTeX-like figures and section referencing](https://www.reddit.com/r/ObsidianMD/comments/10lp7e0/latexlike_figures_and_section_referencing_in/):
      similar to [[Pandoc#pandoc-crossref|pandoc-crossref]] like `![your nice caption](your_img_path.png){#fig:your_fig_name}`

```dataview
TABLE WITHOUT ID
file.link AS "Plugin",
desc-short AS "Description"
WHERE contains(file.path,"obsidian/plugins")
SORT file.name
```