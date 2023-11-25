---
title: Taskfile
type: software
category: build
url: "https://taskfile.dev/"
docs: "https://taskfile.dev/usage/"
source: "https://github.com/go-task/task"
developer: ""
desc-short: "Task is a task runner / build tool that aims to be simpler and easier to use than, for example, [GNU Make](https://www.gnu.org/software/make/).\nSince it's written in [Go](https://go.dev/), Task is just a single binary and has no other dependencies, which means you don't need to mess with any complicated install setups just to use a build tool.\nOnce [installed](https://taskfile.dev/installation/), you just need to describe your build tasks using a simple [YAML](http://yaml.org/) schema in a file called `Taskfile.yml`.\n"
tags: ""
aliases:
  - Task
img: "![|20](https://taskfile.dev/img/logo.svg)"
visibility: public
---
`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

## Intallation

- `snap install task --classic` (requires classic containment)
- [completion](https://taskfile.dev/installation/#setup-completions): install correct [completion script](https://github.com/go-task/task/tree/master/completion) and make sure it's sourced

## Variables

[Example Taskfile.yml](file://rsc/bash/Taskfile.yml)

## Merge Taskfiles

namespaces, subfolders, includes: combines Taskfiles by specifying a `Taskfile.yml`

```
version: "3"
includes:
  tf: ./taskfiles/terraform.yml
  releases: ./taskfiles/helmfile.yml
```

resulting in something like

```
$ task --list
task: Available tasks for this project:
* releases:apply:   Apply releases
* releases:diff:    Show releases diff
* tf:apply:         Apply resources creation
```

## References

- [Introduction to Taskfile](https://dev.to/stack-labs/introduction-to-taskfile-a-makefile-alternative-h92)
