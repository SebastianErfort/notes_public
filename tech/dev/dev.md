---
title: Development
tags:
  - dev
visibility: public
---
See also
[[public/tech/software/Software#Dev|My notes: Software - Dev]]
[[rug/lwp/GitLab#CI/CD|GitLab CI/CD]]

## Command Line

- education
    - [Software Carpentry: The Unix Shell](https://swcarpentry.github.io/shell-novice/index.html) | [![|20](github.png)](https://github.com/swcarpentry/shell-novice)

### Software

- [[linux#tmux|Tmux]]
- `screen`
- [reptyr](https://github.com/nelhage/reptyr): Attach a running process to a new terminal

#### Quick Reference and Cheatsheets

- [cheat](https://github.com/cheat/cheatsheets): Community-sourced cheatsheets
  Example:

  ```
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

## Version Control

### Git

- [[git|Notes on Git]]
- [[rug/lwp/GitLab|Notes on GitLab]]
- [[Github|Notes on GitHub]]
- [pre-commit](https://pre-commit.com/): [GitHub](https://github.com/pre-commit/pre-commit)
  > A framework for managing and maintaining multi-language pre-commit hooks.

## Syntax Check, Formatting, Linting

Tags: #dev/linting

- [prettier](https://prettier.io/): an opinionated code formatter supporting many languages (Markdown, JS, HTML, CSS, ...)
  Issues: for Markdown some problem as with [[markdownlint|markdownlint-cli]], indents under-indented content left, removing indentation
- Markdown
    - [[markdownlint]] (node.js)
- [[YAML#Linting|YAML]]

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

## Code Testing

- [CodeQL](https://codeql.github.com/) | [Docs](https://codeql.github.com/docs/)
  > Discover vulnerabilities across a codebase with CodeQL, our industry-leading semantic code analysis engine. CodeQL lets you query code as though it were data. Write a query to find all variants of a vulnerability, eradicating it forever. Then share your query to help others do the same.

    - [codeql-action](https://github.com/github/codeql-action)
      > This action runs GitHub's industry-leading semantic code analysis engine, [CodeQL](https://codeql.github.com/), against a repository's source code to find security vulnerabilities

CodeQL is free for research and open source.

- [Code Quality @GitLab](https://gitlab.com/gitlab-org/ci-cd/codequality): determine code quality using Docker image with various tools

## Linux

- [KIWI: command line utility to build Linux system appliances](https://osinside.github.io/kiwi/)
- [openQA: automated tests (for OSs)](command line utility to build Linux system appliances)
- [Semantic Versioning: conventions for version numbers and changes](https://semver.org/)
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

## Project Management

[Contributer Covenant: Code of Conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct/)
[[eScienceCenter]]: [[Practical guide to Software Management Plans.pdf|Practical guide to Software Management Plans]]

![[Android]]

## [[design|UI and Design]]

### TUIs

- [Textualize:](https://www.textualize.io/): application framework for Python. Build sophisticated user interfaces with a simple Python API. Run your apps in the terminal and a web browser.
  [Docs](https://textual.textualize.io/) | [GitHub](https://github.com/Textualize/textual)
  Examples
  
    - [[rich|rich document viewer]]
    - [Trogon](https://github.com/Textualize/trogon): Easily turn your [Click](https://click.palletsprojects.com) CLI into a powerful terminal application


## Misc

- [Smallstep: automated certificate management for DevOps](https://smallstep.com/)
- [Badges for GIthub and shit](https://shields.io/)
- [GTK](https://www.gtk.org/)
- [Example files for testing and dev](https://file-examples.com/)
- <https://m2.material.io/>
- [ntfy.sh](https://ntfy.sh/): simple HTTP-based [pub-sub](https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) notification service. It allows you to send notifications to your phone or desktop via scripts from any computer, entirely **without signup, cost or setup**. It's also [open source](https://github.com/binwiederhier/ntfy) if you want to run your own.
