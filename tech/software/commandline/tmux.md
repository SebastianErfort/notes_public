---
title: tmux
type: software
category: ""
url: https://github.com/tmux/tmux/wiki
docs: https://github.com/tmux/tmux/wiki
source: https://github.com/tmux/tmux
developer: ""
desc-short: "tmux is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached."
tags: 
config:
  path: ~/.tmux.conf
  url: file://.tmux.conf
img: '<img src="https://avatars.githubusercontent.com/u/12054114?s=48&v=4" style="width: 20px; vertical-align: middle;"/>'
---
# `=this.title`

`=this.img`  `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`


## Config

 <!-- `=("<a href='" + this.config.url + "'><button type='button'>Open " + this.title + " config file <code>" + this.config.path + "</code></button></a>")` -->
Open `=this.title` config file [`~/.tmux.conf`](file://.tmux.conf)

- copy+paste with mouse support: [copy+paste in tmux seanh.cc]


## Commands and Shortcurts

Command | Shortcut | Description
-|-|-
`resize-pane -Z` | <kbd>&lt;prefix&gt; + z</kbd> | Toggle full window zoom


## Plugins


## References

- [copy+paste in tmux seanh.cc]

[copy+paste in tmux seanh.cc]: https://www.seanh.cc/2020/12/27/copy-and-paste-in-tmux/
