---
title: Obsidian
tags:
  - dev/markdown
  - obsidian
author: Sebastian Erfort
url: "https://obsidian.md/"
docs: "https://help.obsidian.md/Home"
syntax: markdown
type: software
category: markdown
desc-short: |
  Obsidian is the private and flexible note‑taking app that adapts to the way you think.
visibility: public
---
> [!warning] Obsidian is not open-source, but there seems to be a pretty large community of users who would boycott it if they decided to charge money. See [[#Alternatives]] if you want to consider a different software, I have yet to explore alternatives. For now I'd try not to rely too much on Markdown extensions and fancy features.

# Obsidian

`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")`

## References

- [Awesome Obsidian](https://github.com/kmaasrud/awesome-obsidian): resources, plugins, tools, templates, CSS snippets, ...
- [[Markdown]]
- [Ross Griffin Basics Guide](https://rossgriffin.com/tutorials/obsidian-basics-guide/) | [Some dude's Wiki](https://demo-obsidian.owenyoung.com/)
- [Slides: simple presentations](https://demo-obsidian.owenyoung.com/Plugins/Slides/)
- [Getting comfortable with Obsidian CSS](https://forum.obsidian.md/t/getting-comfortable-with-obsidian-css/133)
- Icons: [[dev#Icons|Lucide]]

# Documentation

[Obsidian Markdown Support](https://www.markdownguide.org/tools/obsidian/#obsidian-markdown-support)

## Markdown

See also [[Markdown|my notes on Markdown]]

[Markdown Guide: Obsidian](https://www.markdownguide.org/tools/obsidian/) ^b8bff2

# Config & Customisation

[Obsidian URI set up for Linux / obsidian.desktop](https://forum.obsidian.md/t/obsidian-uri-set-up-for-linux-obsidian-desktop/7494)
Create `desktop`file `$HOME/.local/share/applications/obsidian.desktop`

```ini
[Desktop Entry]
Name=Obsidian
Exec=obsidian %u
Terminal=false
Type=Application
Icon=/home/me/.local/bin/obsidian.png
StartupWMClass=obsidian
Comment=Obsidian
Categories=Office;
MimeType=text/html;x-scheme-handler/obsidian;
```

See [[linux#Desktop files|Desktop Files]]

## Themes

- [Primary](https://github.com/ceciliamay/obsidianmd-theme-primary)
- [_Prism_](https://github.com/damiankorcz/Prism-Theme): very pretty with different light/dark versions, __but__ requires a community plugin
- [CyberGlow](https://github.com/ArtexJay/Obsidian-CyberGlow)

## [[CSS]]

- [obsidian-css-snippets @GitHub](https://github.com/Dmytro-Shulha/obsidian-css-snippets/tree/develop)
- [Common Selectors for Custom CSS @Obsidian Forum](https://forum.obsidian.md/t/common-selectors-for-custom-css/1984/2)
- [Meta Post - Common CSS Hacks @Obsidian Forum](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978)
    - [Add quotation mark before quote](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978/39)
    - [“Naked” Embeds](https://forum.obsidian.md/t/meta-post-common-css-hacks/1978/19)

# Features

See also [[features|summary of Obsidian features]]

## Lists

Unordered lists: use `-`, `*`, `+`.

Ordered lists: use `1., 2., ...`  (or just use `1.` for all items, in Reading mode items will be numbered automatically).


### Check-lists

Check-lists: `- [ ]` for unchecked and `- [x]` for checked items

Special bullet points: theme feature, support and meaning varies. If unsupported, items show up as checked. Alternatively use CSS to get this function (see `.obsidian/snippets/checkboxes.css`,[^2] some icons might be difficult to see, depending on theme)

> [!tip]- Alternative Checkboxes
>
> - [ ] Unchecked
> - [x] Checked
> - [>] Rescheduled
> - [<] Scheduled
> - [!] Important
> - [-] Cancelled
> - [/] In Progress
> - [?] Question
> - [*] Star
> - [n] Note
> - [l] Location
> - [i] Information
> - [I] Idea
> - [S] Amount
> - [p] Pro
> - [c] Con
> - [b] Bookmark
> - ["] Quote

[^2]: <https://forum.obsidian.md/t/alternative-checkboxes-icon-bullets-copy-and-paste/35962/15>

Description lists: requires HTML

```html
<dl>
<dt>Item</dt>
<dd>Description</dd>
</dl>
```

## Links

- normal links: `[link text](URL)`
- Wiki-Links: `[[file name|link text]]` ^cecfe6
- Link with separate definition (only reading mode, URL has to be valid format, else it won't be rendered)

  ```markdown
  [Link text][link-key]

  [link-key]: URL
  ```

- Link specific heading: `[[filename#heading|link text]]`
- Link specific block/paragraph: `[[filename^block-id|link text]]` where Obsidian automatically creates a block-id for you
- Avoid having to use `%20` in Links with `<>` escape: `[Text](<file:///path to file.pdf>)`
- Obsidian URLs: `obsidian://vault/vault_name/path/to/file` ^a45f2b
    - start with `vault/` to specify a (different) vault
    - omit vault, don't specify full path `<a href="obsidian://vault//note#heading">item</a>`
    - some websites won't let one enter non-HTTP(S) URIs, so a work-around is to have a webserver run that parses the Obsidian-URI part, allowing one to open Obsidian. See [x-redirect on GitHub](https://github.com/ewerx/x-redirect/)
    > [!idea] put on my website [[sebastianerfort.github.io]] or just in a different repo, that will appear under <https://sebastianerfort.github.io/redirect> anyway

## Images

Markdown: ![tux|100](tux.png)
Obsidian/Wiki: ![[tux.png|100]]
HTML: requires "link", can't use just (relative) file path
<img src="file:///home/erfort/journal/life/tux.png" width="100">

- [centering images](https://www.reddit.com/r/ObsidianMD/comments/v1fs0f/comment/iamghtr/)

## Code Blocks

Obsidian uses Prism.js for syntax highlighting. For available languages see this [list of supported languages](https://prismjs.com/#supported-languages).

## Embed

(parts of) other notes

```markdown
![[othernote#caption]]
![[othernote^block]]
```

^646f6d

## Footnotes

```markdown
This needs explanation ^[Let me spare you the details]
For further reeding ^1

[1]: Let me spare you the details
```

Kirk to Enterprise![^1]

[^1]: Beam me up, Scotty!

## Canvas

[obsidian.md: Canvas](https://obsidian.md/canvas)

## Call-outs

### Supported types

see [Obsidian Documentation](https://help.obsidian.md/Editing+and+formatting/Callouts#Supported+types)

`note` (default if unsupported)
`todo`, `success`, `failure`, `danger`, `hint`, `important`, `check`, `done`, `help`, `warning/caution/attention`, ``

`info`
> [!info] Python
> Is a programming language.

`tip`
> [!tip]- Call-outs can fold!
> Just add a `-` to the call-out specifier

`idea`
> [!idea]- Epiphany!
> Immediately write this down!

`important`
> [!important]- NOTE!!!11

`todo`
> [!todo]- You shouldn't leave this until last minute!
> Maybe start by making youself a coffee.

`warning`, `caution`, `attention`
> [!warning]- Warning!
> Don't ever do this! Don't ever do this!

`failure/fail/missing`
> [!fail]- Fail!
> Why'd you think this would ever work?

`error`
> [!error]- Zonk!
> That's even worse!

`danger`
> [!danger] Will Robinson!

`bug`
> [!bug]- How did this ever work?

`check/done`
> [!done]- 't was but a breeze.
> Nfg

`success`
> [!success]- Success!
> It's not all bad always!

`faq/question`
> [!faq]- Will this be helpful?
> You can just hope.

`help`
> [!help]- I need somebody!
> Not just anybody!

`example`
> [!example]- Click for more
> Read some very instructive examples to illustrate this topic.

`hint`
> [!hint]- Look at this
> It'll save you tons of time and effort

`quote/cite`
> [!quote]- Me
> Clothes are for daytime.

### Theme-specific
>
> [!info]- [Theme: Primary](https://github.com/ceciliamay/obsidianmd-theme-primary)
> > [!celebrate] `celebrate/success`  This changes colours! 🤯
> > Let's party!
>
> > [!pro]
> > I think this is a good feature because...
>
> > [!con]
> > This is a bad feature becacuse...
>
> > [!morning]
> > “If you are irritated by every rub, how will your mirror be polished?”  ― Rumi

### Custom

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

## Search

[Obsidian Help](https://help.obsidian.md/Plugins/Search)

- regex search, e.g. `/\d{4}-\d{2}-\d{2}/`
- [search operators](https://help.obsidian.md/Plugins/Search#Search+operators)

## Queries

```query
#idea
```

These are {{author}}'s notes from {{date}}.

## Metadata, YAML Frontmatter

From <https://rossgriffin.com/tutorials/obsidian-basics-guide/>
By default obsidian supports the following YAML in this order:

1. alias
2. tags
3. cssclass
You are able to add more YAML metadata but it’s not natively supported by obsidian. However, this can still be useful if you’re using plugins like _Dataview_ or other programs like Pandoc.
See also <https://demo-obsidian.owenyoung.com/Advanced%20topics/YAML%20front%20matter/>

Can be further extended by using the community plugin [[#DataView]].

# [[HTML]]

Since Markdown supports usage of most HTML, this can be used to extend the features of plain Markdown. Mixing is not a good idea though and renders in weird ways.

# Integration

- Zotero
    - <https://forum.obsidian.md/t/zotero-best-practices/164/57>

### OCR

See this [[Templater#^d366ca|gist]] and [plugin/feature request](https://forum.obsidian.md/t/searchable-ocr-lets-get-it-built/28968)

# Plugins

## Community

- Editing
    - [vimrc support for VIM editing mode](obsidian://show-plugin?id=obsidian-vimrc-support)
    - [obsidian-markdown-formatting-assistant-plugin](https://github.com/Reocin/obsidian-markdown-formatting-assistant-plugin)
- Functionality/UX
    - [Obsidian Advanced URI](https://vinzent03.github.io/obsidian-advanced-uri/)
    - [Query Control](https://github.com/nothingislost/obsidian-query-control): add controls to embedded queries (exp./deprec.?)
- Appearance/UI
    - [obsidian-emoji-toolbar](https://github.com/oliveryh/obsidian-emoji-toolbar)
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

# Alternatives

- Zettelkasten
- Telekasten: Neovim plugin for Zettelkasten/Wiki/journal
- Roam Research
- [[foam]]

# Publish

<<<<<<< HEAD
- [[Gitlab#GitLab Pages|GitLab Pages]]: <https://about.gitlab.com/blog/2022/03/15/publishing-obsidian-notes-with-gitlab-pages/>
- https://flowershow.app/ | [GitHub](https://github.com/datopian/obsidian-flowershow)
- [[ObsidianGitHubPublisher|Obsidian GitHub Publisher]]
- [obsidian-webpage-export](https://github.com/KosmosisDire/obsidian-webpage-export)
- [obsidian-publish-mkdocs](https://github.com/jobindjohn/obsidian-publish-mkdocs): A Template to Publish Obsidian/Foam Notes on Github Pages (uses MkDocs)

# References

[Obsidian Tutorial for Academic Writing](https://betterhumans.pub/obsidian-tutorial-for-academic-writing-87b038060522)

- Obsidian + Zotero
- [[Pandoc#pandoc-crossref|pandoc-crossref]]-like references (citations, figures, equations, ...)
