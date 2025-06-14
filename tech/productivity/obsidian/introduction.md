---
title: Obsidian - Introduction
aliases:
  - Obsidian - Demo
author: Sebastian Erfort
date: 2024-01-19
related:
  - "[[obsidian_features|Obsidian features]]"
  - "[[obsidian|obsidian]]"
url: "https://obsidian.md/"
docs: "https://help.obsidian.md/Home"
---

# Introduction to Obsidian

| Resource        | References                                                                                                                                                                                                                                                                                                         |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Websites        | [Website], [Documentation] |
| Templates       | [Template vault], [Obsidian Workflow][obsidian-workflow-template] (if you want to organise your entire life) |
| Collections     | [Awesome Obsidian] |
| Linting & Style | [[markdownlint]], [[obsidian.md#^f0ca06\|Obsidian Linter]] |
| My notes        | [Obsidian features](obsidian_features.md), [[obsidian\|Obsidian]] |
| My 🌐notes      | [Obsidian][Notes: Obsidian], [Obsidian features][Note: Obsidian features] |

> [!info] What is Obsidian?
> Mainly, Obsidian is a Markdown editor and viewer. There are plenty of such programs, but Obsidian brings a lot of features that make it a full-fledged Personal Knowledge Management System (PKMS). It emphasises heavily on connecting notes and making these connections visible.
>
> It is not open-source, but only a few secondary features require a subscription and there is a large and active community contributing open-source plugins.


## Getting Started

Download your preferred application type from the Obsidian [Website]. I've been using the [AppImage](https://appimage.org) for a while without problems.

Notes are stored as [[Markdown]] files. Markdown has become very widely used file format for documentation, note-taking and blogging. It is a fairly simple markup language that is very human-readable (clear and structured even without being rendered), yet highly flexible if you want to extend it (supporting [[HTML]] in your notes and [[CSS]] for styling). Obsidian uses the [[CommonMark]] Markdown specification with a few extensions. See section [[#Markdown]] for details.

Obsidian calls a collection of notes a *vault* and this can be any directory on your machine. When you open up the app you get the option to open an existing folder as a vault or create a new one. If you haven't already, you can download my [Obsidian template vault] as an example and to get some more information and resources.

Obsidian stores the vaults configuration in a hidden directory `.obsidian`, mainly in a few JSON files. This makes it easy to transfer your configuration to a different vault and re-use it.

To try the application, start by opening a vault.


## Features

For details, see [[obsidian]] and [[obsidian_features|Obsidian features]]

- [[obsidian_features#Obsidian Canvas|Canvas]]: workspace to collect and connect notes, media, documents and more

### User Interface

By default, Obsidian's interface consists of a few panels with some tabs or functions to chose from. The left sidebar gives you an overview of the files in your vault, a search function and a bookmarks tab.

The pane to the right will show you open files, with tabs at the top if you have multiple files open.

The right sidebar is collapsed to start off with.  Here you can find functions to help you organise and connect your notes. Links to and from your note (outgoing and back-links), [[#tags]] used throughout your vault and an outline of your current note (headings).

> [!example]- Video
> ![[obsidian_default_application.mp4]]

Obsidian has a very free split view, letting you open as many vertical and horizontal panes as you could possible want. Open a new split by either right-clicking on a tab, using a keyboard shortcut or by dragging and dropping tabs. Actually, all tool tabs such as the files, bookmarks, etc. tabs behave like tabs and can be freely placed to adjust the app interface to your preferences.

> [!example]- Video
> ![[obsidian_customise_ui.mkv]]

The user interface can be customised with community-made themes (Settings: Appearance > Themes) and [[#plugins]] as well as [[#CSS Snippets]]. I have been using the theme [Catpuccin] for a while as I like its look out-of-the-box. I am using only a few CSS snippets, see `.obsidian/css-snippets`.

To summarise and extend upon this, Obsidian offers

![[obsidian_features#GUI]]


### Keyboard Shortcuts

A lot of shortcuts are similar to other programs, such as <kbd>ctrl+n</kbd> to create a new file. Try it, they're very intuitive.

| Shortcut | Description |
| ---- | ---- |
| <kbd>ctrl+p</kbd> | command palette: access most functions, from moving a file to templates |
| <kbd>ctrl+,</kbd> | open settings |
| <kbd>ctrl+shift+f</kbd> | search vault |
| <kbd>ctrl+l</kbd> | create a check list item and toggle checked |
| <kbd>ctrl+enter</kbd> | open link under cursor in new tab |


### Search and Queries
 
 ![[obsidian#Search and Queries|Obsidian]]


## Writing

For a mostly complete demo of the Markdown available in Obsidian, see [[markdown_benchmark|Markdown benchmark]].

See also [[obsidian_features|Obsidian features]]

- [[obsidian_features#Code Blocks|code blocks]]
- [[obsidian_features#Footnotes|footnotes]]
- [[obsidian_features#Call-outs|Call-outs]]: colourful boxes to highlight content, can collapse/expand
- [[obsidian_features#Knowledge Management System (KMS)|Knowledge Management]]: **tags**, search and queries (extended)

### Links and Images

See also [[obsidian_features#Links|Obsidian features: links]] and [[obsidian_features#Images|Obsidian features: images]] for more details.

Links are an essential feature for any personal knowledge management system, allowing you to create important connections and helping to make information findable.

Ways to create a link

- classic Markdown link: `[link title](path/to/note "link text")`
- **Wiki-links** (Markdown extension): `[[path/to/note|link title]]`
  Using these type of links, Obsidian will give you auto completion suggestions, making linking significantly easier.

What to keep in mind

- With Obsidian you don't have to enter a full path to a file, the shortest unambiguous (e.g. files with same name) path is sufficient.
- A common Markdown (and HTML) feature is linking to a specific section. This can be done by adding `#Heading title` to your link, e.g. `[[obsidian/features#Links|Obsidian features: links]]` or `[Obsidian features: links](obsidian/features#Links)`

You can embed an image and even videos and other notes, by adding an exclamation mark before a link, e.g. `![[tux.png]]`. Images can be scaled by specifying a size (in pixels) like

```markdown
![](tux.png)
<!-- or (this is a (HTML) comment) -->
![[tux.png|20]]
```

For example
![|20](Tux_simple_bw.svg)
or
![[Tux_simple_bw.svg|20]]

## Plugins

### [[Dataview]]

[[Dataview]] is one of the most widely used plugins for Obsidian. It lets you use your notes' meta data from the front matter,[^young] or defined in-line, to create (task) lists, tables and more. This can be immensely helpful to collect information from various notes and display them in another note in various ways.

## References

- [Awesome Obsidian]
- [Griffin - Obsidian Basics][griffin]

[Website]: <https://obsidian.md/>
[Documentation]: <https://help.obsidian.md/Home>
[Awesome Obsidian]: <https://gitlab.com/treetanium1/resources/obsidian/obsidian-template>
[obsidian-linter]: <https://github.com/platers/obsidian-linter>
[griffin]:  <https://rossgriffin.com/tutorials/obsidian-basics-guide/> "Griffin - Obsidian Basics"
[^griffin]:  [griffin]
[^young]: <https://demo-obsidian.owenyoung.com/Advanced%20topics/YAML%20front%20matter/> Young, YAML front matter
[^mkdocs-attrlist]: e.g. in Python-Markdown extension `attr_list`
[Notes: Obsidian]: <https://sebastianerfort.github.io/notes/seb_pub/tech/productivity/Obsidian/Obsidian/>
[Notes: Obsidian features]: <https://sebastianerfort.github.io/notes/seb_pub/tech/productivity/Obsidian/features/>
[Template vault]: <https://gitlab.com/treetanium1/resources/obsidian/obsidian-template>
[obsidian-workflow-template]: <https://github.com/mathisgauthey/obsidian-workflow-template>
