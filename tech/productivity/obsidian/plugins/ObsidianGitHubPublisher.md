---
title: Obsidian GitHub Publisher
url: "https://obsidian-publisher.netlify.app/"
source: "https://github.com/ObsidianPublisher/obsidian-github-publisher"
type: publishing
category:
  - Obsidian
desc-short: |-
  Github Publisher helps you to publish your notes on a preconfigured GitHub repository, for free, and more!|
  Using MkDocs with Markdown extensions and plugins to render Obsidian features.
summary: Publish your notes in your own GitHub repository for free and do whatever you want with them.
This allows you to set up any template: Jekyll, Mkdocs, Hugo, or custom-made ones!
tags:
  - Obsidian
  - Obsidian/publishing
  - dev/documentation/MkDocs
  - dev/documentation/MkDocs/material
visibility: public
---

# `= this.title`

`= ("[Website](" + this.url + ")")` | `= ("[Source](" + this.source + ")")` | [Template repo]
`= ("> " + this.desc-short)`

## Features

- Wikilinks (`[[Links]]`)
- File transclusion/embed, both wikilinks and Markdown links
- Obsidian callout and custom callout
- Folder notes and their citation
- Custom attributes
- Sharing state and custom folder hierarchy
- Mobile and desktop compatibility
- File mini preview on hover
- Graph view 🎉 (using [Obsidian Tools](https://github.com/mfarragher/obsidiantools))

## MkDocs Template

See also [[tech/documentation/MkDocs|MkDocs]].

Clone [template repo] and configure manually (all `$` variables in `mkdocs.yml`) or use GitHub Action as describe in repo Readme.

Drop notes in directory `docs/`.

Run `mkdocs serve` for local editing or push to repository with [[github#Github Pages|Github Pages]] set up to build pages in a pipeline and publish them to GitHub Pages.

## References

[Template repo]: <https://github.com/ObsidianPublisher/mkdocs-publisher-template>
