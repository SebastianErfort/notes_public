---
tags: Obsidian
visibility: public
---
[Template/sample vault]()
See also [[Obsidian|my notes on Obsidian]]

## Markdown editor
- [Markdown flavour](https://help.obsidian.md/Editing+and+formatting/Obsidian+Flavored+Markdown): mostly CommonMark, some custom features, a lot of HTML supported
- editing mode
  - WYSISYG Markdown rendered (or legacy plain editor)
- reading mode
  - prettier rendering, read-only
- embed images, websites/videos/... through HTML `<iframe>`

### Advanced features
- VIM mode (many commands supported besides buffer interaction)
- embed (parts of) other notes, even paragraphs (automatically creates an label) with interactive auto-completion ![[Obsidian#^646f6d]]
- [call-outs](https://help.obsidian.md/Editing+and+formatting/Callouts#Supported+types)
  > [!idea] Why don't we ...?
- Metadata or YAML frontmatter (used by many softwares)
- ![[Obsidian#^a45f2b]]
- file preview on <kbd>ctrl+mouse hover</kbd>
- Spellcheck (multiple dictionaries)
- [Canvas](https://obsidian.md/canvas): freely arrange notes and other content on a workspace
- Templates: select folder in settings, supports variables


## KMS
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


## GUI
- left sidebar: files, *search*, favourites
- right sidebar: tags, *file outline*, *links*
- renaming/moving files *updates links automatically*
- flexible split view: horizontal, vertical
- quick commands: `/`
- command palette: <kbd>ctrl+p</kbd>

### Customisation
- themes: Settings > Appearance > Themes
- CSS: snippets to enhance, customise


## Integration
If sticking to core Markdown notes can be processed by any other software that parses Markdown.


## Plugins

### [[DataView]]