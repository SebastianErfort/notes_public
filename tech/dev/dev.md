---
title: Development
tags:
  - dev
visibility: public
related:
  - "[[_software#Dev|Software Dev]]"
  - "[[git/GitLab#CI/CD|GitLab CICD]]"
  - "[[dev/Design|Design]]"
---
# Development

| Resource | References                    |
| -------- | ----------------------------- |
| My notes | `=(join(this.related, ", "))` |

**Map of Contents**

[[#Command Line|⌨️ Command Line]]
[[#Version Control|  Version Control]]
[[#build|🛠️ Build]]

---

## Command Line

- education
    - [Software Carpentry: The Unix Shell](https://swcarpentry.github.io/shell-novice/index.html) | [GitHub](https://github.com/swcarpentry/shell-novice)

### Software

- [[linux#tmux|Tmux]]
- `screen`
- [reptyr](https://github.com/nelhage/reptyr): Attach a running process to a new terminal

#### Quick Reference and Cheatsheets

- [[Cheat]]

#### Files and Directories

- ranger: [Website](https://ranger.github.io/) | [GitHub](https://github.com/ranger/ranger)
  A VIM-inspired file manager for the console

#### GUI Interaction

- [haylxon](https://github.com/pwnwriter/haylxon): grab screenshots from terminal
- xdotool


### Shells

- [[public/tech/linux/bash|bash]]

### Terminal Emulators

- alacritty
- [[kitty]]
- [[KDE#^57973e|Konsole (KDE)]]
- [st](https://st.suckless.org/): simple terminal implementation for X.
- xterm: ugly and old, see [[smirk#^6ffce2|st on xterm]]


## Config and Environment

- [Unofficial dotfiles documentation][dotfiles-github]

## Version Control

### Git

- [[_git|Notes on Git]]
- [[rug/lwp/GitLab|Notes on GitLab]]
- [[github|Notes on GitHub]]
- [[pre-commit]] framework for managing and maintaining multi-language pre-commit hooks
- [lefthook] Fast and powerful Git hooks manager for any type of projects
- [commitlint]: Lint commit messages


## Databases

See [[_databases|my notes on databases]]

### Automation

<https://github.com/ReimuNotMoe/ydotool>

## Dependencies: Supply Chain

tags: #dev/bom #dev/sbom

> A **software supply chain** is composed of the components, libraries, tools, and processes used to develop, build, and publish a software artifact.^[https://en.wikipedia.org/wiki/Software_supply_chain#cite_note-1]

- [[SPDX]] (Software Package Data Exchange)
- [[CycloneDX]]

References

- [For Good Measure Counting Broken Links: A Quant's View of Software Supply Chain Security][usenix-supply-chain]


### Depencency Update

- [Dependabot]: "Automated dependency updates built into GitHub"
- [Renovate Bot](https://docs.renovatebot.com/)

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

- [[make]]
- [CMake](https://cmake.org/)
    - [CMake repo UCL](https://github.com/UCL/GreatCMakeCookOff)
- [[Taskfile]]
- [Meson build system](https://mesonbuild.com/)
- [Ninja](https://ninja-build.org/)
- [Heroku](https://www.heroku.com/): infrastructure for developers
- [[just]]
- [Shake]

Watch files/dirs for changes

- `inotify`
- [Watchman](https://facebook.github.io/watchman/) | [Github](https://github.com/facebook/watchman)


## Languages


### Templating

- Jinja
- [Tera]: "A powerful, easy to use template engine for Rust"


## Monitoring, Logging and Metrics

- [fluentbit](https://docs.fluentbit.io/manual)
  > High Performance Telemetry Agent for Logs, Metrics and Traces


## DevOps and CI/CD

See also [[dev/devops|DevOps]].

- [to be continuous](https://to-be-continuous.gitlab.io/): [docs](https://to-be-continuous.gitlab.io/doc/)
  Guides on building (GitLab) CI/CD pipelines, e.g. suggested stages


### Platforms

- [Tekton](https://tekton.dev/) : [docs](https://tekton.dev/docs/) | [source](https://github.com/tektoncd)
  > Cloud Native CI/CD


### GitOps

- [Fleet]
  > Deploy workloads from Git to large fleets of Kubernetes clusters

## Containers, VMs, etc

- [Apptainer](https://apptainer.org/): container system for secure high performance computing
- build container images for various architectures: [[Podman#^35f333|podman-farm]]

### [[Podman]]

### [[public/tech/dev/Kubernetes]]

### [[Docker]]

### [[VMWare]]

### [[VirtualBox]]

## Linux

- [KIWI: command line utility to build Linux system appliances](https://osinside.github.io/kiwi/)
- [openQA: automated tests (for OSs)](command line utility to build Linux system appliances)
- [Appstream](https://www.freedesktop.org/software/appstream/docs/): Infrastructure for distro-agnostic software-centers and universal software component metadata

## Operating Systems

- [[public/tech/linux/Debian]]
- [[Ubuntu]]

### Mobile

- [[Android]]

## Infrastructure

### OpenStack


## Cloud

- [[aws]]
- [[azure]]
- [[GCP]]


## Projects

See also [software project template][sw-proj-template]

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
├── src/
└── test/
```


### Management

- versioning
    - [asdf](https://asdf-vm.com/): multiple runtime version manager
- contributing
    - [Contributer Covenant: Code of Conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct/)
    - [[eScienceCenter]]: [[Practical guide to Software Management Plans.pdf|Practical guide to Software Management Plans]]


## [[design|UI and Design]]

### TUIs

- [Textualize](https://www.textualize.io/): [Docs](https://textual.textualize.io/) | [GitHub](https://github.com/Textualize/textual)
    Application framework for Python. Build sophisticated user interfaces with a simple Python API. Run your apps in the terminal and a web browser.
- [[rich|rich document viewer]]
- [Trogon](https://github.com/Textualize/trogon): Easily turn your [Click](https://click.palletsprojects.com) CLI into a powerful terminal application

### Media

Hosting

- <https://imageshack.com/>
- <https://www.flickr.com/>
- <https://imgur.com/>
- <https://web.500px.com/>

Free stock media

- [pixabay](https://pixabay.com): royalty-free images & stock (images, videos, music)


## Misc

- [Smallstep: automated certificate management for DevOps](https://smallstep.com/)
- [Badges for GIthub and shit](https://shields.io/)
- [GTK](https://www.gtk.org/)
- [Example files for testing and dev](https://file-examples.com/)
- <https://m2.material.io/>
- [ntfy.sh](https://ntfy.sh/): simple HTTP-based [pub-sub](https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) notification service. It allows you to send notifications to your phone or desktop via scripts from any computer, entirely **without signup, cost or setup**. It's also [open source](https://github.com/binwiederhier/ntfy) if you want to run your own.


## References

[sw-proj-template]: <https://gitlab.com/treetanium1/resources/project/template>
[analysis-tools.dev]: <https://analysis-tools.dev/>
[lefthook]: <https://github.com/evilmartians/lefthook>
[dotfiles-github]: <https://dotfiles.github.io/>
[usenix-supply-chain]: <https://www.usenix.org/system/files/login/articles/login_winter20_17_geer.pdf>
[shake]: <https://shakebuild.com/>
[tera]: <https://keats.github.io/tera/>
[commitlint]: <https://commitlint.js.org/>
[dependabot]: <https://github.com/dependabot>
[fleet]: <https://fleet.rancher.io/>
