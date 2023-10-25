---
tags: dev
visibility: public
---
See also
[[personal/tech/software/Software#Dev|My notes: Software - Dev]]
[[personal/tech/software/git/Gitlab#CI/CD|GitLab CI/CD]]


# Command Line
- education
  - [Software Carpentry: The Unix Shell](https://swcarpentry.github.io/shell-novice/index.html) | [![|20](github.png)](https://github.com/swcarpentry/shell-novice)

## Software

- [[linux#tmux|Tmux]]
- `screen`
- [reptyr](https://github.com/nelhage/reptyr): Attach a running process to a new terminal

### Quick Reference and Cheatsheets

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


### Files and Directories

- ranger: [Website ](https://ranger.github.io/) | [GitHub](https://github.com/ranger/ranger)
    A VIM-inspired file manager for the console


### GUI Interaction

- [haylxon](https://github.com/pwnwriter/haylxon): grab screenshots from terminal


## Shells

![[Zsh]]

## Terminal Emulators

- [st](https://st.suckless.org/): simple terminal implementation for X.
- xterm: ugly and old, see [[smirk#^6ffce2|st on xterm]]

# Git
[[git|Notes on Git]]
- [[personal/tech/software/git/Gitlab|Notes on GitLab]]
- [[Github|Notes on Github]]

# Build
#dev/build
- [Meson build system](https://mesonbuild.com/)
- [CMake](https://cmake.org/)
- [Ninja](https://ninja-build.org/)
- [Heroku](https://www.heroku.com/): infrastructure for developers

Watch files/dirs for changes
- [Watchman](https://facebook.github.io/watchman/) | [Github](https://github.com/facebook/watchman)

## Make
See [[make]]

## [[Taskfile]]


# Databases
See [[databases|my notes on databases]]

# Code Testing
- [CodeQL](https://codeql.github.com/) | [Docs](https://codeql.github.com/docs/)
  > Discover vulnerabilities across a codebase with CodeQL, our industry-leading semantic code analysis engine. CodeQL lets you query code as though it were data. Write a query to find all variants of a vulnerability, eradicating it forever. Then share your query to help others do the same.

  - [codeql-action](https://github.com/github/codeql-action)
    > This action runs GitHub's industry-leading semantic code analysis engine, [CodeQL](https://codeql.github.com/), against a repository's source code to find security vulnerabilities

CodeQL is free for research and open source.
- [Code Quality @GitLab](https://gitlab.com/gitlab-org/ci-cd/codequality): determine code quality using Docker image with various tools


# Linux

- [KIWI: command line utility to build Linux system appliances](https://osinside.github.io/kiwi/)
- [openQA: automated tests (for OSs)](command line utility to build Linux system appliances)
- [Semantic Versioning: conventions for version numbers and changes](https://semver.org/)
- [Appstream](https://www.freedesktop.org/software/appstream/docs/): Infrastructure for distro-agnostic software-centers and universal software component metadata

## Automisation
https://github.com/ReimuNotMoe/ydotool

# Containers, VMs, etc.
  - [Apptainer](https://apptainer.org/): container system for secure high performance computing

## [[Podman]]

## [[Kubernetes]]

## [[Docker]]

## [[VMWare]]

## [[VirtualBox]]


# Infrastructure

## OpenStack


# Project Management
[Contributer Covenant: Code of Conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct/)
[[eScienceCenter]]: [[Practical guide to Software Management Plans.pdf|Practical guide to Software Management Plans]]


# Android
#dev/app #dev/os/android
https://www.codingem.com/how-to-make-an-app/


## React

### Expo
[Github](https://github.com/expo/expo) | [Docs](https://docs.expo.dev/)
> Expo is an open-source platform for making universal native apps that run on Android, iOS, and the web. It includes a universal runtime and libraries that let you build native apps by writing React and JavaScript.

### Chakra UI
https://chakra-ui.com/ | [Github](https://github.com/chakra-ui/chakra-ui) | [Components](https://chakra-ui.com/docs/components)
> Chakra UI is a simple, modular and accessible component library that gives you the building blocks you need to build your React applications.

Examples:
https://codesandbox.io/examples/package/chakra-ui

## Harmony OS
https://developer.harmonyos.com/en/
- Developed by Huawei
- intended to be cross-device
- development IDE: [HUAWEI DevEco Studio](https://developer.harmonyos.com/en/develop/deveco-studio/)


# [[design|UI]]

## [[design#Icons|Icons]]


# Resources

## Google API
- [Fonts](https://developers.google.com/fonts/docs/getting_started)
  for example add stylesheet link to request web font(s)
  ```html
  <link rel="stylesheet"  href="https://fonts.googleapis.com/css?family=Font+Name">
  ```

## Icons
[Lucide open source icons](https://lucide.dev/) [![|20](github.png)](https://github.com/lucide-icons/lucide)
- used by [[Obsidian]]

# Misc
- [Smallstep: automated certificate management for DevOps](https://smallstep.com/)
- [Badges for GIthub and shit](https://shields.io/)
- [GTK](https://www.gtk.org/)
- [Example files for testing and dev](https://file-examples.com/)
- https://m2.material.io/
- [ntfy.sh](https://ntfy.sh/): simple HTTP-based [pub-sub](https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) notification service. It allows you to send notifications to your phone or desktop via scripts from any computer, entirely **without signup, cost or setup**. It's also [open source](https://github.com/binwiederhier/ntfy) if you want to run your own.
