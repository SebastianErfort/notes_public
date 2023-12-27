---
title: Obsidian
tags:
  - dev/markdown
  - obsidian
author: Sebastian Erfort
url: https://obsidian.md/
docs: https://help.obsidian.md/Home
syntax: markdown
type: software
category: markdown
desc-short: |
  Obsidian is the private and flexible note‑taking app that adapts to the way you think.
visibility: public
related:
  - "[[features]]"
  - "[[docs/seb_public/tech/writing/Markdown|Markdown]]"
  - "[[DataView]]"
---
> [!warning] Obsidian is not open-source, but there seems to be a pretty large community of users who would boycott it if they decided to charge money. See [[#Alternatives]] if you want to consider a different software, I have yet to explore alternatives. For now I'd try not to rely too much on Markdown extensions and fancy features.

# Obsidian

`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")`

| Resource    | References                                                                                                                                                                           |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Collections | [Awesome Obsidian]                                                                                                                                                                   |
| Linting & Style | [[markdownlint]], [Obsidian Linter](Obsidian#^f0ca06) |
| My 🌐 stuff | [Notes](https://sebastianerfort.github.io/notes/seb_pub/tech/productivity/Obsidian/Obsidian/) (using [[MkDocs]]), [Obsidian Features](https://sebastianerfort.github.io/notes/seb_pub/tech/productivity/Obsidian/features/), [Template vault](https://gitlab.com/treetanium1/resources/obsidian/obsidian-template) |
| My notes    | [DataView plugin](DataView), [Markdown](Markdown)                                                                                                                                                                                     |

## Config & Customisation

> [!tip]- [Obsidian URI set up for Linux / obsidian.desktop](https://forum.obsidian.md/t/obsidian-uri-set-up-for-linux-obsidian-desktop/7494) (see also [[linux#Desktop files|Desktop Files]])
> Create `desktop`file `$HOME/.local/share/applications/obsidian.desktop`
>
> ```ini
> [Desktop Entry]
> Name=Obsidian
> Exec=obsidian %u
> Terminal=false
> Type=Application
> Icon=/home/me/.local/bin/obsidian.png
> StartupWMClass=obsidian
> Comment=Obsidian
> Categories=Office;
> MimeType=text/html;x-scheme-handler/obsidian;
> ```

### Themes

- Anapuccin
- **Catpuccin**: current theme bc. of aesthetics and different colours for italic, bold, etc. text
- [CyberGlow](https://github.com/ArtexJay/Obsidian-CyberGlow)
- [Primary](https://github.com/ceciliamay/obsidianmd-theme-primary)
- [_Prism_](https://github.com/damiankorcz/Prism-Theme): very pretty with different light/dark versions, __but__ requires a community plugin for additional styling of the UI

### [[CSS]]

- [awesome-obsidian: css-snippets](https://github.com/kmaasrud/awesome-obsidian#css-snippets)
- [obsidian-css-snippets @GitHub](https://github.com/Dmytro-Shulha/obsidian-css-snippets/tree/develop)
- [Common Selectors for Custom CSS @Obsidian Forum](https://forum.obsidian.md/t/common-selectors-for-custom-css/1984/2)
- [Meta Post - Common CSS Hacks @Obsidian Forum](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978)
    - [Add quotation mark before quote](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978/39)
    - [“Naked” Embeds](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978/19)

## Features

See [[features|summary of Obsidian features]] and [[docs/seb_public/tech/writing/Markdown|Markdown]].


#### Custom

see CSS snippet `callouts.css`

`myidea`
> [!myidea] Epiphany!
> Immediately write this down!

`mywarning`
> [!mywarning] Warning!
> Don't ever do this! Don't ever do this!

`event`
> [!event] Save the date
> Don't miss out!

Custom call-out: add CSS to `.obsidian/snippets` with

```css
.callout[data-callout="idea"] {
    --callout-color: 255, 255, 0;
    --callout-icon: lightbulb;
}
```

See [CSS snippet file](file:///home/erfort/notes/life/.obsidian/snippets/callouts.css)

### Search

[Obsidian Help](https://help.obsidian.md/Plugins/Search)

- regex search, e.g. `/\d{4}-\d{2}-\d{2}/`
- [search operators](https://help.obsidian.md/Plugins/Search#Search+operators)

### Queries

```query
##idea
```

These are {{author}}'s notes from {{date}}.

### Metadata, YAML Frontmatter

From <https://rossgriffin.com/tutorials/obsidian-basics-guide/>
By default obsidian supports the following YAML in this order:

1. alias
2. tags
3. cssclass

You are can add more YAML metadata but it’s not natively processed by obsidian. However, this can still be useful if you’re using plugins like _Dataview_ or other programs like Pandoc.
See also <https://demo-obsidian.owenyoung.com/Advanced%20topics/YAML%20front%20matter/>

Can be further extended by using the community plugin [[#DataView]].

## [[HTML]]

Since Markdown supports usage of most HTML, this can be used to extend the features of plain Markdown. Mixing is not a good idea though and renders in weird ways.

## Integration

- Zotero
    - <https://forum.obsidian.md/t/zotero-best-practices/164/57>

#### OCR

See this [[Templater#^d366ca|gist]] and [plugin/feature request](https://forum.obsidian.md/t/searchable-ocr-lets-get-it-built/28968)

## Plugins & Extensions

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
- Appearance/UI
    - [obsidian-emoji-toolbar](https://github.com/oliveryh/obsidian-emoji-toolbar)
    - [Obsidian-Code-Styler](https://github.com/mayurankv/Obsidian-Code-Styler): A plugin for Obsidian.md for styling codeblocks and inline code
- Productivity
    - [Kanban](https://github.com/mgmeyers/obsidian-kanban)
- Writing
    - [Article LaTeX-like figures and section referencing](https://www.reddit.com/r/ObsidianMD/comments/10lp7e0/latexlike_figures_and_section_referencing_in/):
      similar to [[Pandoc#pandoc-crossref|pandoc-crossref]] like

      ```markdown
        ![your nice caption](your_img_path.png){#fig:your_fig_name}
        ```

        [Step-by-step-guide](https://betterhumans.pub/obsidian-tutorial-for-academic-writing-87b038060522)

```dataview
TABLE WITHOUT ID
  file.link AS "Plugin",
  (join(file.tags)) AS "Tags"
WHERE contains(file.path,"tech/Obsidian/plugins")
SORT file.name
```


## Alternatives

- Zettelkasten
- Telekasten: Neovim plugin for Zettelkasten/Wiki/journal
- Roam Research
- [[foam]]

## Publish

- [[rug/lwp/GitLab#GitLab Pages|GitLab Pages]]: <https://about.gitlab.com/blog/2022/03/15/publishing-obsidian-notes-with-gitlab-pages/>
- https://flowershow.app/ | [GitHub](https://github.com/datopian/obsidian-flowershow)
- [[ObsidianGitHubPublisher|Obsidian GitHub Publisher]]
- [obsidian-webpage-export](https://github.com/KosmosisDire/obsidian-webpage-export)
- [obsidian-publish-mkdocs](https://github.com/jobindjohn/obsidian-publish-mkdocs): A Template to Publish Obsidian/Foam Notes on Github Pages (uses MkDocs)


## Debug

- development tools: <kbd>ctrl + shit + i</kbd>


## References

- [Awesome Obsidian](https://github.com/kmaasrud/awesome-obsidian): resources, plugins, tools, templates, CSS snippets, ...
- [Markdown Guide: Obsidian](https://www.markdownguide.org/tools/obsidian/) ^b8bff2
- Blogs and unofficial guides
    - [Ross Griffin Basics Guide](https://rossgriffin.com/tutorials/obsidian-basics-guide/) | [Demo Owen Young](https://demo-obsidian.owenyoung.com/)
    - [Blog obsidian.rocks](https://obsidian.rocks/)
- [Slides: simple presentations](https://demo-obsidian.owenyoung.com/Plugins/Slides/)
- [Getting comfortable with Obsidian CSS](https://forum.obsidian.md/t/getting-comfortable-with-obsidian-css/133)
- Icons: [[dev#Icons|Lucide]]
- [Obsidian Tutorial for Academic Writing](https://betterhumans.pub/obsidian-tutorial-for-academic-writing-87b038060522)
    - Obsidian + Zotero
    - [[Pandoc#pandoc-crossref|pandoc-crossref]]-like references (citations, figures, equations, ...)

[Awesome Obsidian]: <https://gitlab.com/treetanium1/resources/obsidian/obsidian-template>
[obsidian-linter]: <https://github.com/platers/obsidian-linter>
