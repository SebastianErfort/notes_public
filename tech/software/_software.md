---
title: Software
visibility: public
---
> [!todo] clean up this mess

# Package Repositories and Managers

## npm

Node Package Manager (npm) is the most common javascript package manager

```bash
npm i[nstall] [-g]
npm rm [-g]
npm list [-g] # list installed package(s) with version and dependencies
# Flags:
#   -g    global (root)
```

# Linux

- Okular
    - display (e)ps files: install `libspectre`
- Imagemagick (`convert`): [Command Line Options](https://imagemagick.org/script/command-line-options.php) | [Security Policy](https://imagemagick.org/script/security-policy.php)

    ```bash
    convert -list font # list available fonts (names might differ from other sources, so check these)
    # Draw text on image at 75% height (-25% from center)
    local height=$(identify -format %h $bgimage)
    convert -fill $color -pointsize $(( height/25 )) -gravity center -font "DejaVu-Sans"\
      -draw "text 0,$(( -height/4 )) '${message}'" \
      "$bgimage" "image.png" >/dev/null

    ```

- [GNU parallel](https://www.gnu.org/software/parallel/): shell tool for executing jobs in parallel using one or more computers

# Browsers

## Firefox

- [Cookies permission button not working](https://support.mozilla.org/en-US/questions/1249232)

# Writing and Productivity

- [[Pandoc]]
- [[Zettlr]]
- [[Zapier]]

# Dev

## Command Line

# dev/terminal #dev/commandline

### Charm

[charm](https://charm.sh/): glamorous command line tools ^247416

- [[glow]]: Render markdown on the CLI, with pizzazz! 💅
    - [lipgloss](https://github.com/charmbracelet/lipgloss): Style definitions for nice terminal layouts. Built with TUIs in mind. ![|150](https://camo.githubusercontent.com/5ed63e6b61ddcea9575c0b0eefd373c8f085f4594e323fe60c39ce3bbcc27d81/68747470733a2f2f73747566662e636861726d2e73682f6c6970676c6f73732f6c6970676c6f73732d6578616d706c652e706e67)
    - [log](https://github.com/charmbracelet/log): A minimal and colorful Go logging library. ![wood|20](https://github.githubassets.com/images/icons/emoji/unicode/1fab5.png) #dev/go ![|300](https://github.com/charmbracelet/log/raw/main/demo.gif)
    - [VHS](https://github.com/charmbracelet/vhs): Write terminal VGIFs as code for integration testing and demoing your CLI tools. #sw/record
        ![|300](https://camo.githubusercontent.com/1f2b0c758369c054538b7881b5d700739f2c37d2201f60ea26ad9311a7f88487/68747470733a2f2f73747566662e636861726d2e73682f7668732f6578616d706c65732f6e656f66657463685f332e676966)
        Commands are typed into script, that is then executed, emulating key strokes with delays etc. Doesn't actually record one typing.
    - [terminalizer](https://terminalizer.com) | [source](https://github.com/faressoft/terminalizer): Record your terminal and generate animated gif images or share a web player link
        Actually records (mis-)typing etc.
    - [Bubble Tea](https://github.com/charmbracelet/bubbletea)
        - [Bubbles](https://github.com/charmbracelet/bubbles): TUI components for Bubble Tea
    - Tutorials
        - [wizard tutorial using Bubble Tea and Lip Gloss](https://github.com/charmbracelet/wizard-tutorial)

# Backup, file-transfer, synchronisation

- Unison: [Wiki](https://en.wikipedia.org/wiki/Unison_(software))
- Borg: [Website](https://www.borgbackup.org/) | [Github](https://github.com/borgbackup/borg)
    Deduplicating archiver with compression and encryption, supports remote locations (SSH)

# Science

## Bibliography

### Zotero

#### Plugins

- Mdnotes: [Website](https://argentinaos.com/zotero-mdnotes/docs/quick-start-guide/) | [Github](https://github.com/argenos/zotero-mdnotes) | [Obsidian forum](https://forum.obsidian.md/t/zotero-plugin-to-export-metadata-and-notes-to-markdown/3781)
    export item metadata and notes as markdown files

## Maths

[SymPy](https://www.sympy.org/en/index.html): A computer algebra system written in pure Python


# Organisation and Management

## Events

- [indico](https://getindico.io/): The effortless open-source tool for event organisation, archival and collaboration. Developed and used by [[CERN]], also used by United Nations.


# Finance

- [Skrooge](https://skrooge.org/): manage your personal finances, powered by [KDE](http://www.kde.org)

# Presentations and Slide Shows

- [[revealjs]]

# Communication

[alternative.to: 25 programs](https://alternativeto.net/software/matrix-org/)

```dataview
LIST WITHOUT ID
( "[[" + title + "]]")
WHERE category = "communication"
```
