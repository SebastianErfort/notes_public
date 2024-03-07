---
title: Development
tags:
  - dev
visibility: public
related:
  - "[[_software#Dev|Software Dev]]"
  - "[[git/GitLab#CI/CD|GitLab CICD]]"
---
| Resource     | References                    |
| ------------ | ----------------------------- |
| My notes     | `=(join(this.related, ", "))` |
| My resources | [sw project template]()       |

## Command Line

- education
    - [Software Carpentry: The Unix Shell](https://swcarpentry.github.io/shell-novice/index.html) | [![|20](github.png "GitHub logo") GitHub](https://github.com/swcarpentry/shell-novice)

### Software

- [[linux#tmux|Tmux]]
- `screen`
- [reptyr](https://github.com/nelhage/reptyr): Attach a running process to a new terminal

#### Quick Reference and Cheatsheets

- [cheat](https://github.com/cheat/cheatsheets): Community-sourced cheatsheets
  Example:

  ```markdown
  ---
  syntax: bash
  tags: [ vcs, development ]
  ---
  # To stage all changes in the current directory:
  git add --all

  # To commit staged changes:
  git commit -m <message>
  ```

#### Files and Directories

- ranger: [Website](https://ranger.github.io/) | [GitHub](https://github.com/ranger/ranger)
  A VIM-inspired file manager for the console

#### GUI Interaction

- [haylxon](https://github.com/pwnwriter/haylxon): grab screenshots from terminal


#### Licensing




### Shells

```dataview
TABLE WITHOUT ID
file.link AS "Name",
url AS "Website"
WHERE contains(type,"software") and category = "shell"
```

### Terminal Emulators

- [st](https://st.suckless.org/): simple terminal implementation for X.
- xterm: ugly and old, see [[smirk#^6ffce2|st on xterm]]
- [[KDE#^57973e|Konsole (KDE)]]

```dataview
TABLE WITHOUT ID
file.link AS "Name",
url AS "Website"
WHERE contains(type,"software") and category = "terminal-emulator"
```


## Config and Environment

- [Unofficial dotfiles documentation][dotfiles-github]

## Version Control

### Git

- [[git|Notes on Git]]
- [[rug/lwp/GitLab|Notes on GitLab]]
- [[Github|Notes on GitHub]]
- [[pre-commit]]: framework for managing and maintaining multi-language pre-commit hooks
- [lefthook]: Fast and powerful Git hooks manager for any type of projects

[lefthook]: <https://github.com/evilmartians/lefthook>


## Code Quality and Static Analysis

- [analysis-tools.dev]: compare tools and linters, filter by open-source and more, user reviews
- [[codeql]]
- [Sonarqube](https://www.sonarsource.com/products/sonarqube/): has an open-source community edition

### Syntax Check, Formatting, Linting

Tags: #dev/linting

- [textlint](https://github.com/textlint/textlint): pluggable natural language linter for text and markdown
- [[prettier]]: "opinionated" formatter for different languages
- [[writing/Markdown#Linting and Style|Markdown Linters and Style]]
- [[YAML#Linting|YAML linters]]

```dataview
TABLE WITHOUT ID
("[" + title + "](" + file.path + ")") AS "Name",
"[Website](" + this.url + ")" AS "Links",
desc-short AS "Description"
WHERE contains(file.path,"lint")
```

## Build

Tags: #dev/build

- [Meson build system](https://mesonbuild.com/)
- [CMake](https://cmake.org/)
    - [CMake repo UCL](https://github.com/UCL/GreatCMakeCookOff)
- [Ninja](https://ninja-build.org/)
- [Heroku](https://www.heroku.com/): infrastructure for developers

Watch files/dirs for changes

- [Watchman](https://facebook.github.io/watchman/) | [Github](https://github.com/facebook/watchman)

### Make

See [[make]]

### [[Taskfile]]


## DevOps and CI/CD

See [[DevOps]]


## Linux

- [KIWI: command line utility to build Linux system appliances](https://osinside.github.io/kiwi/)
- [openQA: automated tests (for OSs)](command line utility to build Linux system appliances)
- [Appstream](https://www.freedesktop.org/software/appstream/docs/): Infrastructure for distro-agnostic software-centers and universal software component metadata

## Databases

See [[databases|my notes on databases]]

### Automation

<https://github.com/ReimuNotMoe/ydotool>

## Containers, VMs, etc

- [Apptainer](https://apptainer.org/): container system for secure high performance computing

### [[Podman]]

### [[Kubernetes]]

### [[Docker]]

### [[VMWare]]

### [[VirtualBox]]

## Infrastructure

### OpenStack

## Projects

See also [sw project template]

- Changelogs
    - [keepchangelog.com](https://keepachangelog.com): motivation and guidelines for changelogs
    - [gnu.org: Style of Change Logs](https://www.gnu.org/prep/standards/html_node/Style-of-Change-Logs.html)
- [Semantic Versioning: conventions for version numbers and changes](https://semver.org/)
- Readme's
    - [[writing#READMEs|my notes on writing Readme's]]
- [[#Code Quality and Static Analysis]]
- `gitignore` file: [templates on GitHub](https://github.com/github/gitignore)

Suggested files and directories

```tree
./
├── CHANGELOG
├── docs/
├── example/
├── .editorconfig
├── README
└── src/
```


### Management

[Contributer Covenant: Code of Conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct/)
[[eScienceCenter]]: [[Practical guide to Software Management Plans.pdf|Practical guide to Software Management Plans]]


## Operating Systems

- [[Debian]]
- [[Ubuntu]]

### Mobile

- [[Android]]

## [[design|UI and Design]]

### TUIs

- [Textualize](https://www.textualize.io/): [Docs](https://textual.textualize.io/) | [GitHub](https://github.com/Textualize/textual)
    Application framework for Python. Build sophisticated user interfaces with a simple Python API. Run your apps in the terminal and a web browser.
- [[rich|rich document viewer]]
- [Trogon](https://github.com/Textualize/trogon): Easily turn your [Click](https://click.palletsprojects.com) CLI into a powerful terminal application

### Media

Hosting

- https://imageshack.com/
- https://www.flickr.com/
- https://imgur.com/
- https://web.500px.com/

Free stock media

- [pixabay](https://pixabay.com): royalty-free images & stock (images, videos, music)


## Misc

- [Smallstep: automated certificate management for DevOps](https://smallstep.com/)
- [Badges for GIthub and shit](https://shields.io/)
- [GTK](https://www.gtk.org/)
- [Example files for testing and dev](https://file-examples.com/)
- <https://m2.material.io/>
- [ntfy.sh](https://ntfy.sh/): simple HTTP-based [pub-sub](https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) notification service. It allows you to send notifications to your phone or desktop via scripts from any computer, entirely **without signup, cost or setup**. It's also [open source](https://github.com/binwiederhier/ntfy) if you want to run your own.

[sw project template]: <>
[analysis-tools.dev]: <https://analysis-tools.dev/> 
[dotfiles-github]: <https://dotfiles.github.io/>
