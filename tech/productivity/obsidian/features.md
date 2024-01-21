---
tags:
  - Obsidian
visibility: public
title: Features
---
| Resource | References |  |
| ---- | ---- | ---- |
| Obsidian | [[obsidian/Obsidian | My notes on Obsidian]], [Template/sample vault](https://gitlab.com/treetanium1/resources/obsidian/obsidian-template) |
| Related | [[Markdown]] |  |

## Writing: Markdown Editor

- editing mode: WYSISYG Markdown rendered
- [Markdown flavour](https://help.obsidian.md/Editing+and+formatting/Obsidian+Flavored+Markdown): mostly [[writing/Markdown#CommonMark|CommonMark]], some custom features, a lot of HTML supported
- file preview on <kbd>ctrl+mouse hover</kbd>
- Spellcheck (multiple languages/dictionaries)
- [Canvas](https://obsidian.md/canvas): freely arrange notes and other content on a workspace
- Templates: select folder in settings, supports variables
- VIM editor mode (many commands supported besides e.g. buffer interaction)

### Links

Link types

- regular Markdown links: `[link text](URI)`
    - Link with separate definition (only reading mode, URL has to be valid format, else it won't be rendered)
    
      ```markdown
      [Link text][link-key]
    
      [link-key]: URL
      ```
   
- Wiki-Links: `[[file name|link text]]` ^cecfe6
- HTML links using the anchor tag: `<a href="URI">link text</a>` ^html-link

How to use

- Link specific heading: `[[filename#heading|link text]]`
- Link specific block/paragraph: `[[filename^block-id|link text]]` where Obsidian automatically creates a block-id for you, e.g. `^a8575e`, or you can create them yourself
- links with spaces: in HTML spaces have to be escaped with the special entity `%20`, but you can use `<>` to avoid this: `[link text](URI)`
- Obsidian URIs: `obsidian://vault/vault_name/path/to/file` ^a45f2b
    - start with `vault/` to specify a (different) vault
    - omit vault, don't specify full path `<a href="obsidian://vault//note#heading">item</a>`
    - some websites won't let one enter non-HTTP(S) URIs, so a work-around is to have a webserver run that parses the Obsidian-URI part, allowing one to open Obsidian. Use for example [x-redirect on GitHub](https://github.com/ewerx/x-redirect/).

> [!tip] Compatibility
> Wiki-links are a Markdown extension, albeit widely supported one. To ensure portability it's better to use standard Markdown links `[]()`. Obsidian has a setting to automatically convert Wiki-links to Markdown links.
> Another case where Wiki-links are unsuitable is in tables, if you want to use `|` to specify a link text. This (currently) is interpreted as a column separator and doesn't render properly. Use Markdown or HTML links to work around this.

### Images

- Markdown: ![tux|20](tux.png)
- Obsidian/Wiki: ![[tux.png|20]]
- HTML: requires `file://...` URL, can't use just (relative) file path, absolute path required (I swear just using `file://path/to/file` worked sometime, relative to the user's home directory)
<img src="file://.../journal/personal/tux.png" width="20">

Using CSS snippets, the alt text can be overloaded to modify image properties.[^center_images]

For example center images, see `image_center.css` in snippets folder. Usage:

![tux | center | 20](tux.png)

HTML figure: offers caption, contents and caption can be centered (not working in reader mode)

<figure style="text-align: center;">

  <img src="https://cdn.pixabay.com/photo/2023/11/22/15/20/books-8405721_1280.jpg"  width="400" style="align: center;">

  <figcaption><a class="external-link" href="https://pixabay.com/photos/books-leather-old-antique-binding-8405721/">Leather-bound Books (Joa 70 via Pixabay)</a></figcaption>
</figure>

### Code Blocks

[Obsidian Help: Code Blocks](https://help.obsidian.md/Editing+and+formatting/Basic+formatting+syntax#Code+blocks)
> Obsidian uses Prism for syntax highlighting. For more information, refer to [Supported languages](https://prismjs.com/#supported-languages).

### Footnotes

[Obsidian Help: Footnotes]

There are several ways to achieve footnotes. Most only render properly in reading mode and all will add a numbered reference with a back-link.

```markdown
The Markdown standard: Kirk to Enterprise![^1]

With a named reference: making it easier to remember[^note]

Or with an inline footnote ^[without a need to specify the text separately]

[^1]: Beam me up, Scotty!
[^note]: who keeps track of the footnote number already in use?
```

The Markdown standard: Kirk to Enterprise![^1]

With a named reference[^note]

Or with an inline footnote ^[without a need to specify the text separately]

[^1]: Beam me up, Scotty!
[^note]: making it easier to remember

[Obsidian Help: Footnotes]: https://help.obsidian.md/Editing+and+formatting/Basic+formatting+syntax#Footnotes


### Markdown Extensions

- embed (parts of) other notes, even paragraphs (automatically creates an label) with interactive auto-completion ^646f6d

```markdown
![[othernote#caption]]
![[othernote^block]]
```

- [call-outs](https://help.obsidian.md/Editing+and+formatting/Callouts#Supported+types)
    > [!idea] Why don't we ...?
- special bullet points for check lists: theme feature, support and meaning varies. If unsupported, items show up as checked. Alternatively use CSS to get this function (see `.obsidian/snippets/checkboxes.css`,[^2] some icons might be difficult to see, depending on theme)
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
- Metadata or YAML frontmatter (used by many softwares)

[^2]: <https://forum.obsidian.md/t/alternative-checkboxes-icon-bullets-copy-and-paste/35962/15>


### Call-outs

See [Obsidian Documentation](https://help.obsidian.md/Editing+and+formatting/Callouts#Supported+types).

Syntax:

```markdown
> [!<type>] <title>
> <content>
```

> [!note] Supported types
> `note` (default if unsupported), `todo`, `success`, `failure`, `danger`, `hint`, `important`, `check`, `done`, `help`, `warning/caution/attention`

`info`
> [!info] Python
> A programming language.

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
> Maybe start by making yourself a coffee.

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

Some themes or CSS snippets add further call-outs.


## Knowledge Management System (KMS)

- search: content across files, search modifiers `file`, `path`, `tag`, `line()`, `section()`, ...
- tags: quick and easy way to set bookmarks #Obsidian
    - YAML frontmatter:

  ```yaml
  ---
  tags: Obsidian
  ---
  ```

- queries

  ```query
  #Obsidian
  ```

- graph view


### Obsidian Canvas

[Obsidian Website: Canvas](https://obsidian.md/canvas)

<iframe name="myIFrame" id="myIFrame" src="https://obsidian.md/images/canvas/canvas-hero.mp4" style="width: 600; height: 400;"></iframe>


## GUI

- left sidebar: files, *search*, favourites
- right sidebar: tags, *file outline*, *links*
- renaming/moving files *updates links automatically*
- flexible split view: horizontal, vertical
- quick commands: `/`
- command palette: <kbd>ctrl+p</kbd>


### Customisation

- themes: Settings > Appearance > Themes
- CSS: snippets to enhance and customise rendering of


## Integration

If sticking to core Markdown, notes can be processed by any other software that parses Markdown.

Most Markdown extensions by Obsidian and its Plugins use syntax that doesn't break rendering of files in other Markdown parsers, but might just render to gibberish. Call-outs for example would just look like odd quotes.


## Plugins

- [[Dataview]]: live index and query engine


## References

[^center_images]: <https://www.reddit.com/r/ObsidianMD/comments/v1fs0f/comment/iamghtr/>
