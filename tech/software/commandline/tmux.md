---
title: tmux
type: software
url: "https://github.com/tmux/tmux/wiki"
docs: "https://github.com/tmux/tmux/wiki"
source: "https://github.com/tmux/tmux"
desc-short: "tmux is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached.\n"
config:
  path: "~/.tmux.conf"
  url: "file://.tmux.conf"
img: "<img src=\"https://avatars.githubusercontent.com/u/12054114?s=48&v=4\" style=\"width: 20px; vertical-align: middle;\"/>"
visibility: public
---

# `=this.title`

`=this.img`  `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
[Awesome Tmux](https://github.com/rothgar/awesome-tmux) #todo/tech/commandline

 `=("<a href='" + this.config.url + "'><button type='button'>Open Config</button></a>")`

`= ("> " + this.desc-short)`

## User Interface

> [!info]- Window status indicators
>
> Symbol   | Meaning
> -|-
> `*`      | Denotes the current window.
> `-`      | Marks the last window (previously selected).
> `#`      | Window is monitored and activity has been detected.
> `!`      | A bell has occurred in the window.
> `~`      | The window has been silent for the monitor-silence interval.
> `M`      | The window contains the marked pane.
> `Z`      | The window's active pane is zoomed.

## Config

<!-- `=("<a href='" + this.config.url + "'><button type='button'>Open " + this.title + " config file <code>" + this.config.path + "</code></button></a>")` -->
Open `=this.title` config file [`~/.tmux.conf`](file://.tmux.conf)

- copy+paste with mouse support: [copy+paste in tmux seanh.cc][copy-paste-tmux-seanh]

## Commands and Shortcurts

| Command | Shortcut | Description |
| ---- | ---- | ---- |
| `resize-pane -Z` | <kbd>&lt;prefix&gt; + z</kbd> | Toggle full window zoom |
| `resize-pane -x 33%` |  | change pane size to percentage of full window |

String substitution in commands

```text
A prefix of the form ‘s/foo/bar/:’ will substitute ‘foo’ with ‘bar’ throughout.
The first argument may be an extended regular expression and a final argument may be ‘i’ to ignore case, for example:
 ‘s/a(.)/\1x/i:’ would change ‘abABab’ into ‘bxBxbx’.
```

Example

```tmux
set-window-option -g window-status-format "  #{s/-/>>/:window_flags} #I #W"
```

Shell output in commands

```bash
tmux <command> "$(<shell command> '#<tmux variable>')"
```

## Plugins

## References

- [copy+paste in tmux seanh.cc][copy-paste-tmux-seanh]
- [Tmux intro @YouTube](https://www.youtube.com/watch?v=DzNmUNvnB04): config, plugins, appearance

[copy-paste-tmux-seanh]: https://www.seanh.cc/2020/12/27/copy-and-paste-in-tmux/
