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
category:
  - markdown/editor
  - markdown/reader
desc-short: |
  Obsidian is the private and flexible note‑taking app that adapts to the way you think.
visibility: public
up:
  - "[[Markdown]]"
---

# Obsidian


> [!warning] Obsidian is not open-source, but there seems to be a pretty large community of users who would boycott it if they decided to charge money. See [[#Alternatives]] if you want to consider a different software, I have yet to explore them. For now I'd try not to rely too much on Markdown extensions and fancy features to be future-proof in case of a migration.

| Resource    | References                                                                                                                                                                           |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Websites | `= ("[Website](" + this.url + ")")`, `= ("[Documentation](" + this.docs + ")")` |
| Collections | [Awesome Obsidian]                                                                                                                                                                   |
| Linting & Style | [[markdownlint]], [Obsidian Linter](obsidian.md#^f0ca06) |
| My 🌐 stuff | [Notes](https://sebastianerfort.github.io/notes/seb_pub/tech/productivity/Obsidian/Obsidian/) (using [[public/tech/documentation/MkDocs]]), [Obsidian Features](https://sebastianerfort.github.io/notes/seb_pub/tech/productivity/Obsidian/features/), [Template vault](https://gitlab.com/treetanium1/resources/obsidian/obsidian-template) |
| My notes | `=(join(this.related, ", "))` |

> [!todo] add map of content

MoC

- [[#Config & Customisation]]
- [[#Plugins & Extensions]]

## Config & Customisation

> [!tip] Development tools: HTML elements, CSS classes, etc.:  <kbd>ctrl + shit + i</kbd>

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

Browse Appearance > Themes, there's a lot of community-made choices.

I use **Catppuccin** because of aesthetics and different colours for italic/bold text, internal/external links, etc.

### Styling (CSS)

Further customisation and extension can be done using [[CSS]].

- [Obsidian docs: CSS > styling](https://docs.obsidian.md/Reference/CSS+variables/About+styling)

Obsidian supports a snippets folder for custom CSS files that can be activated separately.

- [awesome-obsidian: css-snippets](https://github.com/kmaasrud/awesome-obsidian#css-snippets)
- [obsidian-css-snippets @GitHub](https://github.com/Dmytro-Shulha/obsidian-css-snippets/tree/develop)
- [Common Selectors for Custom CSS @Obsidian Forum](https://forum.obsidian.md/t/common-selectors-for-custom-css/1984/2)
- [Meta Post - Common CSS Hacks @Obsidian Forum](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978)
    - [Add quotation mark before quote](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978/39)
    - [“Naked” Embeds](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978/19)

The two main selectors to distinguish between editing and reading mode are `.markdown-preview-view` and `.markdown-rendered`.

#### Custom

CSS snippet `callouts.css`:

`myidea`
> [!myidea] Epiphany!
> Immediately write this down!

`mywarning`
> [!mywarning] Warning!
> Don't ever do this! Don't ever do this!

`event`
> [!event] Save the date
> Don't miss out!

Custom call-out: add CSS to [`.obsidian/snippets/callouts.css`](file://rsrc/obsidian/css-snippets/callouts.css).

```css
.callout[data-callout="idea"] {
    --callout-color: 255, 255, 0;
    --callout-icon: lightbulb;
}
```

More CSS snippets

- [dashboard++] ^e626d8
- [Pretty Tables][css-pretty-tables]
- Canvas
    - [Canvas cards image](https://www.reddit.com/r/ObsidianMD/comments/11n389p/i_made_a_css_snippet_to_give_your_canvas_cards_a/)
    - [Export Canvas to HTML (barely more helpful than an image file)](https://forum.obsidian.md/t/exporting-canvas-to-html-and-pdf/60331)

### Search and Queries

[Obsidian Help](https://help.obsidian.md/Plugins/Search)

- regex search, e.g. `/\d{4}-\d{2}-\d{2}/`
- [search operators](https://help.obsidian.md/Plugins/Search#Search+operators)

Queries allow to embed a search in your notes, rendering the results as a part of them

Example:

<pre><code>```query
Tags: #idea
```</code></pre>

### Properties: Front Matter and Meta Data

Obsidian started using the term *properties* for what many other applications call the *front matter*. This is a special file header, usually in the language [[YAML]], where meta data for a note can be stored.

By default Obsidian supports the following YAML in this order[^griffin]

1. title
1. alias(es)
1. tags
1. cssclass

You are can add more YAML metadata but it’s not natively processed by Obsidian. However, this can still be useful if you’re using plugins like [[DataView]] or other programs like [[Pandoc]].[^young]


## [[HTML]]

Since Markdown supports usage of most HTML, this can be used to extend the features of plain Markdown. Mixing is not a good idea though and renders in weird ways.

## Integration

- Zotero
    - <https://forum.obsidian.md/t/zotero-best-practices/164/57>

#### Optical Character Recognition ([[ocr]])

This would allow integration of hand-written notes.

See this [[Templater#^d366ca|gist]] and [plugin/feature request](https://forum.obsidian.md/t/searchable-ocr-lets-get-it-built/28968).


# Plugins & Extensions

![[obsidian-plugins]]


## Workflow

References

- [obsidian-workflow-template]
  > Obsidian vault template from workflow with tasks and project management, journaling, media tracking, offline read-it-later and bookmark management, note-taking and note-sharing on own website


## Tools

- [obsidiantools](https://github.com/mfarragher/obsidiantools): Python package for analysing an Obsidian.md vault
    - connections with meta data
    - network, graph, (back) links


## Alternatives

- Zettelkasten
- Telekasten: Neovim plugin for Zettelkasten/Wiki/journal
- Roam Research
- [[foam]]
- [[zk]] (more of a helper, *not an editor*)
- [[Emanote]]


## Publish

- [[ObsidianGitHubPublisher|Obsidian GitHub Publisher]]: straight from Obsidian, but with limited customisability
- [[git/GitLab#GitLab Pages|GitLab Pages]]: anything that renders Markdown to HTML, such as static website generatores ([[_hugo]], [[Jekyll]], etc.) can be used to build pages and the resulting HTML files can be deployed to (GitLab) Pages as a simple static website.
    - [blog post @gitlab.com: Publishing Obsidian notes with GitLab Pages](https://about.gitlab.com/blog/2022/03/15/publishing-obsidian-notes-with-gitlab-pages/)
- [obsidian-webpage-export](https://github.com/KosmosisDire/obsidian-webpage-export)
- [obsidian-publish-mkdocs](https://github.com/jobindjohn/obsidian-publish-mkdocs): A Template to Publish Obsidian/Foam Notes on Github Pages (uses MkDocs)
    - compatibility with Obsidian Markdown and features is work
    - poor tags support (e.g. inline) out-of-the-box
    - sensitive Markdown syntax (e.g. 4 spaces indentation)
- [[Emanote]]: website design is very close to Obsidian's UI with folder-like nesting, tags, etc.
    - clearly render internal, external and broken links
    - Obsidian-style callouts
    - table of contents sidebar
    - backlinks
- [Flowerrshow](https://flowershow.app/) | [GitHub](https://github.com/datopian/obsidian-flowershow): create websites from Markdown. Obsidian syntax compatible, open-source.
- [quartz](https://quartz.jzhao.xyz/) | [Docs](https://github.com/jackyzha0/quartz): [Video @YT][nvdh-quartz]
  > a fast, batteries-included static-site generator that transforms Markdown content into fully functional websites
    - issues
        - No navigation sidebar? How do you get an overview of contents other than manually creating maps of content and using the graph view?

> [!warning] Obsidian plugins (especially [[DataView]])
> So far none of these solutions seem to support Obsidian plugins. Integration of massively helpful plugins such as [[DataView]] would be most excellent.


## References

- [Awesome Obsidian]: resources, plugins, tools, templates, CSS snippets, ...
- [Markdown Guide: Obsidian](https://www.markdownguide.org/tools/obsidian/) ^b8bff2
- Blogs and unofficial guides
    - [Ross Griffin Basics Guide](https://rossgriffin.com/tutorials/obsidian-basics-guide/) | [Demo Owen Young](https://demo-obsidian.owenyoung.com/)
    - [Blog obsidian.rocks](https://obsidian.rocks/)
- [Slides: simple presentations](https://demo-obsidian.owenyoung.com/Plugins/Slides/)
- [Getting comfortable with Obsidian CSS](https://forum.obsidian.md/t/getting-comfortable-with-obsidian-css/133)
- Icons: [[dev/design#Icons|Lucide]]
- [Obsidian Tutorial for Academic Writing][obsidian-academic-writing]
    - Obsidian + Zotero
    - [[Pandoc#pandoc-crossref|pandoc-crossref]]-like references (citations, figures, equations, ...)
- templates
    - [obsidian-starter-templates](https://github.com/masonlr/obsidian-starter-templates)
- Javascript
    - [JS in Obsidian]

[Awesome Obsidian]: <https://gitlab.com/treetanium1/resources/obsidian/obsidian-template>
[obsidian-linter]: <https://github.com/platers/obsidian-linter>
[^griffin]:  <https://rossgriffin.com/tutorials/obsidian-basics-guide/> "Griffin - Obsidian Basics"
[^young]: <https://demo-obsidian.owenyoung.com/Advanced%20topics/YAML%20front%20matter/> "Young - YAML front matter"
[obsidian-workflow-template]: <https://github.com/mathisgauthey/obsidian-workflow-template>
[^mkdocs-attrlist]: e.g. in Python-Markdown extension `attr_list`
[JS in Obsidian]: <https://www.reddit.com/r/ObsidianMD/comments/xal0c7/comment/jccdv0i/>
[nvdh-quartz]: <https://nicolevanderhoeven.com/blog/20240126-how-to-publish-your-notes-for-free-with-quartz/>
[obsidian-academic-writing]: <https://betterhumans.pub/obsidian-tutorial-for-academic-writing-87b038060522>
[dashboard++]: <https://tfthacker.com/DashboardPlusPLus>
[css-pretty-tables]: <https://forum.obsidian.md/t/custom-css-for-tables-5-new-styles-ready-to-use-in-your-notes/17084>
